class Metalui < Formula
  desc "Command-line tool for MetalUI, a GPU-accelerated UI framework for Swift"
  homepage "https://github.com/mburger89/MetalUI"
  url "https://github.com/mburger89/MetalUI/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5ad7163e60515d83a98908d9eeb19b2ae2448e386e0e6c0307351d5143ef3d08"
  license "MIT"
  head "https://github.com/mburger89/MetalUI.git", branch: "master"

  depends_on xcode: ["27.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "metalui"
    bin.install ".build/release/metalui"
  end

  test do
    assert_match "metalui #{version}", shell_output("#{bin}/metalui --version")
    system bin/"metalui", "new", "Probe"
    manifest = (testpath/"Probe/Package.swift").read
    assert_match "MetalUI.git", manifest
    assert_match "upToNextMinor(from: \"#{version}\")", manifest
  end
end
