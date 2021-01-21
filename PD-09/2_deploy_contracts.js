const { deployProxy } = require('@openzeppelin/truffle-upgrades');

var Coin1 = artifacts.require("Coin1");

module.exports = async function(deployer) {
    const Coin1Contract = await deployProxy(Coin1, [42], { deployer });
    console.log(`Address of Coin1Contract: ${Coin1Contract.address}`)
};