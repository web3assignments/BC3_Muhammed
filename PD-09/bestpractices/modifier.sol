pragma solidity >=0.4.0 <0.7.0;

contract Coin {
    address public owner = msg.sender;
    mapping (address => uint) public balances;


    constructor() public {
        owner = msg.sender;
        balances[msg.sender] = 10000000;
        balances[0x1A5CF1BF998df91829BAa128FcB89fE49eE9DB5D] = 10000000;
    }
    
    modifier restricted() {
    require(
      msg.sender == owner
    );
    _;
  }
    
    modifier minAmount(uint _amount)    { require(msg.value >= _amount,     "Not enough ETH send"); _;}
    
    event Sent(address from, address to, uint amount);
    event Received(address from, uint amount);
    

    function send(address receiver, uint amount) public restricted{
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
        minAmount(1 ether)
    }
    
    function Receive() external payable {
        emit Received(msg.sender, msg.value);
    }

}
