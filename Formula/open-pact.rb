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
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.8/open-pact-client-aarch64-apple-darwin"
      sha256 "87b9961d66c8f29b067a3c57a0523ce8f897d2d2bbaf72fec53cd16655e72dbe"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.8/open-pact-client-x86_64-apple-darwin"
      sha256 "f36ff30242be4661062067b35ce1342c4c74c261396859df796350471c56e365"
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
    assert_match "open-pact-client 0.4.8", shell_output("#{bin}/open-pact-client --version")
  end
end
