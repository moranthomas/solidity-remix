pragma solidity ^0.4.0;

library Strings {

    function concat(string _base, string _value) internal returns (string) {
        
        // Convert the 2 parameter values passed in into bytes
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        string memory _tempValue = new string(_baseBytes.length + _valueBytes.length);
        // Convert this to a byte value 
        bytes memory _newValue = bytes(_tempValue);
        
        uint i;
        uint j;
        
        for(i =0; i < _baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }
        
        for(i =0; i < _valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i]; 
        }
    }
    
    function stringPos(string _base, string _value) internal returns (int) {
        
        // Convert the 2 parameter values passed in into bytes
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        assert(_valueBytes.length ==1 );
        
        for(uint i=0; i<_valueBytes.length; i++) {
            if(_baseBytes[i] == _valueBytes[0]) {
            return int(i);
            }
        }
        
        return -1;
        
    }
}