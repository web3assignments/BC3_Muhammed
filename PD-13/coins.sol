// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Coin {
    address public user;
    mapping (address => uint) public balances;

    constructor()  {
        user = msg.sender;
        balances[msg.sender] = 10000000;
        balances[0x1A5CF1BF998df91829BAa128FcB89fE49eE9DB5D] = 10000000;
    }
    
    event Sent(address from, address to, uint amount);
    event Received(address from, uint amount);
    
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
    
    function Receive() external payable {
        emit Received(msg.sender, msg.value);
    }

}
