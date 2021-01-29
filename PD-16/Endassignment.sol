//SPDX-License-Identifier: MIT
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

pragma solidity >=0.4.22 <0.8.0;

contract Coin is usingProvable {
    address public user;
    mapping (address => uint) public balances;
    address public minter;
    uint256 public priceOfUrl;
    string public EUR;
    
     modifier restricted() {
    require(
      msg.sender == user
    );
    _;
  }
  
  function destroy() public {
    selfdestruct(msg.sender);
}

    constructor() public {
        user = msg.sender;
        balances[msg.sender] = 10000000;
        balances[0x1A5CF1BF998df91829BAa128FcB89fE49eE9DB5D] = 10000000;
        minter = msg.sender;
    }
    
    event Sent(address from, address to, uint amount);
    event Received(address from, uint amount);
    
    function mint(address receiver, uint amount) public {
        if (msg.sender != minter) return;
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
    
    function Receive() public payable restricted {
        emit Received(msg.sender, msg.value);
    }

    function getEUR() public payable {
        priceOfUrl = provable_getPrice("URL");
        require (address(this).balance >= priceOfUrl,
        "please add some ETH to cover for the query fee");
        provable_query("URL",
        "json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=EUR).EUR");
    }

}
