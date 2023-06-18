// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;

    string public customData1;
    string public customData2;
    string public customData3;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event CustomDataUpdated(string dataName, string data);

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        string memory _data1,
        string memory _data2,
        string memory _data3
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        customData1 = _data1;
        customData2 = _data2;
        customData3 = _data3;
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool) {
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Insufficient allowance");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function updateCustomData1(string calldata data) external {
        customData1 = data;
        emit CustomDataUpdated("customData1", data);
    }

    function updateCustomData2(string calldata data) external {
        customData2 = data;
        emit CustomDataUpdated("customData2", data);
    }

    function updateCustomData3(string calldata data) external {
        customData3 = data;
        emit CustomDataUpdated("customData3", data);
    }
}
