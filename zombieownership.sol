// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./zombieattack.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract zombieOwnerShip is ZombieAttack, ERC721 {
    mapping (uint => address ) zombieApprovals;

    constructor() ERC721("CryptoZombies", "CZ") {}

    function balanceOf(address _owner) public view override returns(uint256) {
        return ownerZombieCount[_owner];
    }

    function ownerOf(uint256 _tokenID)  public view override returns (address) {
        return zombieToOwner[_tokenID];
    }

    function _innerTransfer(address _from, address _to, uint256 _tokenId) private {
        ownerZombieCount[_to]++;
        ownerZombieCount[_from]--;
        zombieToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public override {
        require(zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
        _innerTransfer(_from, _to, _tokenId);
    }

    function approve(address _approved, uint256 _tokenId) public override payable onlyOwnerOf(_tokenId) {
        zombieApprovals[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }

}
