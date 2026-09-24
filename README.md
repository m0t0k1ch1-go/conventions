# Conventions in m0t0k1ch1-go

m0t0k1ch1-go 配下の Go リポジトリで共有する規約と設定。

## 構成

- `template/`：各 Go リポジトリへ配布するファイル。消費側リポジトリのルートの鏡。
  - `.husky/commit-msg`：commitlint を実行する commit-msg hook。
  - `CONVENTIONS.md`：コーディング規約。
  - `commitlint.config.ts`：commitlint の設定。
  - `conventions.mk`：共有する make ターゲット。
  - `package.json`：開発に使う npm パッケージの定義。
  - `pnpm-lock.yaml`：`package.json` のロックファイル。
  - `staticcheck.conf`：staticcheck の設定。
- その他：このリポジトリ自身の開発用設定。

## 使い方

消費側リポジトリでは `template/` の内容をルートにコピーし、次を行う。

- `CLAUDE.md`（または `AGENTS.md`）から `@CONVENTIONS.md` を参照し、リポジトリ固有の記述を続ける。
- `Makefile` に `include conventions.mk` を書き、リポジトリ固有のターゲットを続ける。`conventions.mk` にあるターゲット名は再定義しない。`lint` と `test` は必ず定義する。

`template/` の `.husky/commit-msg`・`commitlint.config.ts`・`package.json`・`pnpm-lock.yaml` は、このリポジトリのルートにある同名ファイルへの symlink。同期時は symlink を実体化してコピーする。
