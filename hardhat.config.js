require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    // 1. Ethereum Testnet (Sepolia)
    sepolia: {
      url: "https://sepolia.infura.io/v3/YOUR_API_KEY",
      accounts: ["0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"]
    },
    // 2. AWS Managed Blockchain Node (Placeholder)
    aws_node: {
      url: "http://ec2-user-ip-address:8545",
      accounts: ["0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"]
    },
    // 3. IBM Cloud Blockchain Node (Placeholder)
    ibm_node: {
      url: "http://ibm-cloud-ip-address:8545",
      accounts: ["0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"]
    }
  }
};
