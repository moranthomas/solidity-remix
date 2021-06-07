var CommunityChest  = artifacts.require("../contracts/CommunityChest.sol");

module.exports = function (deployer) {
  deployer.deploy(CommunityChest);
};
