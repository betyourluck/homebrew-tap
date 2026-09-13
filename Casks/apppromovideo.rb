cask "apppromovideo" do
  # v0.1.0 shipped unsigned (the release workflow had no Apple secrets yet), so
  # this cask starts at v0.1.1, the first release that is signed and notarized.
  version "0.1.1"
  sha256 "b3f4a812fae543666e94047b45912ba0b3e086b5bf9e404d94e4afc4552e46a7"

  url "https://github.com/betyourluck/AppPromoVideo/releases/download/v#{version}/AppPromoVideo_#{version}_aarch64.dmg",
      verified: "github.com/betyourluck/AppPromoVideo/"
  name "Outcasts AppPromoVideo"
  desc "Turns an app repository and UI snapshots into prompts and reference images for video-generation AIs"
  homepage "https://github.com/betyourluck/AppPromoVideo"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Apple Silicon only. The release workflow builds macOS on a single
  # macos-latest runner with no target matrix, so no x86_64 artifact exists.
  depends_on arch: :arm64

  app "AppPromoVideo.app"

  # Everything the user accumulates lives under the bundle identifier
  # (jp.outcasts.apppromovideo): settings.json, the .env holding the image
  # generation API keys, imported snapshots, bundled fonts, every run's
  # prompts and reference images (runs/), and the raw CLI logs.
  # `brew uninstall --zap` therefore destroys the user's runs and API keys --
  # which is what zap means, and why it is opt-in rather than part of uninstall.
  zap trash: [
    "~/Library/Application Support/jp.outcasts.apppromovideo",
    "~/Library/Caches/jp.outcasts.apppromovideo",
    "~/Library/HTTPStorages/jp.outcasts.apppromovideo",
    "~/Library/Preferences/jp.outcasts.apppromovideo.plist",
    "~/Library/Saved Application State/jp.outcasts.apppromovideo.savedState",
    "~/Library/WebKit/jp.outcasts.apppromovideo",
  ]
end
