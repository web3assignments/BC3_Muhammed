pragma solidity ^0.6.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

contract Coin is usingProvable {
    address public user;
    mapping (address => uint) public balances;
    string public EUR;
    uint256 public priceOfUrl;

    

    constructor() public {
        user = msg.sender;
    }
    
    event Sent(address from, address to, uint amount);
    event Received(address from, uint amount);

    
function __callback(bytes32 /* myid prevent warning*/ , string memory result ) override public {
       if (msg.sender != provable_cbAddress()) revert();
       EUR = result;
   }

    function send(address receiver, uint amount) public {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
    function getEUR() public payable {
        priceOfUrl = provable_getPrice("URL");
        require (address(this).balance >= priceOfUrl,
        "please add some ETH to cover for the query fee");
        provable_query("URL",
        "json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=EUR).EUR");
    
        
    }
    
    
    function Receive() external payable {
    }

}