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
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.4/open-pact-client-aarch64-apple-darwin"
      sha256 "b5acfe6fd32e791ec557c4e113c4c9b62f285200b0f7d06a63a08cdef52fdb98"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.4/open-pact-client-x86_64-apple-darwin"
      sha256 "f97fbdf5c9e3ba755e06d580f62f1057d0c72fd3e9763b506fbf924765bf2791"
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
    assert_match "open-pact-client 0.8.4", shell_output("#{bin}/open-pact-client --version")
  end
end
