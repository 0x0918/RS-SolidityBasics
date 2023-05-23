// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract WhatTimeIsIt {

    function timestamp() public view returns (uint256) {
        return block.timestamp;
    }
}
