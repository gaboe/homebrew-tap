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
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.5/open-pact-client-aarch64-apple-darwin"
      sha256 "7a673344d291c14e226c4661878223aad9c1609fe2fc7aa6049ed0eb47b0b015"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.5/open-pact-client-x86_64-apple-darwin"
      sha256 "2cc559abfad628526e0780745e3437283dc92fcdff0660c88f76609cc700113d"
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
    assert_match "open-pact-client 0.8.5", shell_output("#{bin}/open-pact-client --version")
  end
end
