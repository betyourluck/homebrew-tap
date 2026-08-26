cask "kataribe" do
  version "0.5.16"
  sha256 "17b28566eaca138ef9ccd421e6ee945451790cf23f5b01318a55a038ae33763d"

  url "https://github.com/betyourluck/Kataribe/releases/download/v#{version}/Kataribe_#{version}_aarch64.dmg",
      verified: "github.com/betyourluck/Kataribe/"
  name "Kataribe"
  name "語り部"
  desc "TRPG game master with a deterministic Rust engine and a cloud LLM narrator"
  homepage "https://github.com/betyourluck/Kataribe"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Apple Silicon only. The release workflow builds macOS on a single
  # macos-latest runner with no target matrix, so no x86_64 artifact exists.
  depends_on arch: :arm64

  # Signed with a Developer ID certificate and notarized from v0.5.16 onward.
  # Earlier releases carried only a linker ad-hoc signature and would have been
  # refused by Gatekeeper once Homebrew's quarantine was applied.
  app "Kataribe.app"

  # Everything the player accumulates lives under the bundle identifier
  # (jp.kataribe.app): save files, packages downloaded from the archive,
  # reference images, generated illustrations, conversation logs, and the .env
  # holding the LLM API keys. `brew uninstall --zap` therefore destroys the
  # player's saves and their API keys -- which is what zap means, and why it is
  # opt-in rather than part of uninstall.
  zap trash: [
    "~/Library/Application Support/jp.kataribe.app",
    "~/Library/Caches/jp.kataribe.app",
    "~/Library/HTTPStorages/jp.kataribe.app",
    "~/Library/Preferences/jp.kataribe.app.plist",
    "~/Library/Saved Application State/jp.kataribe.app.savedState",
    "~/Library/WebKit/jp.kataribe.app",
  ]
end
