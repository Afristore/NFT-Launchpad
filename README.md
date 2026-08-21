# NFT-Launchpad


The NFT factory and collection contract suite for the [Afristore Marketplace](https://github.com/Afristore/marketplace) — extracted from the monorepo into its own dedicated repository.

This workspace contains 5 Soroban smart contracts:

| Contract | Description |
|---|---|
| `launchpad` | Factory contract that deploys new NFT collections |
| `collection_nft_erc721` | Standard ERC-721 NFT collection |
| `collection_nft_erc1155` | Standard ERC-1155 multi-edition collection |
| `lazy_mint_erc721` | Lazy-mint ERC-721 (mint on purchase) |
| `lazy_mint_erc1155` | Lazy-mint ERC-1155 (mint on purchase) |

---

##  Getting Started 

```bash
# Build all contracts
cargo build --workspace --target wasm32-unknown-unknown --release

# Run all tests
cargo test --workspace --features testutils

# Check formatting and linting
cargo fmt --check
cargo clippy --workspace -- -D warnings

# Optimize all WASMs
./build-all.sh
```

---

##  Prerequisites

- Rust (stable)
- `wasm32-unknown-unknown` target: `rustup target add wasm32-unknown-unknown`
- Stellar CLI: `cargo install --locked stellar-cli`

---

##  Workspace Structure

```
NFT-Launchpad/
├── Cargo.toml                  # Workspace root
├── launchpad/                  # Factory contract
├── collection_nft_erc721/      # Standard ERC-721
├── collection_nft_erc1155/     # Standard ERC-1155
├── lazy_mint_erc721/           # Lazy-mint ERC-721
└── lazy_mint_erc1155/          # Lazy-mint ERC-1155
```

---

##  Source Location (Monorepo)

This repository is being extracted from the following directories in the [main monorepo](https://github.com/Afristore/marketplace/tree/master/contracts):
- `contracts/launchpad/`
- `contracts/collection_nft_erc721/`
- `contracts/collection_nft_erc1155/`
- `contracts/lazy_mint_erc721/`
- `contracts/lazy_mint_erc1155/`


---

##  Contributing

1. Fork this repository
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Make your changes and ensure all CI checks pass:
   - `cargo fmt --check` — all members must be correctly formatted
   - `cargo clippy --workspace -- -D warnings` — zero warnings across all contracts
   - `cargo test --workspace --features testutils` — all cross-contract tests must pass
   - `cargo build --workspace --target wasm32-unknown-unknown --release` — all 5 contracts must produce WASM binaries
4. Open a PR — **all CI must pass before a PR is eligible for review and merge**

---

##  Tech Stack

- Rust + `soroban-sdk v25.3.0`
- Stellar / Soroban smart contract platform

---

## 📄 License

MIT — see [LICENSE](./LICENSE)
