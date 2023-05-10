// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ERC20 {
	string public name;
	string public symbol;

	mapping(address => uint256) public balanceOf; // Store everyone's balance according to ERC20 specification (balanceOf)
	address public owner;
	uint8 public decimals;
	
	uint256 public totalSupply; // Store total supply according to ERC20 specification (totalSupply)

	// owner -> spender -> allowance
	// This enables an owner to give allowance to multiple adresses
	mapping(address => mapping(address => uint256)) public allowance;

	constructor(string memory _name, string memory _symbol) {
		name = _name; 													   // Name for the token to be defined upon deployment
		symbol = _symbol; 												   // Symbol for the token to be defined upon deployment
		decimals = 18;

		owner = msg.sender; 											   // Creator of the contract becomes owner
	}

	// Mint new tokens to owner's adress (to)
	function mint(address to, uint256 amount) public {
		require(msg.sender == owner, "only owner can create tokens ;(");   // Checks if contract caller is owner
		require(totalSupply + amount <= 1000000 * 10**decimals, "can't mint more tokens bahhh"); // Limit number of tokens to mint
		totalSupply += amount;											   // Updates total supply (minted tokens)
		balanceOf[owner] += amount; 									   // Send tokens to the owner only (not usual)
	}
	
	// Transfer tokens
	function transfer(address to, uint256 amount) public returns(bool) {
		return helperTransfer(msg.sender, to, amount);
	}

	// Allowance for withdrawal
	function approve(address spender, uint256 amount) public returns(bool) {
		allowance[msg.sender][spender] = amount; // Spender refers to address of the account that is being granted the allowance by the msg.sender

		return true;
	}
	
	function transferFrom(address from, address to, uint256 amount) public returns(bool) {
		if(msg.sender != from) {
			require(allowance[from][msg.sender] >= amount, "not enough allowance bitch");

			allowance[from][msg.sender] -= amount;
		}

		return helperTransfer(from, to, amount);
	}

	// THIS FUNCTION HAS TO BE INTERNAL!!!
	function helperTransfer(address from, address to, uint256 amount) internal returns (bool) {
		require(balanceOf[from] >= amount, "not enough money bitch");
		require(to != address(0), "cannot send to address(0)");
		balanceOf[from] -= amount;
		balanceOf[to] += amount;

		return true;
	}
}
