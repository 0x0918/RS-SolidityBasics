// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract abiExample {
    function meaninOfLifeAndAllExistence() public pure returns (bytes memory) {
        return msg.data;
    }

    function getEncoding(uint x) public pure returns (bytes memory) {
        return abi.encodeWithSignature("takeOneArg()", x);
    }

    function takeOneArg(uint256 x) public pure returns (bytes memory) {
        return msg.data;
    }

    function encodingXY(uint x, uint y) public pure returns (bytes memory) {
        return abi.encode(x,y);
    }

    function getATuple(bytes memory encoding) public pure returns (uint256, uint256) {
        (uint256 x, uint256 y) = abi.decode(encoding, (uint256, uint256));
        return(x,y);
    }
}
