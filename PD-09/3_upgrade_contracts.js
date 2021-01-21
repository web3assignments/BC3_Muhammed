const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');
var Coin1 = artifacts.require("Coin1");
var Coin2 = artifacts.require("Coin2");

module.exports = async function(deployer) {    
    const Coin1Contract=await Coin1.deployed()
    const Coin2Contract=await upgradeProxy( Coin1Contract.address, Coin2,{ deployer });
    console.log(`Address of  Coin1Contract: ${ Coin1Contract.address}`)
    console.log(`Address of Coin2Contract: ${Coin2Contract.address}`)
    console.log("Doing some tests with the just upgraded contract");
}