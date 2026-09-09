cask "fuseforks" do
  version "0.2.2"
  sha256 "903a8b5a88125c1857611dfc0411bfe5f901562cc261cf0cecf74105bb526a1b"

  url "https://github.com/betyourluck/Fuseforks/releases/download/v#{version}/fuseforks_#{version}_aarch64.dmg",
      verified: "github.com/betyourluck/Fuseforks/"
  name "Outcasts Fuseforks"
  desc "Multi-agent AI orchestration for the desktop"
  homepage "https://github.com/betyourluck/Fuseforks"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Apple Silicon only. The release workflow builds macOS on a single
  # macos-latest runner with no target matrix, so no x86_64 artifact exists.
  depends_on arch: :arm64

  app "fuseforks.app"

  # The village lives under the bundle identifier (jp.outcasts.fuseforks):
  # world.json, sessions.redb, the workspace and attachments are all there.
  # `brew uninstall --zap` therefore destroys the user's village -- which is
  # what zap means, and why it is opt-in rather than part of uninstall.
  zap trash: [
    "~/Library/Application Support/jp.outcasts.fuseforks",
    "~/Library/Caches/jp.outcasts.fuseforks",
    "~/Library/HTTPStorages/jp.outcasts.fuseforks",
    "~/Library/Preferences/jp.outcasts.fuseforks.plist",
    "~/Library/Saved Application State/jp.outcasts.fuseforks.savedState",
    "~/Library/WebKit/jp.outcasts.fuseforks",
  ]
end
