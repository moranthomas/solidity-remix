pragma solidity ^0.5.1;

contract CommunityChest {

    event Received(address, uint);
    event Balance(uint);

    uint contractBalance = address(this).balance;
    mapping (address => uint256) balances;

    function withdrawAll() public {
        contractBalance = 0;
        msg.sender.transfer(address(this).balance);
    }

    function deposit() payable public {
        contractBalance += msg.value;
        emit Balance(contractBalance);
    }

    function getBalance() public view returns (uint) {
        return contractBalance;
    }
}
