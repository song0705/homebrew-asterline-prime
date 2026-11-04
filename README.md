# Asterline Prime Homebrew tap

```sh
brew install song0705/asterline-prime/asterline
ast
```

Supports macOS and Linux (Intel and ARM). Installation downloads a SHA-256-verified prebuilt archive. Rust is not required. Linux binaries require glibc 2.39 or newer (Ubuntu 24.04 or equivalent). Both `ast` and `asterline` are installed. This uses the same executable names and application data as the original Asterline; uninstall the original formula before switching taps.

```sh
brew update
brew upgrade song0705/asterline-prime/asterline
```

Source: https://github.com/song0705/Asterline-Prime

The sync workflow checks the latest stable GitHub Release daily and can also be run manually. It validates installation before committing a formula update using this repository's built-in GitHub Actions token. Maintainers can run `python3 scripts/update.py` locally too. The updater waits for all four portable archives and their checksum manifest, downloads each archive, and verifies its SHA-256 before updating the formula. Maintainers publish portable assets with the source repository’s Portable release binaries workflow.
