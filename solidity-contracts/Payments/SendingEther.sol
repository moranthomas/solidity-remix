pragma solidity ^0.6.0;

contract SendingEther {

    // From the EatTheBlocks
    mapping(address => uint) balances;

    // NOTE msg.sender is the address that sent the transactions

    // payable here means you can send ether to the smart contract
    function invest() external payable {
        if(msg.value < 1000) {
            revert(); //cancel the transaction
        }
        balances[msg.sender] += msg.value;
    }

    function balanceOf() external view returns(uint) {
        return address(this).balance;
    }

    // payable here means that the address you are sending to is payable (required to send eth to it)
    function sendEther(address payable recipient) external {
        recipient.transfer(1 ether);
        // transfer 1 eth from this smart contract to recipient
    }
}