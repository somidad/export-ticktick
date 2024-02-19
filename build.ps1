$platforms = [System.Collections.ArrayList]::new()
$platforms.add(@("x86_64-pc-windows-msvc", "win-x64", ".exe"))
$platforms.add(@("aarch64-pc-windows-msvc", "win-arm64", ".exe"))
# $platforms.add(@("x86_64-unknown-linux-gnu", "linux-x64", ""))
# $platforms.add(@("aarch64-unknown-linux-gnu", "linux-arm64", ""))
# $platforms.add(@("x86_64-apple-darwin", "mac-x64", ""))
# $platforms.add(@("aarch64-apple-darwin", "mac-arm64", ""))

cargo clean

foreach ($platform in $platforms) {
  $triple = $platform[0]
  $arch = $platform[1]
  $ext = $platform[2]
  rustup target add $triple &&
  cargo build -r --target $triple && `
  move-item -path        target/$triple/release/export-ticktick$ext `
            -destination target/$triple/release/export-ticktick-$arch$ext
  if (!$?) {
    cargo clean
    break
  }
}
