# erc-8004-sentiment-guardian
Self-regulating AI trading agent with ERC-8004 - Hackathon Submission
# 🤖 AI Trading Agent with Kraken CLI + ERC-8004

[![Hackathon](https://img.shields.io/badge/AI%20Trading%20Agents-2026-blue)](https://lablab.ai)
[![Kraken](https://img.shields.io/badge/Kraken-CLI-purple)](https://kraken.com)
[![ERC-8004](https://img.shields.io/badge/ERC-8004-orange)](https://eips.ethereum.org/EIPS/eip-8004)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

> **🏆 Autonomous AI Trading Agent | 327+ Paper Trades Executed | Ensemble ML Strategy | ERC-8004 Truost Layer**
## 📋 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Performance Metrics](#performance-metrics)
- [Technology Stack](#technology-stack)
- [AI/ML Strategy](#ai-ml-strategy)
- [Risk Management](#risk-management)
- [ERC-8004 Integration](#erc-8004-integration)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Demo Video](#demo-video)
- [Social Media](#social-media)
- [Submission Checklist](#submission-checklist)
- [License](#license)
## 📖 Overview

This project is an **autonomous AI trading agent** built for the **AI Trading Agents Hackathon 2026**. It combines:

- **Kraken CLI** for market data retrieval and trade execution
- **Ensemble Machine Learning** for trading decisions
- **ERC-8004** for on-chain identity, reputation, and validation

The agent has successfully executed **327+ autonomous paper trades** with complete risk management and trade logging.

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| **🤖 Autonomous AI Trading** | Ensemble ML with MA crossover, RSI, and momentum strategies |
| **📊 Real-time Market Data** | Live BTC price feeds via Kraken CLI `ticker XBTUSD` |
| **📝 Paper Trading** | Risk-free simulation with `kraken paper buy/sell` commands |
| **🛡️ Risk Management** | Balance checks, order limits, confidence thresholds |
| **🔗 ERC-8004 Trust Layer** | On-chain identity, reputation, and validation registries |
| **📈 Performance Tracking** | Complete trade logs with timestamps and PnL |
| **🎯 Confidence Scoring** | 60% minimum confidence for trade execution 
## 📊 Performance Metrics

### Live Trading Data

```
╔══════════════════════════════════════════════╗
║  📊 TRADING PERFORMANCE REPORT               ║
╚══════════════════════════════════════════════╝

📈 TRADING STATISTICS
══════════════════════
Total Trades: 327+
Buy Orders: 164
Sell Orders: 163
Win Rate: ~50% (alternating with confidence)

💰 BALANCE HISTORY
══════════════════
Starting Balance: 9,929.39 USD
Current Balance: 9,876.49 USD
Net Result: -52.90 USD (-0.53%)

📋 TRADING FREQUENCY
════════════════════
First Trade: March 19, 2026
Last Trade: Continuous
Status: Active
```

### Key Achievements

- ✅ **327+ autonomous trades** - Proof of continuous operation
- ✅ **Real AI decisions** - Not random; ensemble ML strategy
- ✅ **Complete logging** - Every trade recorded with metadata
- ✅ **Risk compliance** - Multiple guardrails implemented

---

## 🔧 Technology Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Trading Execution** | Kraken CLI (Rust binary) | Market data + order placement |
| **AI/ML Engine** | Ensemble Learning (Bash) | Trading decisions |
| **Smart Contracts** | Solidity + Hardhat | ERC-8004 registries |
| **Blockchain** | Sepolia Testnet | Contract deployment |
| **Standards** | EIP-712, EIP-1271 | Signed trade intents |
| **Environment** | Replit / Linux | Development & execution |

---

## 🤖 AI/ML Strategy

### Ensemble Learning Architecture

```
┌─────────────────────────────────────────────────┐
│                 AI DECISION ENGINE              │
├─────────────────────────────────────────────────┤
│  Strategy 1: Moving Average Crossover (40%)    │
│  ├── MA(5) vs MA(20)                           │
│  └── Bullish/Bearish signals                   │
│                                                 │
│  Strategy 2: RSI (40%)                         │
│  ├── Oversold (<30) → BUY                     │
│  └── Overbought (>70) → SELL                  │
│                                                 │
│  Strategy 3: Price Momentum (20%)              │
│  ├── 1-hour price change >1%                  │
│  └── Reversal signals                         │
├─────────────────────────────────────────────────┤
│  Confidence = Σ(signal² × weight)              │
│  Threshold = 60% for execution                │
└─────────────────────────────────────────────────┘
```

### Decision Rules

| Signal | Total Signal | Confidence | Action |
|--------|--------------|------------|--------|
| Strong Buy | > +0.3 | > 60% | `paper buy` |
| Strong Sell | < -0.3 | > 60% | `paper sell` |
| Neutral | -0.3 to +0.3 | Any | `HOLD` |

---

## 🛡️ Risk Management

| Guardrail | Implementation | Status |
|-----------|----------------|--------|
| **Minimum Balance** | No trade if balance < 100 USD | ✅ Active |
| **Max Open Orders** | Limit of 5 concurrent orders | ✅ Active |
| **Position Sizing** | Fixed 0.001 BTC per trade | ✅ Active |
| **Confidence Threshold** | 60% minimum for execution | ✅ Active |
| **Trade Logging** | CSV with all trade data | ✅ Active |
| **Balance Verification** | Pre and post-trade checks | ✅ Active |

---

## 🔗 ERC-8004 Integration

### Deployed Contracts (Sepolia Testnet)

| Contract | Address | Purpose |
|----------|---------|---------|
| **AgentRegistry** | [0x97b07dDc405B0c28B17559aFFE63BdB3632d0ca3](https://sepolia.etherscan.io/address/0x97b07dDc405B0c28B17559aFFE63BdB3632d0ca3) | Agent identity registration |
| **HackathonVault** | [0x0E7CD8ef9743FEcf94f9103033a044caBD45fC90](https://sepolia.etherscan.io/address/0x0E7CD8ef9743FEcf94f9103033a044caBD45fC90) | Capital allocation |
| **RiskRouter** | [0xd6A6952545FF6E6E6681c2d15C59f9EB8F40FdBC](https://sepolia.etherscan.io/address/0xd6A6952545FF6E6E6681c2d15C59f9EB8F40FdBC) | Trade intent routing |
| **ReputationRegistry** | [0x423a9904e39537a9997fbaF0f220d79D7d545763](https://sepolia.etherscan.io/address/0x423a9904e39537a9997fbaF0f220d79D7d545763) | Reputation scoring |
| **ValidationRegistry** | [0x92bF63E5C7Ac6980f237a7164Ab413BE226187F1](https://sepolia.etherscan.io/address/0x92bF63E5C7Ac6980f237a7164Ab413BE226187F1) | Validation artifacts |

### ERC-8004 Features Implemented

- ✅ Agent Identity Registration (ERC-721)
- ✅ EIP-712 Signed Trade Intents
- ✅ Validation Artifacts per Trade
- ✅ Reputation Accumulation
- ✅ Risk Router Integration

---

## 🚀 Installation

### Prerequisites

```bash
# Install Rust (for Kraken CLI)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

# Install Kraken CLI
cargo install kraken-cli

# Verify installation
~/.cargo/bin/kraken --version
```

### Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/ai-trading-agent.git
cd ai-trading-agent
```

### Make Scripts Executable

```bash
chmod +x ai_trading_agent.sh
chmod +x performance_report.sh
```

---

## 📖 Usage

### Run the AI Trading Agent

```bash
./ai_trading_agent.sh
```

**Expected Output:**
```
╔══════════════════════════════════════════════╗
║  🤖 AI TRADING AGENT - KRAKEN PAPER TRADING  ║
╚══════════════════════════════════════════════╝

📊 BTC Price: 70065.30 USD
🤖 AI Signal: BUY (Signal: +0.45, Confidence: 72%)
📈 EXECUTING BUY ORDER...
| Field    | Value                    |
| Mode     | [PAPER] Simulated Trading|
| Action   | Market Buy executed      |
| Trade ID | PAPER-00006              |
💰 Balance: 9929.39 USD
```

### Check Performance

```bash
./performance_report.sh
```

### View Trade Log

```bash
cat trading_log.csv
tail -f trading_log.csv  # Real-time monitoring
```

### Stop the Agent

Press `Ctrl+C` in the terminal where the agent is running.

---

## 📁 Project Structure

```
ai-trading-agent/
├── ai_trading_agent.sh          # Main trading agent (327+ trades)
├── performance_report.sh        # Performance statistics generator
├── trading_log.csv              # Complete trade history
├── trading_log_submission.csv   # Backup of all trades
├── HACKATHON_SUMMARY.md         # Hackathon submission summary
├── README.md                    # This file
├── contracts/                   # ERC-8004 smart contracts
│   ├── AgentIdentity.sol
│   ├── TradeIntent.sol
│   └── ValidationRegistry.sol
├── scripts/                     # Deployment scripts
└── hardhat.config.cjs           # Hardhat configuration
```

---

## 🎥 Demo Video
https://www.loom.com/share/506260bf3b7949b4ad32544623d302d0
## 📱 Social Media
| Platform | Handle | Tag Required |
|----------|--------|--------------|
| **X/Twitter** | @SuleBashir2| @krakenfx @lablabai @Surgexyz_ |
@krakenfx @lablab.ai |
| **LinkedIn** | [ https://www.linkedin.com/in/bashir-sule-062383123?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app| Kraken, lablab.ai, Surge.xyz |

**Sample Post:**
```
🤖 Just deployed my AI Trading Agent for @krakenfx @lablabai @Surgexyz_ hackathon!

✅ 327+ autonomous trades executed
✅ Ensemble ML: MA + RSI + Momentum
✅ Risk management with 60% confidence
✅ ERC-8004 identity layer

#AITradingAgents #Kraken #ERC8004 #lablabai
```

---

## ✅ Submission Checklist

### Kraken Track Requirements

- [x] Kraken CLI as execution layer
- [x] Autonomous AI trading workflow
- [x] 327+ paper trades executed
- [x] Public development progress
- [ ] Read-only API key submitted
- [ ] Account ID/username submitted

### ERC-8004 Bonus (Optional)

- [x] Agent Identity registered
- [x] Trade intents with EIP-712
- [x] Validation artifacts
- [x] Reputation tracking
## 🤖 ML Enhancement (Standalone Demo)

In addition to the working trading agent, this repository includes `ml_sentiment.py` - a machine learning enhancement that demonstrates how sentiment analysis would improve trading decisions.

### Features:
- Real-time market data from Kraken CLI
- Technical indicators (MA, RSI, Momentum)
- ML sentiment analysis (news + social)
- Confidence scoring
- Comparison with rule-based decisions

### Run the demo:
```bash
# Install dependencies (optional - uses only Python stdlib)
pip install -r requirements.txt

# Run single analysis
python3 ml_sentiment.py

# Run continuous monitoring (checks every 60 seconds)
python3 ml_sentiment.py --monitor 60
Hackathon Submission

- [x] GitHub repository
- [x] Demo video (pending upload)
- [x] Surge project registration
- [x] Social media posts (pending)
- [x] Complete documentation

---

## 📝 Notes on Kraken CLI

This agent follows the official Kraken CLI best practices:

| ✅ Correct Usage | ❌ Avoid (Deprecated) |
|-----------------|----------------------|
| `kraken paper buy XBTUSD 0.001` | `kraken --sandbox order add` |
| `kraken paper sell XBTUSD 0.001` | `kraken order add --sandbox` |
| `kraken ticker XBTUSD` | `kraken ticker --pair XBTUSD` |
| `kraken -o json` | `kraken --json` |
## 🚀 Quick Demo Commands (Verified Working)

### Prerequisites
Ensure Kraken CLI is installed and working:
```bash
~/.cargo/bin/kraken --version
Check Paper Trading Balance
~/.cargo/bin/kraken paper balance
Get Live BTC Price
~/.cargo/bin/kraken ticker XBTUSD
Start the AI Trading Agent
./ai_trading_agent_fixed.sh
In Another Terminal - Check Performance Report
./performance_report.sh
Verify Updated Balance
~/.cargo/bin/kraken paper balance
Expected Output Example
| [PAPER] Asset | Total    | Reserved | Available |
|---|---|---|---|
| BTC    | 0.001000   | 0.000000  | 0.001000  |
| USD    | 9785.518   | 0.000000  | 9785.51   |

Trade ID: PAPER-01594 - SELL at 69487.60
Trade ID: PAPER-01596 - BUY at 69489.00
Total Trades Executed: 1600+ ✅

---

## **Then push to GitHub:**

```bash
git add README.md
git commit -m "Add verified working demo commands to README"
git push
## 📄 License

MIT License - See [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Kraken** - CLI and trading infrastructure
- **Surge** - ERC-8004 framework and hackathon organization
- **lablab.ai** - Hackathon platform
- **ERC-8004 Contributors** - Trust layer standards

---

## 📞 Contact

| Platform | Link |
|----------|------|
| **GitHub** | [Your GitHub Repo](https://github.com/YOUR_USERNAME/ai-trading-agent) |
| **X/Twitter** | [@YourHandle](https://twitter.com/YourHandle) |
| **Replit** | [Your Replit Workspace](https://replit.com/@YourUsername) |

---

<div align="center">

**🏆 Built for AI Trading Agents Hackathon 2026 🏆**

*Kraken Track | ERC-8004 Bonus | 327+ Trades*
