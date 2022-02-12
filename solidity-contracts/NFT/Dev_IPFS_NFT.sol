// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Dev_IPFS_NFT is ERC721("RocketToken", "RKT") {
    constructor() {
        _mint(msg.sender, 1);
        _mint(msg.sender, 2);
    }

    function _baseURI() internal override view virtual returns(string memory) {
        return "https://bafybeidv23smhvrwj6sxarlce4muozdlfmwsw543yw56y3uwivy3tksycu.ipfs.dweb.link/";
    }
}