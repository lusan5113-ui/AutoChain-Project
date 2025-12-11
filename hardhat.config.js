require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    // 1. Ethereum Testnet (Sepolia)
    sepolia: {
      url: "https://sepolia.infura.io/v3/YOUR_API_KEY",
      accounts: ["YOUR_PRIVATE_KEY_PLACEHOLDER"]
    },
    // 2. AWS Managed Blockchain Node (Placeholder)
    aws_node: {
      url: "http://ec2-user-ip-address:8545",
      accounts: ["YOUR_PRIVATE_KEY_PLACEHOLDER"]
    },
    // 3. IBM Cloud Blockchain Node (Placeholder)
    ibm_node: {
      url: "http://ibm-cloud-ip-address:8545",
      accounts: ["YOUR_PRIVATE_KEY_PLACEHOLDER"]
    }
  }
};
