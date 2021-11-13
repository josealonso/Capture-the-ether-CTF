// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

// Relevant part of the CaptureTheEther contract.
contract CaptureTheEther {
    mapping (address => bytes32) public nicknameOf;

    function setNickname(bytes32 nickname) public {
        nicknameOf[msg.sender] = nickname;
    }
}

// Challenge contract. You don't need to do anything with this; it just verifies
// that you set a nickname for yourself.
contract NicknameChallenge {
    CaptureTheEther cte = CaptureTheEther(msg.sender);
    address player;

    // Your address gets passed in as a constructor parameter.
    constructor(address _player) {
        player = _player;
    }

    // Check that the first character is not null.
    function isComplete() public view returns (bool) {
        return cte.nicknameOf(player)[0] != 0;
    }
}

contract Attacker {
    address constant ADDRESSS_WHERE_CAPTURETHEETHER_IS_DEPLOYED = 0x71c46Ed333C35e4E6c62D32dc7C8F00D125b4fee;
    CaptureTheEther c = CaptureTheEther(ADDRESSS_WHERE_CAPTURETHEETHER_IS_DEPLOYED);

    function setNickname(string memory s) public {
        // conversion from string/bytes to bytes32
        c.setNickname(bytes32(bytes(s))); 
    }
    
}

/*
 1.- CaptureTheEther is deployed at 0x71c46Ed333C35e4E6c62D32dc7C8F00D125b4fee
 2.- NicknameChallenge is deployed at 0xB1FEcaBFC2E9e3DF4095c34eDcC304DBc25aaF50
 3.- I deploy the Attacker smart contract.
 4.- I execute the setNickname function from the Attacker contract.
 5.- Read the state variable nicknameOf[adr], being adr the address where the Attacker contract has been deployed.
*/
