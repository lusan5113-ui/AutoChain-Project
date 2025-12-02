// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// 1. Imports: Using OpenZeppelin standards for security (avoiding bugs)
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// 2. Inheritance: This contract is an NFT (ERC721) and has Admin controls (Ownable)
contract AutoChain is ERC721, Ownable {

    // 3. State Machine: Defines the fixed lifecycle stages of a vehicle
    // Used to track progress from Factory -> Logistics -> Customs -> Dealer
    enum CarStatus { Manufactured, InTransit, CustomsCleared, Delivered }

    // 4. Data Structure: Acts as the "Digital Passport" for each car
    struct Car {
        uint256 tokenId;        // Unique ID for the NFT
        string vin;             // Vehicle Identification Number (Real-world ID)
        CarStatus status;       // Current stage in the supply chain
        string ipfsHash;        // Link to heavy documents (PDFs/Photos) stored on IPFS
        uint256 timestamp;      // Creation time
    }

    // 5. Storage: A mapping that acts like a database to store all cars
    mapping(uint256 => Car) public cars;

    // 6. Events: These notify the React Frontend when data changes on the blockchain
    event CarCreated(uint256 indexed tokenId, string vin, string ipfsHash);
    event StatusUpdated(uint256 indexed tokenId, CarStatus status);

    // Constructor: Initializes the NFT collection Name and Symbol
    // "AutoChainVehicle" is the full name, "ACV" is the ticker symbol
    constructor() ERC721("AutoChainVehicle", "ACV") Ownable(msg.sender) {}

    // 7. Core Function: Create Car (Minting)
    // 'onlyOwner' implements RBAC (Role-Based Access Control)
    // Only the authorized Manufacturer (Owner) can call this function
    function createCar(uint256 tokenId, string memory vin, string memory ipfsHash) public onlyOwner {
        
        // Save the vehicle data to the blockchain state
        cars[tokenId] = Car(tokenId, vin, CarStatus.Manufactured, ipfsHash, block.timestamp);

        // Mint the NFT token to the manufacturer's wallet
        _mint(msg.sender, tokenId);

        // Emit an event so the Dashboard updates immediately
        emit CarCreated(tokenId, vin, ipfsHash);
    }

    // 8. Core Function: Update Status
    // Used by Logistics or Customs to move the car to the next stage
    function updateStatus(uint256 tokenId, CarStatus newStatus) public {
        // Validation: Ensure the car actually exists before updating
        require(ownerOf(tokenId) != address(0), "Car does not exist");

        // Update the status in storage
        cars[tokenId].status = newStatus;

        // Notify the frontend
        emit StatusUpdated(tokenId, newStatus);
    }
}

