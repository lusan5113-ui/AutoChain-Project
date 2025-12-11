// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AutoChain is ERC721, Ownable {
    // 1. 定义仅有的三个状态 
    enum CarStatus { Manufactured, Shipped, Delivered }

    struct Car {
        CarStatus status; // 只存状态，其他都不存
    }

    mapping(uint256 => Car) public cars;

    constructor() ERC721("AutoChainSimple", "ACS") Ownable(msg.sender) {}

    // 2. 功能一：制造 
    function createCar(uint256 tokenId) public onlyOwner {
        cars[tokenId].status = CarStatus.Manufactured;
        _mint(msg.sender, tokenId);
    }

    // 3. 功能二：发货 
    function setShipped(uint256 tokenId) public {
        require(_exists(tokenId), "Car not found");
        cars[tokenId].status = CarStatus.Shipped;
    }

    // 4. 功能三：交付 
    function setDelivered(uint256 tokenId) public {
        require(_exists(tokenId), "Car not found");
        cars[tokenId].status = CarStatus.Delivered;
    }
}
