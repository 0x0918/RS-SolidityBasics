// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract SkillsCoin_ERC20 {
	string public name;
	string public symbol;

	mapping(address => uint256) public SKC_balanceOf;
	address public owner;
	uint8 public decimals;

	uint256 public SKC_totalSupply;

	mapping(address => mapping(address => uint256)) public SKC_allowance;

	constructor() {
		name = "SkillsCoin";
		symbol = "SKC";
		decimals = 18;
		owner = msg.sender;
	}

	function passAddress() external view returns (address) {
		return address(this);
	}

	function mint(uint256 amount) public {
		SKC_totalSupply += amount;
		SKC_balanceOf[msg.sender] += amount;
	}

	function transfer(address to, uint256 amount) public returns (bool) {
		return helperTransfer(msg.sender, to, amount);
	}

	function approve(address spender, uint256 amount) public returns (bool) {
		SKC_allowance[msg.sender][spender] = amount;

		return true;
	}

	function transferFrom(address from, address to, uint256 amount) public returns (bool) {
		if(msg.sender != from) {
			require(SKC_allowance[from][msg.sender] >= amount, "not enough allowance bitch");

			SKC_allowance[from][msg.sender] -= amount;
		}

		return helperTransfer(from, to, amount);
	}

	function helperTransfer(address from, address to, uint256 amount) internal returns (bool) {
		require(SKC_balanceOf[from] >= amount, "not enough tokens bitch");
		require(to != address(0), "cannot send to address(0)");
		SKC_balanceOf[from] -= amount;
		SKC_balanceOf[to] += amount;

		return true;
	}
}

contract RareCoin_ERC20 {
	string public name;
	string public symbol;

	SkillsCoin_ERC20 public skad;
	
	mapping(address => uint256) public REC_balanceOf;
	address public owner;
	address public source;
	uint8 public decimals;
	
	uint256 public REC_totalSupply;

	mapping(address => mapping(address => uint256)) public REC_allowance;

	constructor(address _address) {
		name = "RareCoin";
		symbol = "REC";
		decimals = 18;
		owner = msg.sender;
		source = SkillsCoin_ERC20(_address).passAddress();
	}

	/* function getAddress(address source) public returns (address) {
		(bool ok, bytes memory address1) = source.call(abi.encodeWithSignature("passAddress()"));
		require(ok, "call failed");

		address a1 = abi.decode(address1, (address));
		return a1;
	}*/

	function mint(uint256 amount) public {
		REC_totalSupply += amount;
		REC_balanceOf[msg.sender] += amount;
	}

	function transfer(address to, uint256 amount) public returns (bool) {
		return helperTransfer(msg.sender, to, amount);
	}

	function approve(address spender, uint256 amount) public returns (bool) {
		REC_allowance[msg.sender][spender] = amount;

		return true;
	}

	function transferFrom(address from, address to, uint256 amount) public returns (bool) {
		if(msg.sender != from) {
			require(REC_allowance[from][msg.sender] >= amount, "not enough allowance bitch");

			REC_allowance[from][msg.sender] -= amount;
		}

		return helperTransfer(from, to, amount);
	}

	function helperTransfer(address from, address to, uint256 amount) internal returns (bool) {
		require(REC_balanceOf[from] >= amount, "not enough tokens bitch");
		require(to != address(0), "cannot send to address(0)");
		REC_balanceOf[from] -= amount;
		REC_balanceOf[to] += amount;

		return true;
	}
}
