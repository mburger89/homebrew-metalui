# Homebrew tap for MetalUI

```sh
brew install mburger89/metalui/metalui
metalui new MyApp
cd MyApp && swift run MyApp
```

`metalui` is the command-line tool of [MetalUI](https://github.com/mburger89/MetalUI), a GPU-accelerated UI
framework for Swift. It needs macOS and Xcode 27 or later (Swift 6.4) to build.

`brew install --HEAD mburger89/metalui/metalui` builds the newest `master` instead of the latest release.

## Releasing

After a `vX.Y.Z` tag of MetalUI publishes its release, update `url` and `sha256` in
[`Formula/metalui.rb`](Formula/metalui.rb):

```sh
curl -sL https://github.com/mburger89/MetalUI/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
```
