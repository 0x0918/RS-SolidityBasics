// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ContractB {
    // Your contract logic goes here
}

contract ContractAFactory {
    ContractB public contractB; // Instance of ContractB
    
    event ContractADeployed(address contractAAddress);

    function deployContractA() public {
        ContractA contractA = new ContractA(address(contractB));
        emit ContractADeployed(address(contractA));
    }

    function deployContractB() public {
        contractB = new ContractB();
    }
}

contract ContractA {
    ContractB public contractB; // Instance of ContractB

    constructor(address _contractBAddress) {
        contractB = ContractB(_contractBAddress); // Set the ContractB instance using the provided address
    }

    function getContractBAddress() public view returns (address) {
        return address(contractB); // Return the address of ContractB
    }
}