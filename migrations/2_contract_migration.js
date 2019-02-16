var NonFungible = artifacts.require("./NFT.sol");

module.exports = function(deployer) {
  deployer.deploy(NonFungible, "deed", "NFT");
};
