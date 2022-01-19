pragma solidity ^0.5.11;

contract Payable {

    mapping(address => uint) balances;

    function invest() external payable {
        if(msg.value < 1 ether) {
            revert();
        }
        balances[msg.sender] += msg.value;
    }

    function balanceOf() external view returns(uint) {
        return address(this).balance;
    }
}