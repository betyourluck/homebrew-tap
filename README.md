# betyourluck/homebrew-tap

A Homebrew tap for [Outcasts](https://outcasts.jp) software.

## Casks

| | |
|---|---|
| [`fuseforks`](Casks/fuseforks.rb) | [Outcasts Fuseforks](https://github.com/betyourluck/Fuseforks) — multi-agent AI orchestration for the desktop |
| [`kataribe`](Casks/kataribe.rb) | [Kataribe](https://github.com/betyourluck/Kataribe) — a TRPG game master with a deterministic engine and an LLM narrator |

```sh
brew install --cask betyourluck/tap/fuseforks
brew install --cask betyourluck/tap/kataribe
```

The fully qualified name is not optional. Tapping a repository does not grant
Homebrew permission to load code from it, so `brew tap` followed by the short
name is refused as an untrusted tap. Naming the cask in full trusts that one
cask and nothing else. If you would rather use the short name, grant trust
explicitly first:

```sh
brew trust --cask betyourluck/tap/fuseforks
brew install --cask fuseforks
```

**macOS is Apple Silicon only.** There is no Intel build. Both apps are signed
with a Developer ID certificate and notarized by Apple, so they open without a
Gatekeeper prompt — Fuseforks from v0.1.9, Kataribe from v0.5.16. Earlier
releases of either carry only a linker ad-hoc signature and are refused once
Homebrew applies its quarantine.

`brew uninstall --cask <name>` removes the application and leaves your data in
place: your village for Fuseforks (agents, conversations, workspace), your saves,
downloaded packages and API keys for Kataribe. `brew uninstall --zap --cask <name>`
deletes that too — see the `zap` stanza in each cask for the exact paths.

---

## 日本語

[Outcasts](https://outcasts.jp) のソフトウェア向けの Homebrew tap です。

```sh
brew install --cask betyourluck/tap/fuseforks
brew install --cask betyourluck/tap/kataribe
```

| | |
|---|---|
| [`fuseforks`](Casks/fuseforks.rb) | [Outcasts Fuseforks](https://github.com/betyourluck/Fuseforks) — デスクトップのマルチエージェント AI オーケストレーション |
| [`kataribe`](Casks/kataribe.rb) | [Kataribe（語り部）](https://github.com/betyourluck/Kataribe) — 決定論エンジンと LLM ナレーターによる TRPG ゲームマスター |

**完全修飾名は省略できません。** tap しただけでは Homebrew はそのリポジトリの
コードを読み込む許可を得ないので、短い名前で入れようとすると「信頼されていない
tap」として拒否されます。完全修飾で書くと**その cask だけ**を信頼したことになります。
短い名前で使いたい場合は、先に信頼を与えてください:

```sh
brew trust --cask betyourluck/tap/fuseforks
brew install --cask fuseforks
```

**macOS は Apple Silicon 専用**で、Intel 版はありません。どちらのアプリも
Developer ID で署名され Apple の公証を通しているので、Gatekeeper に止められずに
開きます（Fuseforks は v0.1.9 から、Kataribe は v0.5.16 から）。それ以前の版は
リンカのアドホック署名しか持たないため、Homebrew が付ける検疫属性の下では拒否されます。

`brew uninstall --cask <名前>` はアプリだけを消し、**データは残します** —
Fuseforks は村（サーヴァント・会話・作業フォルダ）、Kataribe はセーブデータ・
取得したパッケージ・API キーです。`--zap` を付けるとそれらも消えます。
対象のパスは各 cask の `zap` を参照してください。
