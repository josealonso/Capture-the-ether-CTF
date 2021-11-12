pragma solidity ^0.8.0;

contract GuessTheNumberChallenge {
    uint8 answer = 42;

    constructor() payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);
        // address payable adr = payable(msg.sender);

        if (n == answer) {
            payable(msg.sender).transfer(2 ether);
            // address payablemsg.sender.transfer(2 ether);
        }
    }
}

