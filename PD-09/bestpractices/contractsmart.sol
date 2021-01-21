pragma solidity >=0.4.0 <0.7.0;

import "./SafeMath.sol";

contract Coin {
    address public user;
    mapping (address => uint) public balances;

    using SafeMath for uint256;

    constructor() public {
        user = msg.sender;
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
