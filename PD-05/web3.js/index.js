// contractAddress and abi are setted after contract deploy
const contractAddress = '0x961abF94F7CA535D351C5Ad8b432695E06A81aE5';
const abi = [
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "address",
				"name": "from",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "Received",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "address",
				"name": "from",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "address",
				"name": "to",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "Sent",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "Receive",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "balances",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "receiver",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "send",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "user",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];

const Web3 = require('web3');
const web3 = new Web3('http://localhost:7545' );
async function f() {
    var acts=await web3.eth.getAccounts();
    var fromadr=acts[0];
    var toadr=acts[1];
    console.log(`fromadr ${fromadr} has ${Web3.utils.fromWei ( await web3.eth.getBalance(fromadr), 'ether')} ether` );
    console.log(`toadr   ${toadr} has ${Web3.utils.fromWei ( await web3.eth.getBalance(toadr),   'ether')} ether` );
    console.log(`Transfering 1 ether`);
    obj= await web3.eth.sendTransaction({
        from: fromadr,
        to: toadr,
        value: Web3.utils.toWei('1', 'ether')
    }).catch(console.log);
    console.log(`Stored in block ${obj.blockNumber}`)
    console.log(`fromadr ${fromadr} has ${Web3.utils.fromWei ( await web3.eth.getBalance(fromadr), 'ether')} ether` );
    console.log(`toadr   ${toadr} has ${Web3.utils.fromWei ( await web3.eth.getBalance(toadr),   'ether')} ether` );
} 
f();
