// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ERC20 {
	string public name; // name for the token
	string public symbol; //symbol of the token

	mapping(address => uint256) public balanceOf; // store everyone's balance (balanceOf -> according to specification)
	address public owner;

	constructor(string memory _name, string memory _symbol) {
		name = _name;
		symbol = _symbol;

		owner = msg.sender;
	}

	function mint(address to, uint256 amount) public {
		require(msg.sender == owner, "only owner can create tokens ;(");
		balanceOf[owner] += amount;
	}

}



