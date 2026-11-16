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
      url "https://github.com/gaboe/open-pact/releases/download/v0.6.0/open-pact-client-aarch64-apple-darwin"
      sha256 "d98b93dd017471fa06b5d527ac8617f3eb49a9c3afd4fcf547b52a407417761e"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.6.0/open-pact-client-x86_64-apple-darwin"
      sha256 "358e4545c7291cbaeb8efc9e16e8ac4477042073aa23ab95d174d687a1543aae"
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
    assert_match "open-pact-client 0.6.0", shell_output("#{bin}/open-pact-client --version")
  end
end
