// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    uint256 public balance;
    string public userName;
    string[] public ItemForSale = ["1. Blue Shirt (300)","2. Black Pant (400)","3. Red Hat (200)","4. Jacket(500)"]; 
    string[] public MyInventory;
 
    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    event NameSet(string name);
    event GetItemForSale();
    event GetInventory();
    event GetItem(uint256 _value, string name);

    constructor() payable {
        owner = payable(msg.sender);
        balance = 0;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function setName(string memory _name) public {
        require(msg.sender == owner, "You are not the owner of this account");
        userName = _name;
        emit NameSet(_name);
    }

    function deposit(uint256 _amount) public payable {
        uint _previousBalance = balance;
        require(msg.sender == owner, "You are not the owner of this account");
        balance += _amount;
        assert(balance == _previousBalance + _amount);
        emit Deposit(_amount);
    }

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }
        balance -= _withdrawAmount;
        assert(balance == (_previousBalance - _withdrawAmount));
        emit Withdraw(_withdrawAmount);
    }

    function getItemForSale() public view returns(string[] memory) {
        return ItemForSale;
    }

    function getInventory() public view returns(string[] memory){
        return MyInventory;
    }

    function buyItem(uint _value) public returns(string memory){
        if (_value == 1) {
            balance -= 300;
            MyInventory.push("Blue Shirt");
            emit GetItem(_value, "Blue Shirt");
            return "You now have a Blue Shirt.";
        } else if (_value == 2) {
            balance -= 400;
            MyInventory.push("Black Pant");
            emit GetItem(_value, "Black Pant");
            return "You now have a Black Pantn";
        } else if (_value == 3) {
            balance -= 200;
            MyInventory.push("Red Hat");
            emit GetItem(_value, "Red Hat");
            return "You now have a Red Hat";
        } else if (_value == 4) {
            balance -= 500;
            MyInventory.push("Jacket");
            emit GetItem(_value, "Jacket");
            return "You now have a Jacket";
        } else {
            emit GetItem(_value, "Wrong index position");
            return "There is no item at such index for sale";
        }
    }
}
