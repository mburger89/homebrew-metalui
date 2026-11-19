class Metalui < Formula
  desc "Command-line tool for MetalUI, a GPU-accelerated UI framework for Swift"
  homepage "https://github.com/mburger89/MetalUI"
  license "MIT"
  head "https://github.com/mburger89/MetalUI.git", branch: "master"

  on_macos do
    on_arm do
      url "https://github.com/mburger89/MetalUI/archive/refs/tags/v0.1.0.tar.gz"
      sha256 "5ad7163e60515d83a98908d9eeb19b2ae2448e386e0e6c0307351d5143ef3d08"
    end
    on_intel do
      url "https://github.com/mburger89/MetalUI/archive/refs/tags/v0.1.0.tar.gz"
      sha256 "5ad7163e60515d83a98908d9eeb19b2ae2448e386e0e6c0307351d5143ef3d08"
    end

    depends_on xcode: ["27.0", :build]
  end

  on_linux do
    on_intel do
      url "https://github.com/mburger89/MetalUI/releases/download/v0.1.0/metalui-0.1.0-linux-x86_64.tar.gz"
      sha256 "67bb0cf46af98bff96b0274d33159b269081d4a5aa7c4c7f26529cf1cf28160b"
    end
    on_arm do
      url "https://github.com/mburger89/MetalUI/releases/download/v0.1.0/metalui-0.1.0-linux-aarch64.tar.gz"
      sha256 "e9fac65e4ab7114c838cec81d895cd82e99fd6e4977cb73a25dce7571ede8b23"
    end
  end

  def install
    if OS.mac?
      system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "metalui"
      bin.install ".build/release/metalui"
    else
      bin.install "metalui"
    end
  end

  test do
    assert_match "metalui #{version}", shell_output("#{bin}/metalui --version")
    system bin/"metalui", "new", "Probe"
    manifest = (testpath/"Probe/Package.swift").read
    assert_match "MetalUI.git", manifest
    assert_match "upToNextMinor(from: \"#{version}\")", manifest
  end
end
