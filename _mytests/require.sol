// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract contRequire {
    function mustNotBeFive(uint256 x) public pure returns (uint256) {
        require(x != 5, "five is not valid");
        return x * 2;
    }
}
