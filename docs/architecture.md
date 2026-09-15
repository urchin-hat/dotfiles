# Architecture

## 目的

1つのchezmoiリポジトリから、macOS arm64、RHEL系Linux arm64/amd64、Windows 11 amd64へ安全に設定を展開します。共通部分を保ちながら、OS、CPU、端末用途の差を明示的に扱います。

## source stateの分離

リポジトリルートの `.chezmoiroot` で `home` を指定します。

```text
repository root
├── README.md          # 配置されない
├── AGENTS.md          # 配置されない
├── docs/              # 配置されない
└── home/              # chezmoi source state
```

これにより、ドキュメントやCI設定を `.chezmoiignore` へ列挙する必要がなくなります。

## 差分を表現する優先順位

差分は次の順に検討します。

1. すべての環境で同じ通常ファイル
2. 1ファイル内の小さな `.tmpl` 条件分岐
3. `.chezmoitemplates/` による共通内容の再利用
4. `.chezmoiignore` によるファイルまたはディレクトリ単位の除外
5. OS専用ファイル

OSごとに設定ツリー全体を複製する構成は採用しません。

## 分岐軸

chezmoi組み込み値を使用します。

- `.chezmoi.os`: `darwin`、`linux`、`windows`
- `.chezmoi.arch`: `arm64`、`amd64`

端末用途は初期化時に選択する `profile` で表現します。

- `personal`: 個人所有の対話端末
- `work`: 業務用端末
- `server`: GUIを前提としない常設環境
- `minimal`: コンテナや一時環境向けの最小構成

ホスト名は端末の置換や名前変更に弱いため、原則として分岐に使用しません。

## Ansibleとの責務分担

このリポジトリは、ユーザーのホームディレクトリに配置する設定ファイルだけを管理します。マシンの構築とソフトウェアの導入は別のAnsibleリポジトリで管理します。

| Responsibility | Owner |
| --- | --- |
| dotfilesの生成と配置 | chezmoi |
| OS・用途ごとの設定ファイル差分 | chezmoi |
| パッケージとGUIアプリの導入 | Ansible |
| MacPorts、DNF、wingetの操作 | Ansible |
| OS設定とサービス管理 | Ansible |
| 管理者権限が必要な変更 | Ansible |

chezmoiはツールの導入を前提条件として強制しません。たとえばStarshipの初期化は、コマンドが存在する場合だけシェル設定から呼び出します。

chezmoiのスクリプト機能は原則使用しません。設定ファイルの配置だけでは実現できない要求が生じた場合に、責務の境界を再検討します。

## 保留中の設計判断

- Gitの署名方式（SSH、GPG、未使用）
- 秘密情報を取得するパスワードマネージャー
- Neovimプラグインのロックファイルを追跡するか
- WindowsでWSLをWindowsとは別ターゲットとして扱うか

## シェル

| OS | Shell | 主な配置先 |
| --- | --- | --- |
| macOS | zsh | `~/.zshenv`、`~/.zprofile`、`~/.zshrc` |
| RHEL系Linux | Bash | `~/.bash_profile`、`~/.bashrc` |
| Windows 11 | PowerShell | PowerShell profile |

共通の環境変数やエイリアスであっても、異なるシェル構文を無理に1つのテンプレートへ統合しません。Starshipなどツール自体が共通化を担える部分は、そのツール側へ寄せます。
