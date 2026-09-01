cask "lorekeel" do
  # v0.5.16 and earlier shipped as "Kataribe" (different .app name, different
  # bundle identifier), so this cask starts at the first Lorekeel-named release.
  version "0.5.20"
  sha256 "3b3a65485ba22d30df637136aef648bec435361a9c7e46abfb66c0080053200f"

  url "https://github.com/betyourluck/Lorekeel/releases/download/v#{version}/Lorekeel_#{version}_aarch64.dmg",
      verified: "github.com/betyourluck/Lorekeel/"
  name "Lorekeel"
  desc "TRPG game master with a deterministic Rust engine and a cloud LLM narrator"
  homepage "https://github.com/betyourluck/Lorekeel"

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
  app "Lorekeel.app"

  # Everything the player accumulates lives under the bundle identifier: save
  # files, packages downloaded from the archive, reference images, generated
  # illustrations, conversation logs, and the .env holding the LLM API keys.
  # `brew uninstall --zap` therefore destroys the player's saves and their API
  # keys -- which is what zap means, and why it is opt-in rather than part of
  # uninstall.
  #
  # The jp.kataribe.app paths are listed too: the app was renamed in 2026-08,
  # and on first launch it *copies* (does not move) the old folder into the new
  # one, so a player who upgraded has data in both places. Zapping only the new
  # identifier would leave saves and API keys behind after the user asked for
  # everything to be removed.
  zap trash: [
    "~/Library/Application Support/jp.kataribe.app",
    "~/Library/Application Support/jp.lorekeel.app",
    "~/Library/Caches/jp.kataribe.app",
    "~/Library/Caches/jp.lorekeel.app",
    "~/Library/HTTPStorages/jp.kataribe.app",
    "~/Library/HTTPStorages/jp.lorekeel.app",
    "~/Library/Preferences/jp.kataribe.app.plist",
    "~/Library/Preferences/jp.lorekeel.app.plist",
    "~/Library/Saved Application State/jp.kataribe.app.savedState",
    "~/Library/Saved Application State/jp.lorekeel.app.savedState",
    "~/Library/WebKit/jp.kataribe.app",
    "~/Library/WebKit/jp.lorekeel.app",
  ]
end
