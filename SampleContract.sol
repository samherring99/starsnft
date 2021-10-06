// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/access/Ownable.sol";

contract YourContract is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor() ERC721("Name", "SYMBOL") {}
    
    function baseURI() public override view virtual returns (string memory) {
        return "https://raw.githubusercontent.com/GITHUB_USER/GITHUB_REPO/master/desc/";
    }
    
    function contractURI() public view virtual returns (string memory) {
        return "https://raw.githubusercontent.com/GITHUB_USER/GITHUB_REPO/master/metadata.json";
    }
    
    function safeMint() public payable {
        require(471 > _tokenIds.current() + 1, "Not enough tokens left to buy.");
        
        _safeMint(msg.sender, _tokenIds.current());
        _tokenIds.increment();
        
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return super.tokenURI(tokenId);
    }
}