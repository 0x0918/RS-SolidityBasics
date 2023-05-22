// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

/*contract Example {

    function payME() public payable {}

    function howMuchEtherIHave() public view returns (uint256) {
        return address(this).balance;
    }

    function howMuchEtherYouHave() public view returns (uint256) {
        return msg.sender.balance;
    }
}*/

contract ReceiveEther {
		
		function takeMoney() public payable {}

		function myBalance() public view returns (uint256) {
				return address(this).balance;
		}
}

contract SendEther {

		constructor() payable {}
		
		function sendMoney(address receiveEtherContract) public payable {
				uint256 amount = myBalance();
				(bool ok, ) = receiveEtherContract.call{value: amount}(abi.encodeWithSignature("takeMoney()"));			
				require(ok, "transfer failed");
		}

		function myBalance() public view returns (uint256) {
				return address(this).balance;
		}
}