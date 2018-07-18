pragma solidity ^0.4.24;


contract CertificateGenerator {
    struct Certificate { // Struct
        string first_name;
        string last_name;
    }

    modifier onlyCreator() { // Modifier
        require(msg.sender == creator, "Only my creator can change the Dean");
        _;
    }

    modifier onlyDean() { // Modifier
        require(msg.sender == dean, "Only the Dean can create certificates");
        _;
    }

    address creator;
    address dean;
    mapping (address => Certificate) registry;
    event CREATED(address from, address to, Certificate certificate);

    constructor() public{
        creator = msg.sender;
    }

    function setDean(address new_dean) onlyCreator public{
        dean = new_dean;
    }

    function createCertificate()
}