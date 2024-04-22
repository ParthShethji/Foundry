// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Whitelist{
    uint8 public maxWhitelist;
    mapping (address => bool) public whitelistedAddresses;
    uint8 public numWhitelisted;

    constructor(uint8 _maxWhitelist){
        maxWhitelist = _maxWhitelist;
    }

    function addAddressToWhitelist() public{
        require(!whitelistedAddresses[msg.sender], "sender already whitelisted");
        require(maxWhitelist>numWhitelisted, "limit reached");
        whitelistedAddresses[msg.sender]=true;
        numWhitelisted +=1;
    }
}