# Create a custom token and deploy it to Avalanche Fuji Testnet


This project is part of ETH+AVAX Proof Intermediate course by Metacrafters

In this project we had to build a custom token using Solidity and deploy it to Avalanche Fuji Testnet using Hardhat.

## Pre-requisites

- Make sure you have a Web3 wallet such as **Metamask**.
- Visit a Avalanche Fuji Testnet faucet to recieve tokens in your wallet, which will be used to pay the transaction fee


## Setup


#### 1. Install all the required packages

```
npm i
```

#### 2. Create a .env file and store your credentials inside

```
WALLET_PRIVATE_KEY="YOUR PRIVATE KEY"
```

#### 3. Make changes in the hardhat.config.js file

```
FORK_FUJI = true // if you wish to fork the testnet, else false
FORK_MAINNET = true // if you wish to fork the mainnet, else false
```

#### 4. Deploy the token


```
// Replace "SELECTED_NETWORK" with either fuji or mainnet

npx hardhat run --network "SELECTED_NETWORK" scripts/deploy.js
```


## Verification

After the script executes successfully, the contract will be deployed on the selected net, and the address of the token would be printed.

You can verify the Token creation on Snowtrace by pasting its address.

To interact with the token, we'll be using Remix IDE


## Interaction

- Open Remix IDE on a browser
- Upload the same contract and press Ctrl+S to save and compile it
- In the deploy tab, set the environment to **Injected Provider**
- Approve the connection to your **Web3** wallet, and the IDE will be connected to the net, and account will be loaded automatically.
- Paste your token address and click **At Address**. This will load up the contract, and you will be able to interact with it.
