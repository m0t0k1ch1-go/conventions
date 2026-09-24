# Conventions in m0t0k1ch1-go

m0t0k1ch1-go 配下の Go リポジトリで共有する規約と設定。

## 構成

- `template/`：各 Go リポジトリへ配布するファイル。消費側リポジトリのルートの鏡。
  - `CONVENTIONS.md`：コーディング規約。
  - `staticcheck.conf`：staticcheck の設定。
  - `conventions.mk`：共有する make ターゲット。
  - `package.json`, `pnpm-lock.yaml`：開発用の Node 依存。
  - `.husky/commit-msg`, `commitlint.config.ts`：Conventional Commits を強制する commit-msg hook とその設定。
- その他：このリポジトリ自身の開発用設定。

## 使い方

消費側リポジトリでは `template/` の内容をルートにコピーし、`CLAUDE.md`（または `AGENTS.md`）から `@CONVENTIONS.md` で参照したうえで、リポジトリ固有の記述を続ける。同期の仕組みは今後追加する。

消費側リポジトリの Makefile は `include conventions.mk` の 1 行と、そのリポジトリ固有のターゲットだけを書く。`conventions.mk` にあるターゲット名は再定義しない。`lint` と `test` はリポジトリごとに定義する。未定義のまま実行すると `conventions.mk` がエラーで止める。

このリポジトリ自身も template の消費者で、ルートの `package.json`・`pnpm-lock.yaml`・`.husky/commit-msg`・`commitlint.config.ts` は template のコピー。
