.PHONY: setup
setup: deps/node

.PHONY: deps/node
deps/node:
	pnpm install --frozen-lockfile

.PHONY: commit
commit:
	pnpm czg

# lint と test は消費側の Makefile で定義する。未定義のまま実行されたときに分かりやすく失敗させる。
.DEFAULT:
	$(error target '$@' is not defined in Makefile (lint and test are required))
