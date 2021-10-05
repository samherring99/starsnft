// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/access/Ownable.sol";
//import "@openzeppelin/contracts/drafts/Counters.sol";

contract Shapes is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor() ERC721("Stars", "STAR") {}
    
    function baseURI() public override view virtual returns (string memory) {
        return "https://raw.githubusercontent.com/samherring99/starsnft/main/desc/";
    }
    
    function contractURI() public view virtual returns (string memory) {
        return "https://raw.githubusercontent.com/samherring99/starsnft/main/metadata.json";
    }
    
    function safeMint() public payable {
        //require(isSaleActive, "Sale is currently not active");
        require(471 > _tokenIds.current() + 1, "Not enough tokens left to buy.");
        //require(_amount > 0 && _amount < MAX_TOKENS_PER_SALE + 1, "Amount of tokens exceeds amount of tokens you can purchase in a single purchase.");
        //require(msg.value >= price, "Amount of ether sent not correct.");
        
        _safeMint(msg.sender, _tokenIds.current());
        _tokenIds.increment();
        
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return super.tokenURI(tokenId);
    }
}