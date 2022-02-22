// SPDX-License-Identifier: MIT
pragma solidity 0.8 <= 0.9;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract DemoToken is ERC20 {
    address admin; 
    constructor() ERC20('Demo Token', 'DTX') {
        _mint(msg.sender, 10000 * 10 **18);
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, 'only admin');
        _mint(to, amount);
    }
}

