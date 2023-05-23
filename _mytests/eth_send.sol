// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TakeMoney {

	receive() external payable {}

	function viewBalance() public view returns (uint256) {
		return address(this).balance;
	}
}

contract ForwardMoney {

	function payMe() public payable {}

	function sendMoney(address luckyAdress) public payable {
		uint256 myBalance = viewBalance();
		luckyAdress.call{value: myBalance}("");
	}

	function viewBalance() public view returns (uint256) {
		return address(this).balance;
	}
}
