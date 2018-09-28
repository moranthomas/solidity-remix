pragma solidity ^0.4.0;

interface Regulator {
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}


contract Bank is Regulator { 
    
    uint private value;
    address private owner;
    
    modifier ownerBasedFunctionality{
        require(owner == msg.sender);
        _;
    }

function testFunction() {
    throw;
}
    
    function Bank(uint amount){
        value = amount;   
        owner = msg.sender;
    }
    
    function deposit(uint amount)  ownerBasedFunctionality {
        value += amount;
    }
    
    function withdraw(uint amount)  ownerBasedFunctionality{
        value -= amount;
    }
    
    function balance() returns (uint) {
        return value;
    }
    
    function checkValue(uint amount) returns (bool) {
        return value >= amount;    
    }
    
    function loan() returns (bool) {
        return true;
    }
    
}

contract BankContract is Bank {
    string private name;
    uint private age;
    
    function setName(string newName) {
        name = newName;
    }
    
    function getName() returns (string) {
        return name;
    }
    
    function setAge(uint newAge) {
        age = newAge;
    }
    
    function getAge() returns (uint) {
        return age;
    }
    
}



contract testThrows {
    
    function testAssert() {
        assert(1 == 1);
    }
    
    function testRequire () {
        require(2==1);
    }
    
    function testRevert() {
        revert();   //an example of using revert would be to refund the ether to participants in an ICO if you have reached capacity already 
    }
    
    function testThrow() {
        throw;
    }
}
