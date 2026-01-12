// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract MockKitty {
    function getKitty(uint256 _id) external pure returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    ) {
        // Return dummy data
        // We return a specific gene sequence so you can test if the zombie DNA changes correctly
        // For example, let's return a gene with value 999999
        return (false, true, 0, 0, 0, 0, 0, 0, 0, 999999);
    }
}
