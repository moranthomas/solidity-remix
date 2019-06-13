pragma solidity ^0.4.0;

contract Transaction {
    // idea here is we just want to send some ether to an address without calling any functions 
    
    event SenderLogger(address);
    event ValueLogger(uint256);
    
    address private owner;
    
    modifier isOwner {
        require(owner == msg.sender);
        _;
    }
    
    modifier validValue {
        assert(msg.value >=1 ether);
        _;
    }
    
    function Transaction() {
        owner = msg.sender;
    }
    
    function() payable isOwner validValue {
        SenderLogger(msg.sender);
        ValueLogger(msg.value);
        //our fallback function - this gets called when no function name is specified by a caller 
    }
}