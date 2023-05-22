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

	function passAddress() external view returns (address) {
		return address(this);
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

contract RareCoin_ERC20 {
	string public name;
	string public symbol;

	mapping(address => uint256) public balanceOf;
	address public owner;
	address public source;
	uint8 public decimals;
	
	uint256 public totalSupply;

	mapping(address => mapping(address => uint256)) public allowance;

	constructor(address _address) {
		name = "RareCoin";
		symbol = "REC";
		decimals = 18;
		owner = msg.sender;
		source = _address;
	}

	function trade(uint256 amount) public {
		(bool ok1, bytes memory r_approve) = source.call(abi.encodeWithSignature("approve(address,uint256)", address(this), amount));
		require(ok1, "not approved");
		(bool ok2, bytes memory r_transfer) = source.call(abi.encodeWithSignature("transferFrom(address,address,uint256)", msg.sender, address(this), amount));
		require(ok2, "not transfered");

		abi.decode(r_approve, (bool));
		abi.decode(r_transfer, (bool));

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
