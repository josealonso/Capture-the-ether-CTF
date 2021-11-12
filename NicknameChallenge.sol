// SPDX-License-Identifier: GPL-3.0

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

/*    function setNumber(uint256 number) public {
        c.setNumber(number);
    } */

    function setNickname(string memory s) public {
        // conversion from string/bytes to bytes32
        c.setNickname(bytes32(bytes(s))); 
    }
    
    function setString(string memory s2) public {
        // c.setString(bytes32(bytes(s2)));
    }
}

/*
 I can check here https://ropsten.etherscan.io/tx/0x32bc55b78005d5a50d0c245b5e29f165639b7feef23f4bfcc1ee8fc09f5b1746 the conversion from string to bytes32 is correct. 
But the state is not modified !!
*/

