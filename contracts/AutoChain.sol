// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AutoChain is ERC721, Ownable {
    
    // 定义汽车的状态
    enum CarStatus { Manufactured, InTransit, CustomsCleared, Delivered }

    // 汽车的数据结构
    struct Car {
        uint256 tokenId;
        string vin;             // 车架号
        CarStatus status;       // 当前状态
        string ipfsHash;        // 存放在 IPFS 上的文档哈希
        uint256 timestamp;      // 时间戳
    }

    // 存储所有汽车数据
    mapping(uint256 => Car) public cars;
    
    // 事件：用来通知前端状态变了
    event CarCreated(uint256 indexed tokenId, string vin, string ipfsHash);
    event StatusUpdated(uint256 indexed tokenId, CarStatus status);

    constructor() ERC721("AutoChainVehicle", "ACV") {}

    // 1. 制造汽车 (只有厂家能调用 - 待完善权限)
    function createCar(uint256 tokenId, string memory vin, string memory ipfsHash) public onlyOwner {
        cars[tokenId] = Car(tokenId, vin, CarStatus.Manufactured, ipfsHash, block.timestamp);
        _mint(msg.sender, tokenId);
        emit CarCreated(tokenId, vin, ipfsHash);
    }

    // 2. 更新状态 (海关/物流调用)
    function updateStatus(uint256 tokenId, CarStatus newStatus) public {
        require(_exists(tokenId), "Car does not exist");
        cars[tokenId].status = newStatus;
        emit StatusUpdated(tokenId, newStatus);
    }
}
