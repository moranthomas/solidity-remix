pragma solidity ^0.4.0;

import "./ERC20.sol";

contract ThomasToken is ERC20 {
    
    string public constant symbol ="TT";
    string public constant name = "Thomas Token";
    uint8 public constant decimals = 18;
    
    uint public constant __totalSupply = 1000;          // Disallowed in later versions of Solidity
    mapping (address => uint) private __balanceOf;
    mapping (address => mapping (address => uint)) private __allowances;
    
    function totalSupply() constant returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
    }
    
    function balanceOf(address addr) constant returns(uint _balance) {
        return __balanceOf[addr];
    }
    
    function transfer(address _to, uint _value) returns(bool success) {
        if(_value > 0 && _value <= balanceOf(msg.sender)) {
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value; 
            return true;
        }
        return false;
    }
    
    function transferFrom(address _from, address _to, uint _value) returns (bool success) {
        if (__allowances[_from][msg.sender] > 0 &&
            _value > 0 &&
            __allowances[_from][msg.sender] >= _value && 
            __balanceOf[_from] >= _value) {
            __balanceOf[_from] -= _value;
            __balanceOf[_to] += _value;
            __allowances[_from][msg.sender] -= _value;
            return true;
        }
        return false;
    }
    
    function approve(address _spender, uint _value) returns (bool success) {
        __allowances[msg.sender][_spender] = _value;
        return true;
    }
    
    function allowance(address _owner, address _spender) constant returns (uint remaining) {
        return __allowances[_owner][_spender];
    }
    
}