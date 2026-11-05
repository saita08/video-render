# 0001. Record architecture decisions

- Status: Accepted
- Date: 2026-11-05

## Context

このリポジトリは小さいが、秘密の扱い、ログに何を出すか、書き出す元をどう足すかといった、後から「なぜこうなっているのか」と問われる選択だけでできている。その理由はワークフローの YAML にもコミットにも残らない。理由を知らずに「デバッグしやすいようにログを出そう」とすれば、この公開リポジトリの前提が崩れる。

## Decision

設計判断を `adr/` に `NNNN-<選んだ事>.md` の連番で残す。各記録は Status、Date、Context、Decision、Consequences、Alternatives Considered を持つ。タイトルは英語、本文は日本語。

## Consequences

- 判断を変える時、捨てた案とその理由から始められる。
- 判断のたびに書く手間を引き受ける。
- 運用は [adr/README.md](README.md)。

## Alternatives Considered

- **記録しない**: 手間は無いが、ログを絞った理由のような前提が、善意の変更で消える。
- **コミットメッセージにだけ書く**: 判断ごとに引けず、置き換えの関係を表せない。
- **README に理由も書く**: 今の姿が変わるたびに理由まで書き換わり、履歴が消える。
