// SPDX-License-Identifier: MIT
// 这一行是开源许可证声明，告诉别人代码是开源的

pragma solidity ^0.8.19;
// 指定编译器版本，必须是 0.8.19 或更高，防止版本冲突

// 引入 OpenZeppelin 的 NFT 标准库（不用自己造轮子，安全！）
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// 引入权限控制库（为了用 onlyOwner 功能）
import "@openzeppelin/contracts/access/Ownable.sol";

// 定义合约：AutoChain，它继承了 ERC721 (NFT属性) 和 Ownable (管理员属性)
contract AutoChain is ERC721, Ownable {

    // 【核心逻辑：状态机】
    // 定义汽车仅有的 3 个生命周期状态，不能乱填
    // 0: Manufactured (已制造), 1: Shipped (已发货), 2: Delivered (已交付)
    enum CarStatus { Manufactured, Shipped, Delivered }

    // 【数据结构：汽车身份证】
    struct Car {
        CarStatus status; // 只记录当前状态
    }

    // 【数据库】
    // 建立一个映射表：输入 ID (数字) -> 输出 汽车信息 (结构体)
    mapping(uint256 => Car) public cars;

    // 构造函数：合约部署时运行一次
    // 给 NFT 起名为 "AutoChainSimple"，代号 "ACS"
    // Ownable(msg.sender) 意思是：谁部署的合约，谁就是管理员(Owner)
    constructor() ERC721("AutoChainSimple", "ACS") Ownable(msg.sender) {}

    // --- 功能 1：制造汽车 (对应 PPT 里的 Factory) ---
    // onlyOwner 限制：只有厂家(管理员)能点这个按钮
    function createCar(uint256 tokenId) public onlyOwner {
        // 1. 在数据库里登记：设置初始状态为 "已制造"
        cars[tokenId].status = CarStatus.Manufactured;
        
        // 2. 发放证书：在区块链上正式铸造一个 NFT 给管理员
        _mint(msg.sender, tokenId);
    }

    // --- 功能 2：发货 (对应 PPT 里的 Logistics) ---
    // 这个功能模拟物流公司把车运走
    function setShipped(uint256 tokenId) public {
        // 检查：确保这辆车是真实存在的，防止瞎填 ID
        require(_ownerOf(tokenId) != address(0), "Car not found");
        
        // 更新状态：变成 "已发货"
        cars[tokenId].status = CarStatus.Shipped;
    }

    // --- 功能 3：交付 (对应 PPT 里的 Dealer) ---
    // 这个功能模拟 4S 店收到了车
    function setDelivered(uint256 tokenId) public {
        // 检查：同样要确保车存在
        require(_ownerOf(tokenId) != address(0), "Car not found");
        
        // 更新状态：变成 "已交付" (流程结束)
        cars[tokenId].status = CarStatus.Delivered;
    }
}
