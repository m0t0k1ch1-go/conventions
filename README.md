# Conventions of m0t0k1ch1-go

Shared conventions for the Go repositories under `m0t0k1ch1-go`.

## Layout

- `template/` — files distributed to every Go repository. The directory mirrors a consumer repository's root: copying `template/` onto a repository's root brings it up to date, and `diff -r` against it shows drift. Only files whose dependencies are self-contained in this repository are included.
  - `CONVENTIONS.md` — coding conventions for humans and coding agents: three prioritized principles (Stay Consistent > Fail Fast > Keep Minimal), the `make lint` / `make test` prerequisite, and per-principle rules.
  - `staticcheck.conf` — shared staticcheck configuration.
  - `.husky/commit-msg`, `commitlint.config.ts`, `package.json`, `pnpm-lock.yaml` — shared commit-message tooling (husky + commitlint + czg).
- Everything else at the root is this repository's own development setup.

## Usage

In a consumer repository, keep `CONVENTIONS.md` at the root and reference it from `CLAUDE.md` (or `AGENTS.md`) with an import line such as `@CONVENTIONS.md`, followed by repository-specific notes. Synchronization tooling will be added later.
