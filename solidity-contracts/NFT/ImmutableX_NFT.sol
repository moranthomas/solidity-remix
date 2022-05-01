// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@imtbl/imx-contracts/contracts/Mintable.sol";

contract ImuutableX_NFT is ERC721, Mintable {

    // 0x4bd34d10c4AC6Aae740C0B5C3E77E49B3aCfa872, "WindmillNFT", "WND", 0x4527be8f31e2ebfbef4fcaddb5a17447b27d2aef 
    // 0x4bd34d10c4AC6Aae740C0B5C3E77E49B3aCfa872, 1, 0x7b353535353535353535353535353535353535357d3a7b317d
    constructor(
        address _owner,
        string memory _name,
        string memory _symbol,
        address _imx
    ) ERC721(_name, _symbol) Mintable(_owner, _imx) {}

    function _mintFor(
        address user,
        uint256 id,
        bytes memory
    ) internal override {
        _safeMint(user, id);
    }

    function _baseURI() internal override view virtual returns(string memory) {
        return "https://bafybeifnjwqkakq4c7cmqipvfl6e6b4i22imvhsbfqukevp76kkarqv4ri.ipfs.dweb.link/";
    }
}


