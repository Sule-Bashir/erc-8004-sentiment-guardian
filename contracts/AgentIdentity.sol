// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AgentIdentity is ERC721, Ownable {
    struct AgentMetadata {
        string name;
        string endpoint;
        address agentWallet;
        uint256 createdAt;
    }
    
    mapping(uint256 => AgentMetadata) public agents;
    uint256 public nextTokenId;
    
    constructor() ERC721("TradingAgent", "AGENT") {}
    
    function registerAgent(
        string memory name,
        string memory endpoint,
        address agentWallet
    ) external returns (uint256) {
        uint256 tokenId = nextTokenId++;
        _safeMint(msg.sender, tokenId);
        
        agents[tokenId] = AgentMetadata({
            name: name,
            endpoint: endpoint,
            agentWallet: agentWallet,
            createdAt: block.timestamp
        });
        
        return tokenId;
    }
    
    function getAgent(uint256 tokenId) external view returns (AgentMetadata memory) {
        return agents[tokenId];
    }
}
