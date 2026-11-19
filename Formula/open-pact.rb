# typed: strict
# frozen_string_literal: true

# Open Pact client formula.
class OpenPact < Formula
  desc "Verifiable security checks for personally owned devices"
  homepage "https://github.com/gaboe/open-pact"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.3/open-pact-client-aarch64-apple-darwin"
      sha256 "f5e8082dd903afd71a88c9cc37767a8abcee28f5f278c171c81081d82dd59216"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.3/open-pact-client-x86_64-apple-darwin"
      sha256 "f78278bd2127165672e40edb658be80242bc91ae96d702fa91a5a28295cc507a"
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
    assert_match "open-pact-client 0.8.3", shell_output("#{bin}/open-pact-client --version")
  end
end
