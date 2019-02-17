var NonFungible = artifacts.require("./NFT.sol");
var SpecialPurposeVehicle = artifacts.require("./SPV.sol");

module.exports = function(deployer) {
  deployer.deploy(NonFungible, "deed", "NFT");
  deployer.deploy(SpecialPurposeVehicle, "OWN");
};
