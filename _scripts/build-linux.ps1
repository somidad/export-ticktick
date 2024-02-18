rustup target add x86_64-unknown-linux-gnu && `
rustup target add aarch64-unknown-linux-gnu || `
exit

cargo clean
cargo build -r --target x86_64-unknown-linux-gnu && `
cargo build -r --target aarch64-unknown-linux-gnu || `
cargo clean
