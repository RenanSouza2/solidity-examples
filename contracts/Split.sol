// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Split {
    struct Partner {
        address payable wallet;
        uint256 balance;
    }

    Partner public partner1;
    Partner public partner2;

    constructor(address payable _partner1, address payable _partner2) {
        partner1.wallet = _partner1;
        partner2.wallet = _partner2;
    }

    function deposit() external payable {
        uint256 amount = msg.value / 2;
        partner1.balance += amount;
        partner2.balance += amount;
    }

    function _withdraw(Partner storage partner) internal {
        uint256 amount = partner.balance;
        partner.balance = 0;
        partner.wallet.transfer(amount);
    }

    function withdraw() external {
        if (msg.sender == partner1.wallet) return _withdraw(partner1);
        if (msg.sender == partner2.wallet) return _withdraw(partner2);

        revert("Unauthorized access");
    }
}
