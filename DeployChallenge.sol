// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DeployChallenge {
    // This tells the CaptureTheFlag contract that the challenge is complete.
    function isComplete() public pure returns (bool) {
        return true;
    }
}

// Challenge contract deployed at address: 0x34C781f0fE7Ba5B7d415ba88B1638eD78510FB93

// https://ropsten.etherscan.io/address/0x34C781f0fE7Ba5B7d415ba88B1638eD78510FB93 ---> 
// Under the Contract tab: This contract was created by the contract code at 0x71c46ed333c35e4e6c62d32dc7c8f00d125b4fee
Note: We also found another 3332 contracts with exact matching byte codes
// When pressed the "Decompile Bytecode" on etherscan, the following code is generated:

#
#  Panoramix v4 Oct 2019 
#  Decompiled source of ropsten:0x34C781f0fE7Ba5B7d415ba88B1638eD78510FB93
# 
#  Let's make the world open source 
# 

const isComplete = 1

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

