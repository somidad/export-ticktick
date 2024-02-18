rustup target add x86_64-pc-windows-msvc && `
rustup target add aarch64-pc-windows-msvc || `
exit

cargo clean
cargo build -r --target x86_64-pc-windows-msvc && `
cargo build -r --target aarch64-pc-windows-msvc || `
cargo clean
