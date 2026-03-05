const hre = require("hardhat");

async function main() {
  console.log("\n🚀 Deploying ERC-8004 contracts to Sepolia testnet...\n");
  
  const [deployer] = await hre.ethers.getSigners();
  console.log("📡 Deploying with account:", deployer.address);
  
  const balance = await deployer.getBalance();
  console.log("💰 Account balance:", hre.ethers.utils.formatEther(balance), "ETH");

  // Deploy AgentIdentity
  console.log("\n📄 Deploying AgentIdentity...");
  const AgentIdentity = await hre.ethers.getContractFactory("AgentIdentity");
  const agentIdentity = await AgentIdentity.deploy();
  await agentIdentity.deployed();
  console.log("✅ AgentIdentity deployed to:", agentIdentity.address);

  // Deploy TradeIntent
  console.log("\n📄 Deploying TradeIntent...");
  const TradeIntent = await hre.ethers.getContractFactory("TradeIntent");
  const tradeIntent = await TradeIntent.deploy();
  await tradeIntent.deployed();
  console.log("✅ TradeIntent deployed to:", tradeIntent.address);
  
  console.log("\n🎉 SUCCESS! Your ERC-8004 agent is live on Sepolia testnet!");
  console.log("AgentIdentity:", agentIdentity.address);
  console.log("TradeIntent:", tradeIntent.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
