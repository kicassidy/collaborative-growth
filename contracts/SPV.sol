pragma solidity ^0.5.4;

import "../lib/dappsys-monolithic/token.sol";
import "../lib/dappsys-monolithic/auth.sol";

contract SPV is DSToken {

  address public parentToken;
  uint public parentTokenId;

  constructor(address _parentToken, uint256 _parentTokenId, bytes32 _symbol,) public {
        parentToken = _parentToken;
        parentTokenId = _parentTokenId;
        symbol = _symbol;
  }

  function parentToken() external view returns(address) {
    return parentToken;
  }

  function parentTokenId() external view returns(uint256) {
    return parentTokenId;
  }



}
