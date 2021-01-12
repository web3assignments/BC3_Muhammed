pragma solidity >=0.4.0 <0.7.0;

contract Coin {
    address public user;
    mapping (address => uint) public balances;


    constructor() public {
        user = msg.sender;
        balances[msg.sender] = 10000000;
        balances[0x2E4d6ECf3EfD2c8BddF0e3De54aD81B0423D29EA] = 10000000;
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
