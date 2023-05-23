// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract SaveMoney {

	function withdrawMoney() public payable {
		require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "not the first remix address");
		msg.sender.call{value: viewBalance()}("");
	}

	function viewBalance() public view returns (uint256) {
		return address(this).balance;
	}

	receive() external payable {}
}
