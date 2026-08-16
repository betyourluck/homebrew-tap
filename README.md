# betyourluck/homebrew-tap

A Homebrew tap for [Outcasts](https://outcasts.jp) software.

```sh
brew tap betyourluck/tap
```

## Casks

| | |
|---|---|
| [`fuseforks`](Casks/fuseforks.rb) | [Outcasts Fuseforks](https://github.com/betyourluck/Fuseforks) — multi-agent AI orchestration for the desktop |

```sh
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
brew tap betyourluck/tap
brew install --cask fuseforks
```

**macOS は Apple Silicon 専用**で、Intel 版はありません。`.app` は v0.1.9 から
Developer ID で署名され Apple の公証を通しているので、Gatekeeper に止められずに開きます。

`brew uninstall --cask fuseforks` はアプリだけを消し、**村（サーヴァント・会話・
作業フォルダ）は残します**。`--zap` を付けるとそれらも消えます — 対象のパスは
cask の `zap` を参照してください。
