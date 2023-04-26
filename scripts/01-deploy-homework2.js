const { network } = require("hardhat");
const {
  networkConfig,
  developmentChains,
} = require("../helper-hardhat-config");
const { verify } = require("../utils/verify");
require("dotenv").config();

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, logs } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = networkConfig.chainId;
};
