# NFT-Launchpad

This repository contains the Launchpad factory contract and all associated collection templates for the Afristore marketplace on Soroban.

## Contracts

| Contract | Description |
|---|---|
| `launchpad` | Factory contract that deploys new NFT collections |
| `collection_nft_erc721` | Standard ERC-721 NFT collection |
| `collection_nft_erc1155` | Standard ERC-1155 multi-edition collection |
| `lazy_mint_erc721` | Lazy-mint ERC-721 (mint on purchase) |
| `lazy_mint_erc1155` | Lazy-mint ERC-1155 (mint on purchase) |

---

##  Prerequisites

- Rust (stable)
- `wasm32v1-none` target: `rustup target add wasm32v1-none`
- Stellar CLI: `cargo install --locked stellar-cli`

---

## Build and Optimization

To build all contracts and optimize the generated WASM files, run the provided script:
```bash
./build-all.sh
```
This requires `stellar-cli` to be installed for the `stellar contract optimize` command.

---

## Deploying to Testnet

1. Deploy the Launchpad contract:
```bash
stellar contract deploy \
  --wasm target/wasm32v1-none/release/soroban_launchpad.wasm \
  --source <YOUR_ACCOUNT> \
  --network testnet
```
2. Deploy the desired collection WASM (e.g., ERC-721) to get its WASM hash:
```bash
stellar contract install \
  --wasm target/wasm32v1-none/release/collection_nft_erc721.wasm \
  --source <YOUR_ACCOUNT> \
  --network testnet
```
3. Initialize the Launchpad with the returned WASM hash.
4. Invoke the launchpad contract to deploy a new collection, and it will return the address of the newly deployed collection.

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
   - `cargo build --workspace --target wasm32v1-none --release` — all 5 contracts must produce WASM binaries
4. Open a PR — **all CI must pass before a PR is eligible for review and merge**

---

##  Tech Stack

- Rust + `soroban-sdk v25.3.0`
- Stellar / Soroban smart contract platform

---

## 📄 License

MIT — see [LICENSE](./LICENSE)
