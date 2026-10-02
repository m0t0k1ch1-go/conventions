# Conventions in m0t0k1ch1-go

m0t0k1ch1-go 配下の Go リポジトリで共有する規約と設定。

## 構成

- `template/`：各 Go リポジトリへ配布するファイル。消費側リポジトリのルートの鏡。
  - `.husky/commit-msg`：commitlint を実行する `commit-msg` フック。
  - `CONVENTIONS.md`：コーディング規約。
  - `commitlint.config.ts`：commitlint の設定。
  - `conventions.mk`：共有する make ターゲット。
  - `package.json`：開発に使う npm パッケージの定義。
  - `pnpm-lock.yaml`：`package.json` のロックファイル。
  - `staticcheck.conf`：staticcheck の設定。
- その他：このリポジトリ自身の開発用設定。

## 使い方

消費側リポジトリでは、**同期** の項の手順で `template/` の内容を取り込み、初回は加えて次を行う。

- `CLAUDE.md`（または `AGENTS.md`）から `@CONVENTIONS.md` を参照し、リポジトリ固有の記述を続ける。
- `Makefile` に `include conventions.mk` を書き、リポジトリ固有のターゲットを続ける。`conventions.mk` にあるターゲット名は再定義しない。`lint` と `test` は必ず定義する。

## 同期

`template/` を更新したら、各消費側リポジトリごとに次の手順で同期を行う。

1. このリポジトリの main ブランチをクローンする（例：`git clone --depth 1 https://github.com/m0t0k1ch1-go/conventions /tmp/conventions`）。
2. 消費側リポジトリのルートで `cp -RL /tmp/conventions/template/. .` を実行する（シンボリックリンクは実体化される）。
3. `git status` で、変更されたファイルが `template/` にあるものだけであることを確認する。
4. `chore: sync conventions` のようなコミットを作り、PR を出す。

## 保守

このリポジトリを更新するときの決まり。

- `CONVENTIONS.md` の規則には、指針ごとの接頭辞付きの番号を振る（Stay Consistent は `SC-1`、Fail Fast は `FF-1`、Keep Minimal は `KM-1` のように）。一度振った番号は変えず、規則を削除したときはその番号を欠番にする。
- 文中の用語はカタカナで書く。英語のまま書くのは、固有名詞（GitHub、Go、godoc、staticcheck など）、略語（API、CI、PR など）、コードや識別子（バッククォートで囲む）、訳語もカタカナ表記も定着していない専門用語（例：sentinel）に限る。略語が定着している用語は略語を使う（Pull Request ではなく PR）。既に記載のある用語は、その表記に揃える。
- 文章は、多少冗長になっても、初めて読む人が一読で誤解なく意味を取れるように書く。短く書くことより、意味が一通りにしか読めないことを優先する。主語や目的語、「〜する」「〜しない」といった述語を省略しない。「それ」「これ」などの指示語は、何を指すかが直前の文から明らかな場合に限って使う。体言止め、名詞の羅列、矢印（→）などの記号で文の代わりをしない。例：「PR 作成後、本文確認」ではなく「PR を作成した直後に、本文を読み直す」と書く。
