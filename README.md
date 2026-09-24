# Conventions of m0t0k1ch1-go

`m0t0k1ch1-go` 配下の Go リポジトリで共有する規約。

## 構成

- `template/` — 各 Go リポジトリへ配布するファイル。消費側リポジトリのルートの鏡になっており、`template/` をルートにコピーすれば最新になり、`diff -r` で差分（ドリフト）が分かる。
  - `CONVENTIONS.md` — 人とコーディングエージェントのためのコーディング規約。優先順位付きの三大指針（Stay Consistent > Fail Fast > Keep Minimal）、`make lint` / `make test` を通すという前提、指針ごとの規則からなる。
  - `staticcheck.conf` — 共有の staticcheck 設定。
- ルート直下のその他のファイルは、このリポジトリ自身の開発用設定。

## 使い方

消費側リポジトリでは `CONVENTIONS.md` をルートに置き、`CLAUDE.md`（または `AGENTS.md`）から `@CONVENTIONS.md` のように参照したうえで、リポジトリ固有の記述を続ける。同期の仕組みは今後追加する。
