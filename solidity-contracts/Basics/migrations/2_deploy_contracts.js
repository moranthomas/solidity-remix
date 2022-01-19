var Trivial  = artifacts.require("../contracts/Trivial.sol");
var Counter  = artifacts.require("../contracts/Counter.sol");

module.exports = function (deployer) {
  deployer.deploy(Trivial);

  const initialCount = 99;
  deployer.deploy(Counter, initialCount);
};
