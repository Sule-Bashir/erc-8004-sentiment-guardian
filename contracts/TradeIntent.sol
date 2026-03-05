// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TradeIntent {
    struct TradeOrder {
        address agent;
        address tokenIn;
        address tokenOut;
        uint256 amountIn;
        uint256 minAmountOut;
        uint256 deadline;
        bytes signature;
    }
    
    event TradeExecuted(
        address indexed agent,
        address indexed tokenIn,
        address indexed tokenOut,
        uint256 amountIn,
        uint256 amountOut,
        uint256 timestamp
    );
    
    function executeTrade(TradeOrder calldata order) external {
        require(block.timestamp <= order.deadline, "Deadline passed");
        require(order.amountIn > 0, "Amount must be positive");
        
        emit TradeExecuted(
            order.agent,
            order.tokenIn,
            order.tokenOut,
            order.amountIn,
            order.minAmountOut,
            block.timestamp
        );
    }
}
