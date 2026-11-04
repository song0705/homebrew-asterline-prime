# Asterline Prime Homebrew tap

```sh
brew install song0705/asterline-prime/asterline
ast
```

Supports macOS and Linux (Intel and ARM). The first installation downloads a checksum-pinned source archive and compiles it with Rust, which Homebrew installs automatically. Both `ast` and `asterline` are installed. This uses the same executable names and application data as the original Asterline; uninstall the original formula before switching taps.

```sh
brew update
brew upgrade song0705/asterline-prime/asterline
```

Source: https://github.com/song0705/Asterline-Prime

The sync workflow checks the latest stable GitHub Release daily and can also be run manually. It validates installation before committing a formula update using this repository's built-in GitHub Actions token. Maintainers can run `python3 scripts/update.py` locally too. The archive SHA-256 is calculated from the downloaded release source; Cargo uses the committed lockfile.
