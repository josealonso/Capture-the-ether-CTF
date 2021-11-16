// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GuessTheSecretNumberChallenge {
    bytes32 constant ANSWER_HASH = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    constructor() payable {
        require(msg.value == 100000000 gwei);    // 100000000 gwei equals to 0.1 ethers
    }
    
    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 0.1 ether);

        if (bytes32(keccak256(abi.encodePacked(n))) == ANSWER_HASH) {
            payable(msg.sender).transfer(0.2 ether);
        }
    }
}

contract FindInput {
    bytes32 constant ANSWER_HASH = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;
    
    function reverseHash() public pure returns (uint8) {
        uint8 answer = 0;  // It is assumed that the number is between 0 and 255
        for (uint8 i = 0; i <= 255; i++) {
            if (bytes32(keccak256(abi.encodePacked(i))) == ANSWER_HASH) {
            // if (keccak256(i) == ANSWER_HASH) {
                answer = i;  // The answer is 170
            }
        }
        return answer;
    }
}


