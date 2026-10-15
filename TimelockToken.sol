pragma solidity ^0.4.18;

contract Token {
    function transfer(address to, uint256 value) public returns (bool);
    function balanceOf(address owner) public view returns (uint256);
}

contract TimelockToken {
    address public beneficiary;
    uint256 public releaseTime;
    Token public token;

    function TimelockToken(address _token, address _beneficiary, uint256 _releaseTime) public {
        require(_beneficiary != address(0));
        require(_releaseTime > block.timestamp);
        token = Token(_token);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release() public {        require(block.timestamp >= releaseTime); 
        uint256 amount = token.balanceOf(address(this)); 
        require(amount > 0); 
        require(token.transfer(beneficiary, amount)); 
    } 
} 
