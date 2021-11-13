// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GuessTheNumberChallenge {
    
    uint8 constant ANSWER = 42;

    constructor() payable {
        require(msg.value == 100000000 gwei);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 0.1 ether);
        bool success = false;

        if (n == ANSWER) {
            (success, ) = payable(msg.sender).call{value: 0.2 ether}("");
        }
    }
}

contract Attacker {
    
    uint8 constant NUMBER = 42;
    address payable constant ADDRESSS_WHERE_CHALLENGE_CONTRACT_IS_DEPLOYED = payable(0xc7dd3c70834f2B4742B112f4423bD11e18096df0);
    GuessTheNumberChallenge challenge = GuessTheNumberChallenge(ADDRESSS_WHERE_CHALLENGE_CONTRACT_IS_DEPLOYED);
    
    function guess() public payable {
        challenge.guess{value: 0.1 ether}(NUMBER);
    }
    
    receive() external payable {}
}

/*
Adapted to 0.8 version --->
  
  Used call instead of transfer.
  Used the "constant" and "constructor" keywords.
  The "address" and "address payable" types can not be converted implicitly. 
*/

