// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

interface ISplit {
    struct Partner {
        address payable wallet;
        uint256 balance;
    }

    function partner1() external view returns (Partner memory);
    function partner2() external view returns (Partner memory);

    function deposit() external payable;
    function withdraw() external;
}
