// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract SkillsCoin_ERC20 {
	string public name;
	string public symbol;

	mapping(address => uint256) public balanceOf;
	address public owner;
	uint8 public decimals;

	uint256 public totalSupply;

	mapping(address => mapping(address => uint256)) public allowance;

	constructor() {
		name = "SkillsCoin";
		symbol = "SKC";
		decimals = 18;
		owner = msg.sender;
	}

	function mint(uint256 amount) public {
		totalSupply += amount;
		balanceOf[msg.sender] += amount;
	}

	function transfer(address to, uint256 amount) public returns (bool) {
		return helperTransfer(msg.sender, to, amount);
	}

	function approve(address spender, uint256 amount) public returns (bool) {
		allowance[msg.sender][spender] = amount;

		return true;
	}

	function transferFrom(address from, address to, uint256 amount) public returns (bool) {
		if(msg.sender != from) {
			require(allowance[from][msg.sender] >= amount, "not enough allowance bitch");

			allowance[from][msg.sender] -= amount;
		}

		return helperTransfer(from, to, amount);
	}

	function helperTransfer(address from, address to, uint256 amount) internal returns (bool) {
		require(balanceOf[from] >= amount, "not enough tokens bitch");
		require(to != address(0), "cannot send to address(0)");
		balanceOf[from] -= amount;
		balanceOf[to] += amount;

		return true;
	}
}
