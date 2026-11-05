# Architecture Decision Records

このディレクトリは video-render の設計判断を時系列で記録する。各レコードは「なぜそう決めたか」を残すためのもので、「今どうなっているか」は `docs/` に書く。同じ中身を両方には書かない。

## 書く時

後から読んだ人が理由を辿れなくなる選択をした時。書き出す元の足し方、秘密の扱い、出す場所、引き金などが当たる。小さな実装の細部は書かない。実装の前に書き、`docs/` と互いにリンクする。後から書いた記録は、その時に生きていた代わりの案を失っている。

新しい記録は [template.md](template.md) を写して番号を振る。タイトルは英語、本文は日本語。

## 状態

- `Proposed` — 話し合っている
- `Accepted` — 採った。実装はこれに乗る
- `Superseded by ADR-XXXX` — 後の記録に置き換えられた。本文は履歴として残す
- `Deprecated` — 置き換え先なしでやめた

採った記録は書き換えない。判断が変わったら新しい記録を書き、古い方を Superseded にし、二つを互いにリンクする。

## 一覧

| # | タイトル | 状態 |
|---|---|---|
| [0001](0001-record-architecture-decisions.md) | Record architecture decisions | Accepted |
| [0002](0002-adopt-shelved-documentation.md) | Adopt the shelved documentation contract | Accepted |
| [0003](0003-render-private-repos-on-a-public-repos-actions.md) | Render private repos on a public repo's Actions | Accepted |
