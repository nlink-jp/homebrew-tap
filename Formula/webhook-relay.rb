class WebhookRelay < Formula
  desc "Authenticated webhook receiver that writes payloads to GCS"
  homepage "https://github.com/nlink-jp/webhook-relay"
  url "https://github.com/nlink-jp/webhook-relay/releases/download/v0.2.0/webhook-relay-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "82010e231419dfc99566f2d11c93352efb1e075803ba25932e52468e0a357280"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "webhook-relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/webhook-relay --version")
  end
end
