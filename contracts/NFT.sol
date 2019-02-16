pragma solidity ^0.5.0;

import "../lib/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";

contract NFT is ERC721, ERC721Metadata {
  constructor (string memory name, string memory symbol) public ERC721Metadata(name, symbol) {
      // I don't think we're using solhint, but just in case:
      // solhint-disable-previous-line no-empty-blocks
  }

}
