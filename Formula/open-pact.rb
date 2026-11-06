# typed: strict
# frozen_string_literal: true

# Open Pact client formula.
class OpenPact < Formula
  desc "Verifiable security checks for personally owned devices"
  homepage "https://github.com/gaboe/open-pact"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.5/open-pact-client-aarch64-apple-darwin"
      sha256 "d5a52749884f6018b2ff09be7718cbbea1e3059582635a358f11dd311eeb333d"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.5/open-pact-client-x86_64-apple-darwin"
      sha256 "fbe6411e3187c79c22edc9abbcf033acaae1f4a3ca0c092b2841ad029a8daedc"
    end
  end

  # Generated from the published SHA256SUMS.
  def install
    if Hardware::CPU.arm?
      bin.install "open-pact-client-aarch64-apple-darwin" => "open-pact-client"
    else
      bin.install "open-pact-client-x86_64-apple-darwin" => "open-pact-client"
    end
  end

  test do
    assert_match "open-pact-client 0.4.5", shell_output("#{bin}/open-pact-client --version")
  end
end
