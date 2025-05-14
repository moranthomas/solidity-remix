// SPDX-License-Identifier: MIT
/* pragma solidity  >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";
contract FlemingToken is ERC20PresetMinterPauser {

    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor(uint256 initialSupply) ERC20PresetMinterPauser("FlemingToken", "FLEM") {
        _mint(msg.sender, initialSupply * (10**18));
        grantRole(BURNER_ROLE, msg.sender);
    }

    function burn(uint256 value) public onlyRole(BURNER_ROLE) override {
        super._burn(msg.sender, value);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) override {
        super._mint(to, amount);
    }

} */

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FlemingToken is ERC20, Ownable {
    constructor(uint256 initialSupply) 
        ERC20("FlemingToken", "FLEM") 
        Ownable(msg.sender) 
    {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
