# 0004. Keep only the procedures Claude runs here

- Status: Accepted
- Date: 2026-11-05
- Deciders: Tsukasa

## Context

[ADR-0002](0002-adopt-shelved-documentation.md) で、ほかのリポジトリと同じ三つの手順（shelve-knowledge、write-adr、close-notes）を置いた。スキルは Claude が動くための物で、Claude がその作業をしないなら読み込まれるだけの荷物になる（2026-11-05 Tsukasa「そんなスキル要らんやろってものが多い」）。このリポジトリには notes/ が無く、作業を閉じる時に片付ける物が無い。書き出しを頼む手順は、走らせる側の remotion-movie-studio のスキル render-a-video にある。

## Decision

`.claude/skills/` には、このリポジトリで Claude が実際にする作業の手順だけを置く。今は shelve-knowledge と write-adr。close-notes は外す。notes/ を使い始めたら戻す。

## Consequences

- 手順の表は [docs/README.md](../docs/README.md) にある。
- 人が画面でする事（トークンの作り直し）は、スキルにせず [docs/render.md](../docs/render.md) に事実として書く。

## Alternatives Considered

- **三つとも置いたままにする**: 使わない手順が毎回の会話に並ぶ。
- **書き出しの頼み方もここにスキルとして置く**: 頼むのは remotion-movie-studio で作業する Claude で、そこに同じ手順があり、二か所になる。
