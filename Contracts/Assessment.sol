// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable private owner;
    mapping(address => uint256) private balances;

    event Deposit(address indexed account, uint256 amount);
    event Withdraw(address indexed account, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function deposit() public payable {
        uint256 _amount = msg.value;
        uint256 _previousBalance = balances[msg.sender];
        balances[msg.sender] += _amount;
        assert(balances[msg.sender] == _previousBalance + _amount);
        emit Deposit(msg.sender, _amount);
    }

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);
    
    function withdraw(uint256 _amount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint256 _previousBalance = balances[msg.sender];
        if (balances[msg.sender] < _amount) {
            revert InsufficientBalance({
                balance: balances[msg.sender],
                withdrawAmount: _amount
            });
        }
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        assert(balances[msg.sender] == (_previousBalance - _amount));
        emit Withdraw(msg.sender, _amount);
    }

    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        require(_to != address(0), "Invalid address");
        uint256 _previousBalanceFrom = balances[msg.sender];
        uint256 _previousBalanceTo = balances[_to];
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        assert(balances[msg.sender] == _previousBalanceFrom - _amount);
        assert(balances[_to] == _previousBalanceTo + _amount);
        emit Transfer(msg.sender, _to, _amount);
    }
}
