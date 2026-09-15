# Bootstrap

## 安全方針

初期化、差分確認、dry-run、実適用を別の操作として扱います。`chezmoi init --apply` は、構成が安定するまで標準手順にしません。

## 1. chezmoiの導入

chezmoi自体のインストールを含むパッケージ導入は、別のAnsibleリポジトリで行います。Ansibleによる構築後、chezmoiのバージョンを確認します。

```sh
chezmoi --version
```

WindowsではPowerShellから同等のコマンドを実行します。

## 2. source stateの初期化

```sh
chezmoi init <repository>
```

対話形式でマシンプロファイルを選択します。

この段階ではホームディレクトリの管理対象ファイルは変更されません。

## 3. 確認

```sh
chezmoi doctor
chezmoi data
chezmoi managed
chezmoi diff
chezmoi apply --dry-run --verbose
```

意図しない削除、秘密情報、端末固有パスが差分に含まれていないことを確認します。

## 4. 適用

```sh
chezmoi apply
```

## 5. 更新

```sh
chezmoi update
```

`chezmoi update` はリポジトリの更新後に変更を適用し得るため、運用が固まるまでは `git pull`、`chezmoi diff`、`chezmoi apply` を個別に実行する方が安全です。

## 開発中の検証

このリポジトリ自体で構成を開発するときは、実ホームディレクトリへの `chezmoi apply` を自動実行しません。必要に応じて一時ディレクトリをdestinationに指定し、生成結果を検証します。
