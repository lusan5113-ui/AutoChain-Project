// scripts/deploy.js
const hre = require("hardhat");

async function main() {
  console.log("正在云端准备部署...");
  const AutoChain = await hre.ethers.getContractFactory("AutoChain");
  const autoChain = await AutoChain.deploy();
  await autoChain.waitForDeployment();
  console.log(`AutoChain 合约已成功部署到云端网络! 地址: ${autoChain.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
