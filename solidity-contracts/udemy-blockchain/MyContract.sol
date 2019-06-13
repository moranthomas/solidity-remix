pragma solidity ^0.5.0;

contract MyContract {

    uint myVariable;
    address owner;

    constructor() public payable {
        myVariable = 5;
        owner = msg.sender;
    }

    function setMyVariable(uint myNewVariable) public {
        if(msg.sender == owner) {
            myVariable = myNewVariable;
        }
    }

    function getMyVariable() public view returns(uint) {
        return myVariable;
    }

    function getMyBalance() public view returns(uint) {
        return address(this).balance;
    }

    function kill() public{
        // Not properly working
        // calling selfdestruct(address) sends all of the contract's current balance to address.
        if(msg.sender == owner) {
            selfdestruct(0x0365a470E44Ae11D7eBDd36744E7079864aa130D);
        }
        else {
            revert();
        }
    }

    function () external payable {

    }

}