// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
contract ICOToken is ERC20 {
    
    uint256 public unitsOneEthCanBuy  = 10;
    address public tokenOwner;         // the owner of the token
    
    // constructor will only be invoked during contract deployment 
    constructor(string memory name, string memory symbol) 
    ERC20(name, symbol) {
        tokenOwner = msg.sender;       // address of the token owner        
        uint256 n = 1000;
        // mint the tokens
        _mint(msg.sender, n * 10**uint(decimals()));        
    }
    // this function is called when someone sends ether to the token contract
    receive() external payable {        
        // msg.value (in Wei) is the ether sent to the token contract
        // msg.sender is the account that sends the ether to the token contract
        // amount is the token bought by the sender
        uint256 amount = msg.value * unitsOneEthCanBuy;
        
        // ensure you have enough tokens to sell
        require(balanceOf(tokenOwner) >= amount, 
            "Not enough tokens");
        
        // transfer the token to the buyer
        _transfer(tokenOwner, msg.sender, amount);
        
        // emit an event to inform of the transfer        
        emit Transfer(tokenOwner, msg.sender, amount);
        
        // send the ether earned to the token owner
        payable(tokenOwner).transfer(msg.value);
    }
}