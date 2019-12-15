pragma solidity ^0.5.14;

contract registerStd{

    enum status{onsite, online}
    
    struct students{
        uint rollno;
        string name;
        status reg;
    }
    
    modifier stdStatus(status reg){
        require(reg == status.online);
        _;
    }
    
    mapping(uint => students) public mapStudents;
    
    event registerStatus(uint, string, status);
    
    function register(uint _rollno, string memory _name, status _reg) public stdStatus(_reg){
        mapStudents[_rollno] = students(_rollno, _name, _reg);
        emit registerStatus(_rollno, _name, _reg); 
    } 
    
}