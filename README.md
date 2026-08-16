# betyourluck/homebrew-tap

A Homebrew tap for [Outcasts](https://outcasts.jp) software.

## Casks

| | |
|---|---|
| [`fuseforks`](Casks/fuseforks.rb) | [Outcasts Fuseforks](https://github.com/betyourluck/Fuseforks) — multi-agent AI orchestration for the desktop |

```sh
brew install --cask betyourluck/tap/fuseforks
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

**macOS is Apple Silicon only.** There is no Intel build. The `.app` is signed
with a Developer ID certificate and notarized by Apple from v0.1.9 onward, so it
opens without a Gatekeeper prompt.

`brew uninstall --cask fuseforks` removes the application. It leaves your village
(agents, conversations, workspace) in place. `brew uninstall --zap --cask fuseforks`
deletes that too — see the `zap` stanza in the cask for the exact paths.

---

## 日本語

[Outcasts](https://outcasts.jp) のソフトウェア向けの Homebrew tap です。

```sh
brew install --cask betyourluck/tap/fuseforks
```

**完全修飾名は省略できません。** tap しただけでは Homebrew はそのリポジトリの
コードを読み込む許可を得ないので、短い名前で入れようとすると「信頼されていない
tap」として拒否されます。完全修飾で書くと**その cask だけ**を信頼したことになります。
短い名前で使いたい場合は、先に信頼を与えてください:

```sh
brew trust --cask betyourluck/tap/fuseforks
brew install --cask fuseforks
```

**macOS は Apple Silicon 専用**で、Intel 版はありません。`.app` は v0.1.9 から
Developer ID で署名され Apple の公証を通しているので、Gatekeeper に止められずに開きます。

`brew uninstall --cask fuseforks` はアプリだけを消し、**村（サーヴァント・会話・
作業フォルダ）は残します**。`--zap` を付けるとそれらも消えます — 対象のパスは
cask の `zap` を参照してください。
