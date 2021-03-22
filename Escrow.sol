pragma solidity ^0.5.0;

contract Escrow {

    address agent;      // controller of the escrow - address is stored on the blockchain.
    mapping(address => uint256) public deposits;

    modifier onlyAgent() {
        require(msg.sender == agent);
        _;
    }

    constructor() public {
        agent = msg.sender;         // address that deployed the smart contract.
    }

    function deposit(address payee) public onlyAgent payable {

        uint256 amount = msg.value;    //because we use payable this msg.value is available here.
        deposits[payee] = deposits[payee] + amount;
    }

    function withdraw(address payable payee) onlyAgent public {
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }

}