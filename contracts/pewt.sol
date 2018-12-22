pragma solidity ^0.4.0;

import "https://github.com/souradeep-das/Pewter/node_modules/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "https://github.com/souradeep-das/Pewter/node_modules/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract pewt is ERC721Token, Ownable {
  using SafeMath for uint256;

  string public constant name = "PewTokens";
  string public constant symbol = "PEW";

  constructor() ERC721Token(name,symbol) public {

  }

  function createToken(string _tokenURI) public {
    mint(msg.sender,_tokenURI);
  }

  function mint(address _to,string _tokenURI) internal {
    uint256 newTokenId = _getNextTokenId();
    _mint(_to,newTokenId);
    _setTokenURI(newTokenId,_tokenURI);
  }

  function _getNextTokenId() private view returns(uint256){
    return totalSupply().add(1);
  }

  function getMyTokens() external view returns(uint256[]){
    return ownedTokens[msg.sender];
  }

  // the following function in ERC721BasicToken is inherited
  // function transferFrom(address _from,address _to,uint256 _tokenId)

}
