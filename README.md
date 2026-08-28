# betyourluck/homebrew-tap

A Homebrew tap for [Outcasts](https://outcasts.jp) software.

## Casks

| | |
|---|---|
| [`fuseforks`](Casks/fuseforks.rb) | [Outcasts Fuseforks](https://github.com/betyourluck/Fuseforks) — multi-agent AI orchestration for the desktop |
| [`lorekeel`](Casks/lorekeel.rb) | [Outcasts Lorekeel](https://github.com/betyourluck/Lorekeel) — a TRPG game master with a deterministic engine and an LLM narrator |

```sh
brew install --cask betyourluck/tap/fuseforks
brew install --cask betyourluck/tap/lorekeel
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

**Lorekeel was called `kataribe` until v0.5.16.** It was renamed because an
unrelated TRPG project already went by that name. `brew update` migrates the old
cask automatically, so there is nothing to do by hand. The application itself
carries your saves and API keys over on first launch and leaves the old data
folder in place; on macOS your in-app settings (registered models, package
folders, image generation) are not carried over and need to be set again.

**macOS is Apple Silicon only.** There is no Intel build. Both apps are signed
with a Developer ID certificate and notarized by Apple, so they open without a
Gatekeeper prompt — Fuseforks from v0.1.9, Lorekeel from v0.5.16 (as `kataribe`).
Earlier releases of either carry only a linker ad-hoc signature and are refused
once Homebrew applies its quarantine.

`brew uninstall --cask <name>` removes the application and leaves your data in
place: your village for Fuseforks (agents, conversations, workspace), your saves,
downloaded packages and API keys for Lorekeel. `brew uninstall --zap --cask <name>`
deletes that too — see the `zap` stanza in each cask for the exact paths.

---

## 日本語

[Outcasts](https://outcasts.jp) のソフトウェア向けの Homebrew tap です。

```sh
brew install --cask betyourluck/tap/fuseforks
brew install --cask betyourluck/tap/lorekeel
```

| | |
|---|---|
| [`fuseforks`](Casks/fuseforks.rb) | [Outcasts Fuseforks](https://github.com/betyourluck/Fuseforks) — デスクトップのマルチエージェント AI オーケストレーション |
| [`lorekeel`](Casks/lorekeel.rb) | [Outcasts Lorekeel](https://github.com/betyourluck/Lorekeel) — 決定論エンジンと LLM ナレーターによる TRPG ゲームマスター |

**完全修飾名は省略できません。** tap しただけでは Homebrew はそのリポジトリの
コードを読み込む許可を得ないので、短い名前で入れようとすると「信頼されていない
tap」として拒否されます。完全修飾で書くと**その cask だけ**を信頼したことになります。
短い名前で使いたい場合は、先に信頼を与えてください:

```sh
brew trust --cask betyourluck/tap/fuseforks
brew install --cask fuseforks
```

**Lorekeel は v0.5.16 まで `kataribe` という名前でした。** 同名の無関係な TRPG
プロジェクトが既にあったため改名しています。旧 cask は `brew update` で自動的に
移行するので、手作業は要りません。アプリ側もセーブと API キーは初回起動時に
引き継ぎ、以前のデータフォルダはそのまま残します。ただし **macOS ではアプリ内の
設定**（登録した AI モデル・パッケージフォルダ・画像生成の設定）は引き継がれず、
設定し直しになります。

**macOS は Apple Silicon 専用**で、Intel 版はありません。どちらのアプリも
Developer ID で署名され Apple の公証を通しているので、Gatekeeper に止められずに
開きます（Fuseforks は v0.1.9 から、Lorekeel は v0.5.16 から＝当時の名前は
`kataribe`）。それ以前の版はリンカのアドホック署名しか持たないため、Homebrew が
付ける検疫属性の下では拒否されます。

`brew uninstall --cask <名前>` はアプリだけを消し、**データは残します** —
Fuseforks は村（サーヴァント・会話・作業フォルダ）、Lorekeel はセーブデータ・
取得したパッケージ・API キーです。`--zap` を付けるとそれらも消えます。
対象のパスは各 cask の `zap` を参照してください。
