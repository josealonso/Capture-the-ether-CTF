// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GuessTheNumberChallenge {
    
    uint8 constant ANSWER = 42;

    constructor() payable {
        require(msg.value == 100000000 gwei);    // equals to 0.1 ethers
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
    
    address payable constant MY_ROPSTEN_ACCOUNT = payable(0x5f793AbBd751f1Ac5B0F95f3C3D117E5Fd218c41);
    uint8 constant NUMBER = 42;
    address payable constant ADDRESSS_WHERE_CHALLENGE_CONTRACT_IS_DEPLOYED = payable(0xF1DDe3178f857B008dAA3578a1B13F592f78EfE5);
    
    GuessTheNumberChallenge challenge = GuessTheNumberChallenge(ADDRESSS_WHERE_CHALLENGE_CONTRACT_IS_DEPLOYED);
    
    function guess() public payable {
        challenge.guess{value: 0.1 ether}(NUMBER);
    }
    
    // Important: a withdraw function is needed if you want your ethers back
    function withdrawToMyAccount() public {
        bool success = false;
        MY_ROPSTEN_ACCOUNT.transfer(address(this).balance);
    }
    
    receive() external payable {}
}

/*
Adapted to 0.8 version --->
  
  Used call instead of transfer.
  Used the "constant" and "constructor" keywords.
  The "address" and "address payable" types can not be converted implicitly. 
  
*/

