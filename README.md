# NFT-Launchpad

This repository contains the Launchpad factory contract and all associated collection templates for the Afristore marketplace on Soroban.

## Contracts

- **`launchpad`**: The factory contract used to deploy collection contracts.
- **`collection_nft_erc721`**: A standard ERC-721 collection contract.
- **`collection_nft_erc1155`**: A standard ERC-1155 collection contract.
- **`lazy_mint_erc721`**: A lazy-mint ERC-721 collection contract.
- **`lazy_mint_erc1155`**: A lazy-mint ERC-1155 collection contract.

## Build and Optimization

To build all contracts and optimize the generated WASM files, run the provided script:
```bash
./build-all.sh
```
This requires `stellar-cli` to be installed for the `stellar contract optimize` command.

## Deploying to Testnet

To deploy the Launchpad and deploy a collection through it:

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
