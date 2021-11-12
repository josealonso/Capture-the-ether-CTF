// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.21;
//pragma solidity 0.8.0;   // Error because msg.sender type is not "address payable"

contract GuessTheSecretNumberChallenge {
    bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    constructor() public { // payable {
        // require(msg.value == 100 wei);
        // require(msg.value == 1 ether);
    }     // Old versions: constructor() causes a warning
          // Newer versions: constructor() public causes a warning
    
    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        // require(msg.value == 1 ether);
        require(msg.value == 100 wei);
     // return uint(keccak256(abi.encodePacked(block.difficulty, now, playersAddressList)));
        
        if (keccak256(n) == answerHash) { // Warning
        // if (bytes32(keccak256(abi.encodePacked(n))) == answerHash) {
            //msg.sender.transfer(2 ether);
            msg.sender.transfer(200 wei);
        }
    }
}

contract FindInput {
    bytes32 constant ANSWER_HASH = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;
    uint8 answer = 0;

    function getAnswer() public view returns (uint8) {
        return answer;
    }

    function guess() public returns (uint8) {
        for (uint8 i = 0; i <= 255; i++) {
            if (keccak256(i) == ANSWER_HASH) {
                answer = i;  // The answer is 170
                return i;
            }
        }
    }
}



