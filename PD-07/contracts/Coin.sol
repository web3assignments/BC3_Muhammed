pragma solidity ^0.5.12;

contract Coin {
    address public user;
    mapping (address => uint) public balances;

    

    constructor() public {
        user = msg.sender;
    }
    
    event Sent(address from, address to, uint amount);
    event Received(address from, uint amount);
    

    function send(address receiver, uint amount) public {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
        
    }
    
    
    function Receive() external payable {
    }

}