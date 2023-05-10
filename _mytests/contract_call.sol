// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.18;

contract CallExample {
    function askTheMeaningOfLife(address source) public returns (uint256) {
        (bool ok, bytes memory result) = source.call(abi.encodeWithSignature("meaningOfLifeAndAllExistence()"));
        require(ok, "call failed");

        return abi.decode(result, (uint256));
    }
}

contract AnotherContract {
    function meaningOfLifeAndAllExistence() public pure returns (uint256) {
        return 42;
    }
}
//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

contract CallAddContract {
    function callAdd(address source, uint256 x, uint256 y) public returns (uint256) {
        (bool ok, bytes memory result) = source.call(abi.encodeWithSignature("add(uint256,uint256)", x ,y));
        require(ok, "call failed");

        uint256 sum = abi.decode(result, (uint256));
        return sum;
    }
}

contract Calc {
    function add(uint256 x, uint256 y) public pure returns (uint256) {
        return x + y; 
    }
}
