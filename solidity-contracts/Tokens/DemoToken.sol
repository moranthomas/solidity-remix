// SPDX-License-Identifier: MIT
pragma solidity 0.8 <= 0.9;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract DemoToken is ERC20 {
   constructor() ERC20('DemoToken', 'DTX') {
      mint(msg.sender, 1000 * (10 **18));
   }

   function mint(address recipient, uint amount) private {
      _mint(recipient, amount);
   }
   
   function faucet(address recipient, uint amount) external {
      _mint(recipient, amount);
   }
   
}