# Conventions in m0t0k1ch1-go

m0t0k1ch1-go 配下の Go リポジトリで共有する規約。

## 構成

- `template/`：各 Go リポジトリへ配布するファイル。消費側リポジトリのルートの鏡。
  - `CONVENTIONS.md`：コーディング規約。
  - `staticcheck.conf`：staticcheck の設定。
- その他：このリポジトリ自身の開発用設定。

## 使い方

消費側リポジトリでは `template/` の内容をルートにコピーし、`CLAUDE.md`（または `AGENTS.md`）から `@CONVENTIONS.md` で参照したうえで、リポジトリ固有の記述を続ける。同期の仕組みは今後追加する。
