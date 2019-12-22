pragma solidity ^0.5.0;

contract Address{


address payable private ContractAddress;
uint256 public RequiredAmount;
uint public Registered = 0;
uint public collectedAmount = 0;

constructor() public{
ContractAddress = msg.sender;
RequiredAmount = 2000000000000000000;
}


struct students{
    uint rollno;
    string name;
    bool isDegree;
    Status status;
    Gender gender;
    address Student;
    
}

enum Status{ online, onsite}
enum Gender{ male, female }

modifier BSCheck(bool isDegree){
    require(isDegree == true);
    _;
}

modifier minAmount(){
require(msg.value == RequiredAmount);
_;
}

mapping(uint => students) public searchstudent;

function enrollment (uint rollno, string memory name, bool BS_degree, Status status, Gender gender) public BSCheck(BS_degree){
    searchstudent[rollno] = students(rollno, name, BS_degree, status, gender, msg.sender);
    
}

function pay() public payable minAmount(){
    ContractAddress.transfer(msg.value);
    collectedAmount = collectedAmount + msg.value;
    Registered = Registered + 1;
}


}
