pragma solidity ^0.5.1;
contract Auction {
  address public Eproducer;
  address public writer;
  uint public latestBid;
  address public latestBidder;
 
  constructor() public {
    Eproducer = msg.sender;
  }
 
  function auction(uint bid) public {
    latestBid = bid * 1 ether; //1000000000000000000;
    writer = msg.sender;
  }
 
  function bid() public payable {
    require(msg.value > latestBid);
 
    if (latestBidder = 0x0) {
      latestBidder.transfer(latestBid);
    }
    latestBidder = msg.sender;
    latestBid = msg.value;
  }
 
  function finishAuction() restricted public {
    writer.transfer(address(this).balance);
  }
 
  modifier restricted() {
    require(msg.sender == Eproducer);
    _;
  }
}

