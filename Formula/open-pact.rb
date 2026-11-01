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
      url "https://github.com/gaboe/open-pact/releases/download/v0.3.2/open-pact-client-aarch64-apple-darwin"
      sha256 "55cdcaa6997f1f34ed87aa113e13f7472dff267f7a5dcffd9e9a08890353c6e5"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.3.2/open-pact-client-x86_64-apple-darwin"
      sha256 "c7ca9729837fa3428a01a3f51f9a491cd233d601910ea612c202a7a8251f6e79"
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
    assert_match "open-pact-client 0.3.2", shell_output("#{bin}/open-pact-client --version")
  end
end
