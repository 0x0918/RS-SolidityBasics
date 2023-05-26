// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */
	mapping(address => uint256) balance;
	mapping(address => uint256) depositDate;

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
		return balance[user];
    }

    function depositEther() external payable {
        balance[msg.sender] = msg.value;
		depositDate[msg.sender] = block.timestamp;
    }

	receive() external payable {}

    function withdrawEther(uint256 amount) external {
		require(amount <= balanceOf(msg.sender));
		(bool ok, ) = msg.sender.call{value: amount}("");
		require(ok);
		require(block.timestamp >= depositDate[msg.sender] + 7 days, "1 week lockup");
    }
}
