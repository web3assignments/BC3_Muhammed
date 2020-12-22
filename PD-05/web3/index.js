async function asyncloaded() {
    web3 = new Web3(Web3.givenProvider); // provider from metamask      
    var result = await web3.eth.requestAccounts().catch(x => console.log(x.message));
    console.log(`web3 is present: ${web3.version}`); // note: use ` (back quote)
    const network = await web3.eth.net.getId().catch((reason) => console.log(`Cannnot find network ${reason}`));
    if (typeof network === 'undefined' || network != 4) { console.log("Please select Rinkeby test network"); return; }
    console.log("Ethereum network: Rinkeby")
    accounts = await web3.eth.getAccounts();
    console.log(accounts[0]); // show current user.
   contract = new web3.eth.Contract(SimpleContractABI, contractSimple);
}
window.addEventListener("load", asyncloaded);       

async function buyToken() {
    console.log("In buyToken")
    var result=await contract.methods.buyToken().send({from: accounts[0]})
    console.log(result)
    console.log(result.events)
    console.log(result.events.Purchase.returnValues)
}
