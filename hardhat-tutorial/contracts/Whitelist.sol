//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Whitelist {

  //Max number of whitelisted addresses allowed
  uint8 public maxWhitelistedAddresses;

  //Create a mapping of whitelistedAddresseses
  //If an addresses is whitelisted, we should set it to true, it is false by default for all other addresses.
  mapping(address => bool) public whitelistedAddresses;

  //numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
  //NOTE: Don't change this variable name, as it will be part of verification

  uint8 public numAddressesWhitelisted;

  //Setting the Max number of whitelisted addresses
  //User will put the value at the time of deplyment
  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }
  
  /**
  addAddressToWhitelist - This function adds the address of the sender to the whitelist
   */
   function addAddressToWhitelist() public {
     //check if the user has already been whitelisted
     require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
     //check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
     require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");
     //Add the address which called the function to the whitelistedAddress array
     whitelistedAddresses[msg.sender] = true;
     //Increase the number of whitelisted addresses
     numAddressesWhitelisted += 1;
   }
}