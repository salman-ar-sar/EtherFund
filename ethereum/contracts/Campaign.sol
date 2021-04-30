pragma solidity ^0.4.17;

contract CampaignFactory {
    address[] deployed;
    
    function createCampaign(uint _min) public {
        address newCampaign = new Campaign(_min, msg.sender);
        deployed.push(newCampaign);
    }
    
    function getDeployedCampaigns() public view returns (address[]) {
        return deployed;
    }
}

contract Campaign {
    struct Request {
        string desc;
        uint value;
        address recipient;
        bool completed;
        mapping(address => bool) approvals;
        uint approvalCount;
    }
    
    address public manager;
    uint public minCon;
    mapping(address => bool) public approvers;
    Request[] public requests;
    uint public approversCount;
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function Campaign(uint _min, address _creator) public  {
        manager = _creator;
        minCon = _min;
    }
    
    function contribute() public payable {
        require(msg.value > minCon);
        
        approvers[msg.sender] = true;
        approversCount++;
    }
    
    function createRequest(string _desc, uint _value, address _rec) public restricted {
        Request memory newRequest = Request({
            desc: _desc,
            value: _value,
            recipient: _rec,
            completed: false,
            approvalCount: 0 
        });
        
        requests.push(newRequest);
    }
    
    function approveRequest(uint _index) public {
        require(approvers[msg.sender]);
        
        Request storage request = requests[_index];
        require(!request.approvals[msg.sender]);
        
        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }
    
    function finalizeRequest(uint _index) public restricted {
        Request storage request = requests[_index];
        require(request.approvalCount > (approversCount / 2));
        require(!request.completed);
        
        request.recipient.transfer(request.value);
        request.completed = true;
    }
}