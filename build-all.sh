#!/bin/bash
set -e

echo "Building all workspace members..."
cargo build --workspace --target wasm32v1-none --release

echo "Optimizing WASM binaries..."
for contract in launchpad collection_nft_erc721 collection_nft_erc1155 lazy_mint_erc721 lazy_mint_erc1155; do
  wasm_path="target/wasm32v1-none/release/soroban_${contract}.wasm"
  
  if [ -f "$wasm_path" ]; then
    echo "Optimizing $contract..."
    stellar contract optimize --wasm "$wasm_path"
  else
    # The actual output filename might differ depending on the crate name
    # Let's try to find it dynamically or assume the crate name convention
    crate_name=$(grep -m1 '^name = ' $contract/Cargo.toml | cut -d '"' -f 2 | tr '-' '_')
    wasm_path="target/wasm32v1-none/release/${crate_name}.wasm"
    if [ -f "$wasm_path" ]; then
      echo "Optimizing $contract (as $crate_name)..."
      stellar contract optimize --wasm "$wasm_path"
    else
      echo "Warning: Could not find WASM for $contract at $wasm_path"
    fi
  fi
done

echo "Build and optimization complete!"
