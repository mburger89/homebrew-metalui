# Homebrew tap for MetalUI

```sh
brew install mburger89/metalui/metalui
metalui new MyApp
cd MyApp && swift run MyApp
```

`metalui` is the command-line tool of [MetalUI](https://github.com/mburger89/MetalUI), a GPU-accelerated UI
framework for Swift. On macOS it builds from source and needs Xcode 27 or later (Swift 6.4). On Linux (x86_64 and
aarch64) it installs a prebuilt, self-contained binary; building the apps it creates needs a Swift toolchain.

`brew install --HEAD mburger89/metalui/metalui` builds the newest `master` instead of the latest release (macOS).

## Releasing

After a `vX.Y.Z` tag of MetalUI publishes its release, update `url` and `sha256` in
[`Formula/metalui.rb`](Formula/metalui.rb) (the macOS source tarball and both Linux release assets, whose
`.sha256` files sit beside them):

```sh
curl -sL https://github.com/mburger89/MetalUI/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
```
