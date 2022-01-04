pragma solidity ^0.4.0;
import "browser/Strings.sol";

contract testStrings {

    using Strings for string;
    
    function testConcat(string _base) returns (string) {
        return _base.concat("_suffix");
    }
    
    function needleInAHaystack(string _base, string _value) returns (int) {
        return _base.stringPos(_value);
    }
}