// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Collectible is ERC721URIStorage {
    mapping(string => bool) public hasBeenMinted;
    mapping(uint256 => Item) public tokenIdToItem;

    struct Item {
        address owner;
        address creator;
        uint256 royalty;
    }

    Item[] private items;

    event ItemMinted(uint256 tokenId, address creator, string metadata, uint256 royalty);

    constructor() ERC721("MyNFT", "MNFT") {}

    function createCollectible(string memory metadata, uint256 royalty)
        public
        returns (uint256)
    {
        require(
            !hasBeenMinted[metadata],
            "This metadata has already been used to mint an NFT."
        );
        require(
            royalty >= 10 && royalty <= 25,
            "Royalties must be between 10% and 25%."
        );
        Item memory newItem = Item(msg.sender, msg.sender, royalty);
        items.push(newItem);
        uint256 newItemId = items.length;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, metadata);
        tokenIdToItem[newItemId] = newItem;
        hasBeenMinted[metadata] = true;
        emit ItemMinted(newItemId, msg.sender, metadata, royalty);
        return newItemId;
    }

    function getItem(uint256 tokenId) public view returns (address, address, uint256)
    {
        return (tokenIdToItem[tokenId].owner, tokenIdToItem[tokenId].creator, tokenIdToItem[tokenId].royalty);
    }
}