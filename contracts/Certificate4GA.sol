pragma solidity ^0.4.24;


contract CertificateGenerator {
    string dean_first_name;
    string dean_last_name;

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

    function setDean(address new_dean, string first_name, string last_name) onlyCreator public{
        dean = new_dean;
        dean_first_name = first_name;
        dean_last_name = last_name;
    }

    function createCertificate(string first_name, string last_name) onlyDean public{
        // TODO: check parameters validity
        // TODO: check if the user does not have a certificate already
        Certificate memory certificate = Certificate();
        certificate.first_name = first_name;
        certificate.last_name = last_name;
        registry[msg.sender] = certificate;
        emit CREATED(dean, msg.sender, certificate);
    }
}