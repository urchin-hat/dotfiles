# dotfiles

macOS、Linux、Windowsのユーザー設定ファイルを[chezmoi](https://www.chezmoi.io/)で管理するリポジトリです。

> [!IMPORTANT]
> このリポジトリはdotfilesだけを管理します。パッケージ、GUIアプリケーション、OS設定、サービス、管理者権限が必要な変更は管理せず、別のAnsibleリポジトリで扱います。

## 管理範囲

| 管理するもの | 管理しないもの |
| --- | --- |
| シェルのユーザー設定 | パッケージのインストール |
| Gitのユーザー設定 | MacPorts、DNF、wingetの操作 |
| Ghostty、Neovim、Starshipなどの設定 | GUIアプリケーションのインストール |
| OSや用途に応じた設定ファイルの生成 | OS設定、サービス、管理者権限が必要な変更 |

マシン構築はAnsibleで行い、導入済みツールの設定をchezmoiで配置する方針です。

## 対応環境

| OS | Architecture | Shell | Package manager（Ansible側） |
| --- | --- | --- | --- |
| macOS | arm64 | zsh | MacPorts |
| RHEL系Linux | arm64 | Bash | DNF |
| RHEL系Linux | amd64 | Bash | DNF |
| Windows 11 | amd64 | PowerShell | winget |

上記以外の環境は、明示的に対応を追加するまで対象外です。

## 設計方針

- 共通設定を基本とし、OSごとの差分だけをテンプレートまたは `.chezmoiignore` で表現します。
- 端末名ではなく、`personal`、`work`、`server`、`minimal` のマシンプロファイルで用途を表現します。
- CPUアーキテクチャはchezmoiの `.chezmoi.arch` を使用します。
- シェルとパッケージマネージャーはOSごとに固定し、不要な選択肢を持たせません。
- ホームディレクトリに配置するファイルは `home/` の下だけで管理します。
- chezmoiはユーザー設定ファイルの管理に限定します。
- パッケージ、OS設定、サービスは別のAnsibleリポジトリで管理します。
- 秘密情報はGitへ平文で保存しません。

詳しい判断基準は [docs/architecture.md](docs/architecture.md) を参照してください。

## ディレクトリ構成

```text
.
├── .chezmoiroot
├── AGENTS.md
├── README.md
├── docs/
│   ├── architecture.md
│   ├── bootstrap.md
│   └── security.md
└── home/
    ├── .chezmoi.toml.tmpl
    ├── .chezmoiignore
    ├── .chezmoitemplates/
    ├── dot_config/
    │   ├── ghostty/
    │   ├── nvim/
    │   └── starship.toml
    └── ...
```

`.chezmoiroot` が `home` を指定しているため、リポジトリ直下のREADMEや設計文書はホームディレクトリへ展開されません。

## 初期化

chezmoiをインストールした後、リポジトリを指定して初期化します。

```sh
chezmoi init <repository>
```

初期化時にマシンプロファイルを選択します。

適用前に、必ず差分を確認します。

```sh
chezmoi doctor
chezmoi diff
chezmoi apply --dry-run --verbose
```

問題がなければ適用します。

```sh
chezmoi apply
```

初期化と適用の詳細は [docs/bootstrap.md](docs/bootstrap.md) を参照してください。

## 日常の更新

管理対象を編集する場合は、可能な限りchezmoi経由で行います。

```sh
chezmoi edit ~/.zshrc
chezmoi diff
chezmoi apply
```

source stateを直接編集した場合も、適用前に `chezmoi diff` で確認してください。

## Ansibleとの責務分担

このリポジトリは、既に導入されているツールのユーザー設定だけを管理します。次の処理はchezmoiへ追加せず、別のAnsibleリポジトリで管理します。

- パッケージとGUIアプリケーションのインストール
- パッケージリポジトリの登録
- OS全体の設定
- サービスの導入、起動、有効化
- 管理者権限を必要とする変更

chezmoiのテンプレートでは、対象ツールが未導入でもシェル起動などが失敗しないように存在確認を行います。

## 秘密情報

認証情報、秘密鍵、アクセストークンなどを平文でコミットしてはいけません。採用するパスワードマネージャーまたは暗号化方式は、必要な秘密情報が明確になった時点で決定します。

詳細は [docs/security.md](docs/security.md) を参照してください。

## Git運用

- デフォルトブランチは将来的に `main` へ統一します。
- 通常の変更は目的ごとに短命なブランチを作ります。
- コミットには1つの論理的な変更だけを含めます。
- コミット前にテンプレートと各対象OS向けの生成結果を検証します。
- `chezmoi apply` によるローカル環境の変更は、コミットやCIの必須処理にしません。

現在の再構築作業は `feat/chezmoi-rebuild` ブランチで進めます。
