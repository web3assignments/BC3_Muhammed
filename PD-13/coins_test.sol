pragma solidity >=0.4.22 <0.8.0;
import "remix_tests.sol"; 
import "remix_accounts.sol";
import "../coins.sol";

contract testSuite {
Coin mc;

address constant recipient=0x0000000000000000000000000000000000000001;
address constant bank=0x1A5CF1BF998df91829BAa128FcB89fE49eE9DB5D;
address msgsender=address(this); // during tess this contract is the sender of the msg

    function beforeAll() public {
        mc=new Coin();
    }

    function CheckUser() public {
       Assert.equal(mc.user(),msgsender,"User should be address of this");
    }

    function CheckBank() public  {
       Assert.equal(mc.balances(bank),10000000,"Initial bank balance should be 10000000");
       Assert.equal(mc.balances(msgsender),10000000,"Initial msgsender balance should be 10000000");
    }
    
     function CheckSend() public  {
       Assert.equal(mc.balances(recipient),0,"Initial recipient balance should be 0");
       mc.send(recipient,25);
       Assert.equal(mc.balances(recipient),25,"Recipient balance should now be 25");
       Assert.equal(mc.balances(msgsender),10000000-25,"msgsender balance should be 10000000-25");
    }

}
