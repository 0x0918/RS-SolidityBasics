// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract mappings {
    // returns false by default
    mapping(uint256 => bool) public mapToBool;

    // returns 0 by default
    mapping(uint256 => uint256) public mapToUint;

    // returns 0x0000000000000000000000... by default
    mapping(uint256 => address) public mapToAdress;
}