// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";
contract MyTokenERC20 is ERC20PresetMinterPauser {
    
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
    
    constructor(uint256 initialSupply) ERC20PresetMinterPauser("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
        grantRole(BURNER_ROLE, msg.sender);
    }
    
    function burn(uint256 value) public onlyRole(BURNER_ROLE) override {
        super._burn(msg.sender, value);
    }

}