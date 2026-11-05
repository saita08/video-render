---
name: write-adr
description: Records an architecture decision in adr/ before the implementation lands, and moves docs/ and the indexes in the same change. Use when a choice is being made that a future reader could not reconstruct — a structure, a data format, a stack, a distribution mechanism — or when a change to the repository's structure is about to start. Triggers on "ADR を書いて", "この判断を残して", "なぜこうしたか", "構成を変える", "write an ADR", "record this decision".
---

# ADR を書く

これが済むと、判断は代わりの案がまだ生きているうちに記録され、それが形づくるページはどれも同じ事を言う。

1. 次の番号を決める。`adr/` を見て、いちばん大きい `NNNN` に一を足す。
2. `adr/template.md` を `adr/NNNN-<選んだ事を一句で>.md` に写す。題は話題でなく、選んだ事を言う。タイトルは英語、本文は日本語。
3. Context、Decision、Consequences、Alternatives Considered を埋める。代わりの案にはそれぞれ捨てた理由を付ける。案が分からない時は、他に何が挙がっていたかを持ち主に聞く。埋めるために作らない。
4. Status は `Proposed` にする。持ち主が受け入れたら `Accepted` にし、その後は本文を書き換えない。
5. `adr/README.md` の一覧に行を足す。
6. 前の記録を置き換える時は、前の記録の Status を `Superseded by ADR-NNNN` にし、一覧の行も直し、二つを互いにリンクする。前の本文はそのまま残す。
7. 同じ変更で、判断が形づくる `docs/` のページを直し、Consequences からリンクし、そのページから記録へリンクする。ページを足したり消したりしたら `docs/README.md` の表を直す。
8. それから実装する。

確かめ: 上で書いたリンクがどれも開け、`adr/README.md` の一覧がディスクの記録とちょうど同じである。

この手順が仕える決まり: [adr/README.md](../../../adr/README.md)。
