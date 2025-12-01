# AutoChain: Secure Automobile Lifecycle Management System

![License](https://img.shields.io/badge/license-MIT-blue.svg) ![Solidity](https://img.shields.io/badge/Solidity-0.8.19-363636.svg) ![React](https://img.shields.io/badge/React-18.0-61dafb.svg) ![Cloud](https://img.shields.io/badge/Cloud-AWS%20%7C%20IBM-orange.svg)

**AutoChain** is a hybrid decentralized application (DApp) designed to digitize the global automotive supply chain. By leveraging Ethereum smart contracts and multi-cloud infrastructure, we provide an immutable, transparent ledger for tracking vehicles from manufacturing to dealership delivery.

---

## 🚗 Project Overview

### The Problem
* **Information Silos:** Manufacturers, logistics providers, and dealers operate on disconnected systems, leading to data opacity.
* **Regulatory Inefficiency:** Customs and border agencies rely on manual paperwork, causing delays in cross-border logistics.
* **Lack of Trust:** Consumers cannot easily verify the authenticity of parts or the history of a vehicle.

### The Solution
AutoChain implements a **State Machine** on the blockchain to record key milestones:
1.  **Minting:** Manufacturer registers a new vehicle (NFT).
2.  **Logistics:** Real-time status updates during transit.
3.  **Compliance:** Customs agencies approve "Border Crossing" on-chain.
4.  **Delivery:** Ownership is transferred to the dealer and finally the consumer.

---

## 🏗 System Architecture

This project is designed as a **Hybrid Web 2.0 & Web 3.0 Solution**, meeting the requirement for multi-cloud deployment.

| Layer | Technology | Description |
| :--- | :--- | :--- |
| **Blockchain** | **Ethereum Sepolia** | The primary public ledger for transparency. |
| **Cloud A** | **AWS EC2** | Hosts the DApp frontend and a backup EVM-compatible node. |
| **Cloud B** | **IBM Cloud** | Hosts a secondary validator node for enterprise redundancy. |
| **Smart Contract** | **Solidity** | ERC-721 Standard for unique vehicle identification. |
| **Frontend** | **React.js + Ethers.js** | User dashboard for Manufacturers, Customs, and Dealers. |
| **Storage** | **IPFS (Pinata)** | Decentralized storage for heavy documents (PDFs, Images). |

---

## 🌟 Key Features (MVP)

* **Role-Based Access Control (RBAC):** Only authorized Manufacturers can mint cars; only Customs can verify them.
* **Visual Dashboard:** A React-based web interface for easy interaction with the blockchain.
* **End-to-End Traceability:** A complete history log from factory to showroom.
* **Multi-Cloud Redundancy:** System remains operational across AWS and IBM environments.

---

## 📅 Development Roadmap

We are following a 5-week agile development plan:

* **Week 13 (Current):** Project Initialization, Repo Setup, Cloud Environment Configuration (AWS/IBM).
* **Week 14:** Smart Contract Development (`Vehicle.sol`, `AccessControl.sol`) & Unit Testing.
* **Week 15:** Frontend Development (React Setup, Wallet Connection).
* **Week 16:** **Multi-Chain Deployment** (Deploying to Sepolia, AWS, and IBM).
* **Week 17:** Final Testing, Documentation, and Demo Video.

---

## 🚀 Getting Started

*(Instructions for running the project locally)*

### Prerequisites
* Node.js & npm
* Hardhat
* MetaMask Wallet

### Installation

1.  **Clone the repository**
    ```bash
    git clone [https://github.com/lusan5113-u/AutoChain-Project.git](https://github.com/lusan5113-u/AutoChain-Project.git)
    cd AutoChain-Project
    ```

2.  **Install dependencies**
    ```bash
    npm install
    ```

3.  **Compile Smart Contracts**
    ```bash
    npx hardhat compile
    ```

4.  **Run Local Test Node**
    ```bash
    npx hardhat node
    ```

5.  **Start Frontend**
    ```bash
    cd frontend
    npm start
    ```

---

## 👥 Team Members

* **[Sian Lu]:** Smart Contract Lead / Blockchain Architecture
* **[Xinzhi Zhang]:** Frontend Developer / UI/UX
* **[Zirun He]:** Cloud DevOps (AWS/IBM) / Documentation

---

## 📄 License
This project is licensed under the MIT License.
