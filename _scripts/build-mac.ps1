rustup target add x86_64-apple-darwin && `
rustup target add aarch64-apple-darwin || `
exit

cargo clean
cargo build -r --target x86_64-apple-darwin && `
cargo build -r --target aarch64-apple-darwin || `
cargo clean
