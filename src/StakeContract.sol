// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error StakeContract_TransferFailed();

contract StakeContract {
    mapping(address => uint256) public s_balances;

    function stake(uint256 amount, address token) external returns (bool) {
        s_balances[msg.sender] = s_balances[msg.sender] + amount;
        // call the transfer function of an ERC20 token
        bool success =  IERC20(token).transferFrom(msg.sender, address(this), amount);
        if (!success) revert StakeContract_TransferFailed();
        return success;



    }
}
