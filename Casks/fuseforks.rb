cask "fuseforks" do
  version "0.6.3"
  sha256 "bc33c8265a5a0a0b3a3d08f6e93604fa30dff0984a724b8078f44ad60f1f4899"

  url "https://github.com/betyourluck/Fuseforks/releases/download/v#{version}/fuseforks_#{version}_aarch64.dmg"
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
  #
  # LaunchAgents/fuseforks.plist exists only if the user turned on "Launch at
  # sign-in" (Spec 69, off by default). Fuseforks writes it itself, so a plain
  # uninstall leaves it behind pointing at a missing app -- the docs ask users
  # to turn the setting off before uninstalling, and zap removes it.
  zap trash: [
    "~/Library/Application Support/jp.outcasts.fuseforks",
    "~/Library/Caches/jp.outcasts.fuseforks",
    "~/Library/HTTPStorages/jp.outcasts.fuseforks",
    "~/Library/LaunchAgents/fuseforks.plist",
    "~/Library/Preferences/jp.outcasts.fuseforks.plist",
    "~/Library/Saved Application State/jp.outcasts.fuseforks.savedState",
    "~/Library/WebKit/jp.outcasts.fuseforks",
  ]
end
