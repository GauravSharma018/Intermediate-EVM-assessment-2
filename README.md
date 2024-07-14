# Solidity integrated with Frontend (Project)
This is a smart contract written in Solidity. The purpose is to create a simple contract with 2-3 functions and then show the values of those functions in frontend of the application.
The Assessment Solidity Smart Contract is a blockchain-based application written in Solidity, designed to provide a secure and transparent way for users to manage their balances, set user names, deposit Ether, and withdraw funds. In the same way index javascript file create a frontened for the users to interact with their smart contract. This README provides an overview of the contract's functionalities and instructions for setting up and using the contract.

# Description
The Assessment Solidity Smart Contract serves as the backbone of a decentralized application (dApp) that allows users to interact with Ethereum blockchain features. It includes the following key functionalities:

Balance Management: Users can check their current balances on the blockchain.
User Name Setting: Users can set their names associated with their Ethereum addresses.
Deposit Ether: Users can deposit Ether into their accounts, which gets recorded on the blockchain.
Withdraw Funds: Users can withdraw funds from their accounts, ensuring proper balance checks and error handling.
In-Game Store: Users can burn tokens to purchase in-game items which are stored in their inventory.
In-Game Balance: Users can also check their in game balance.
In-Game Inventory: Users can also check their in game inventory item.
The contract utilizes Solidity's features such as events, error handling with require and revert statements, and access control through owner verification. These features ensure the contract's reliability, security, and user-friendliness.

# Frontend Interaction
The index.js file provided in this repository serves as the frontend component of the application, allowing users to interact with the deployed smart contract using a web interface. Here are the key functionalities of index.js:

Connect Metamask Wallet: Users can connect their MetaMask wallets to the dApp.
Set User Name: Users can set their names associated with their Ethereum addresses.
Deposit Ether: Users can deposit Ether into their accounts via the frontend interface.
Withdraw Funds: Users can initiate fund withdrawals directly from the frontend.
Item For Sale: Users can check which type of item are for sale.
Buy Item: Users can spend their balance to buy item from the store.
Check Inventory: Users are now able to see thier inventory item.
The index.js file uses ethers.js library to interact with the Ethereum blockchain, providing a seamless user experience for managing balances and transactions.

# Getting Stared
Proficiency in Hardhat: It is essential to have a good grasp of using Hardhat, a development environment designed for writing, testing, and deploying smart contracts.
Understanding of Solidity: It is important to have a strong understanding of Solidity as it is the main programming language used for creating smart contracts in this codebase.
Command line proficiency: Basic familiarity with using command line tools such as the terminal or Command Prompt is necessary for running commands and scripts.

## Installing
A text editor: For running the code Visual Studio Code.
You will need to have Node.js installed on your system, with version V10. or higher.
Node Package Manager npm used for installing and managing dependencies.
Run this command in your terminal ```git clone https://github.com/GauravSharma018/Intermediate-EVM-assessment-2``` to clone this repository

## Executing The program
After cloning the github, you will want to do the following to get the code running on your computer.

1. Inside the project directory, in the terminal type: npm i
2. Open two additional terminals in your VS code
3. In the second terminal type: npx hardhat node
4. In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
5. Back in the first terminal, type npm run dev to launch the front-end.

After this, the project will be running on your localhost. 
Typically at http://localhost:3000/

# Author
Gaurav Sharma

# Licence
This project is licensed under MIT license.
