// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

/**
 * @title TimelockToken
 * @dev Holds tokens and releases them to a beneficiary after a specified time
 */
contract TimelockToken {
    address public immutable beneficiary;
    uint256 public immutable releaseTime;
    IERC20 public immutable token;

    event Released(uint256 amount);

    constructor(address _token, address _beneficiary, uint256 _releaseTime) {
        require(_beneficiary != address(0), "TimelockToken: beneficiary is zero address");
        require(_releaseTime > block.timestamp, "TimelockToken: release time must be in the future");
        token = IERC20(_token);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release() external {
        require(block.timestamp >= releaseTime, "TimelockToken: current time is before release time");
        uint256 amount = token.balanceOf(address(this));
        require(amount > 0, "TimelockToken: no tokens to release");
        require(token.transfer(beneficiary, amount), "TimelockToken: transfer failed");
        emit Released(amount);
    }
}
