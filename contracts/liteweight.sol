pragma solidity ^0.5.0;

contract liteweight {
//    using SafeMath for uint256;
    mapping(uint256 => bool) IDtaken;
    
    mapping(address => mapping(uint256 => uint256)) public tokensHeld;
    mapping(uint256 => string) public ID2URL;
    mapping(uint256 => address) public ID2Owner;
    
    mapping(uint256 => uint256) public numUnheldShares;
    mapping(uint256 => uint256) public sharesBought;
    
    mapping(uint256 => uint256) public fundEndBlock;
    mapping(uint256 => uint256) public fundPayoutBlock;
    mapping(uint256 => bool) public projectFinished;
    mapping(uint256 => bool) public ownerRecievedFunds;
    
    mapping(uint256 => uint256) public ID2RevenuePerShare;
    mapping(uint256 => uint256) public sharePrice;
    
    function createCrowdFund(uint256 _IDnum, uint256 _sharePrice, uint256 _numShares, string memory _URL, uint256 _endBlock, uint256 _payoutBlock) public returns(bool){
        require(IDtaken[_IDnum] == false);
    
        numUnheldShares[_IDnum] = _numShares;
        fundEndBlock[_IDnum] = _endBlock;
        fundPayoutBlock[_IDnum] = _payoutBlock;
        ID2URL[_IDnum] = _URL;
        IDtaken[_IDnum] = true;
        ID2Owner[_IDnum] = msg.sender;
        sharePrice[_IDnum] = _sharePrice;
        
        return true;
    }
    
    //buy shares
    function buyShares(uint256 _IDnum, uint _sharesDesired) public returns(bool){
        require(_sharesDesired <= numUnheldShares[_IDnum]);
        require(fundEndBlock[_IDnum] < block.number);
        
//emit message for a buy
        numUnheldShares[_IDnum] = numUnheldShares[_IDnum] - _sharesDesired;
        tokensHeld[msg.sender][_IDnum] = _sharesDesired + tokensHeld[msg.sender][_IDnum];
        sharesBought[_IDnum] += _sharesDesired;
        
        return true;
    }

    //retreive all assets owned - can be done on client side via public mappings 
    
    //get payout 
    function getPayout(uint _IDnum) public returns(bool){

        //require that project has been completed
        require(projectFinished[_IDnum] == true);
        
//emit message that this person deservers some payment       
        tokensHeld[msg.sender][_IDnum] = 0;
        msg.sender.transfer(ID2RevenuePerShare[_IDnum]*tokensHeld[msg.sender][_IDnum]);
        
        
        return(true);
        
    }
    
    //payout fund owner
    function recieveFunds(uint _IDnum) public returns(bool){
     
        //require that share purchase period is over   
        //require that owner hasn't already gotten thier moneys
        //require that person calling this is the owner of the asset
        require(fundEndBlock[_IDnum] < block.number);
        require(ownerRecievedFunds[_IDnum] == false);
        require(ID2Owner[_IDnum] == msg.sender);
        
//emit message that this person got thier payment
        ownerRecievedFunds[_IDnum] = true;
        msg.sender.transfer(sharePrice[_IDnum]*sharesBought[_IDnum]);
        
    }


    //getStatus
    //currently makes up dummy data but SHOULD call an oracle
    function getStatus(uint _IDnum) public view returns(uint8)
    {

          return uint8(uint256(blockhash(block.number)) & uint256(0x01));
    }
    
    //publish update
    
    //transfer shares?
    
    
}