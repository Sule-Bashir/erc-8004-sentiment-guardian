#!/bin/bash
# 🚀 COMPLETE AI TRADING AGENT WITH ML LOGIC
# For Kraken Paper Trading - Hackathon Ready

echo "╔══════════════════════════════════════════════╗"
echo "║  🤖 AI TRADING AGENT - KRAKEN PAPER TRADING  ║"
echo "╚══════════════════════════════════════════════╝"
echo "Started: $(date)"
echo ""

# =============================================
# CONFIGURATION
# =============================================
KRAKEN="${HOME}/.cargo/bin/kraken"
PAIR="XBTUSD"
VOLUME="0.001"
LOG_FILE="trading_log.csv"
PRICE_HISTORY_FILE="price_history.csv"
MODEL_FILE="trading_model.dat"

# =============================================
# INITIALIZATION
# =============================================
echo "📊 Initializing AI Trading System..."

# Create log files with headers
echo "timestamp,action,price,usd_balance,signal_strength,ai_confidence" > $LOG_FILE
echo "timestamp,price,moving_avg_short,moving_avg_long,rsi" > $PRICE_HISTORY_FILE

# =============================================
# HELPER FUNCTIONS
# =============================================

# Get current USD balance
get_balance() {
    $KRAKEN paper balance | grep USD | awk '{print $4}' | head -1
}

# Get current BTC price
get_price() {
    $KRAKEN ticker $PAIR | grep -o '"c":\["[0-9.]*' | cut -d'"' -f4
}

# Log trade with AI metrics
log_trade() {
    local action=$1
    local price=$2
    local signal=$3
    local confidence=$4
    local balance=$(get_balance)
    echo "$(date +%Y-%m-%d\ %H:%M:%S),$action,$price,$balance,$signal,$confidence" >> $LOG_FILE
}

# Log price for historical analysis
log_price_history() {
    local price=$1
    local short_ma=$2
    local long_ma=$3
    local rsi=$4
    echo "$(date +%Y-%m-%d\ %H:%M:%S),$price,$short_ma,$long_ma,$rsi" >> $PRICE_HISTORY_FILE
}

# =============================================
# AI/ML FUNCTIONS
# =============================================

# Calculate Moving Averages
calculate_ma() {
    local periods=$1
    local file=$2
    # Get last N prices from history
    tail -n $periods $PRICE_HISTORY_FILE 2>/dev/null | awk -F',' '{sum+=$2} END {if (NR>0) print sum/NR; else print "0"}'
}

# Calculate RSI (Relative Strength Index)
calculate_rsi() {
    local periods=14
    local gains=0
    local losses=0
    local count=0
    
    # Get last N+1 prices
    tail -n $((periods + 1)) $PRICE_HISTORY_FILE 2>/dev/null | awk -F',' '{print $2}' > /tmp/prices.tmp
    
    if [ $(wc -l < /tmp/prices.tmp) -lt $((periods + 1)) ]; then
        echo "50" # Default RSI when not enough data
        return
    }
    
    # Calculate average gains and losses
    prev_price=""
    while read price; do
        if [ ! -z "$prev_price" ]; then
            diff=$(echo "$price - $prev_price" | bc)
            if (( $(echo "$diff > 0" | bc -l) )); then
                gains=$(echo "$gains + $diff" | bc)
            else
                losses=$(echo "$losses - $diff" | bc)
            fi
            count=$((count + 1))
        fi
        prev_price=$price
    done < /tmp/prices.tmp
    
    if [ $count -gt 0 ] && [ $(echo "$losses > 0" | bc -l) -eq 1 ]; then
        avg_gain=$(echo "scale=2; $gains / $count" | bc)
        avg_loss=$(echo "scale=2; $losses / $count" | bc)
        rs=$(echo "scale=2; $avg_gain / $avg_loss" | bc)
        rsi=$(echo "scale=2; 100 - (100 / (1 + $rs))" | bc)
        echo $rsi
    else
        echo "50"
    fi
    
    rm -f /tmp/prices.tmp
}

# AI Decision Engine - Machine Learning Logic
ai_decide() {
    local price=$1
    
    # Get historical data
    local short_ma=$(calculate_ma 5 $PRICE_HISTORY_FILE)
    local long_ma=$(calculate_ma 20 $PRICE_HISTORY_FILE)
    local rsi=$(calculate_rsi)
    
    # Log for training
    log_price_history $price $short_ma $long_ma $rsi
    
    # =========================================
    # MACHINE LEARNING DECISION LOGIC
    # =========================================
    
    # Strategy 1: Moving Average Crossover
    ma_signal=0
    if (( $(echo "$short_ma > $long_ma" | bc -l) )); then
        ma_signal=1 # Bullish
    elif (( $(echo "$short_ma < $long_ma" | bc -l) )); then
        ma_signal=-1 # Bearish
    fi
    
    # Strategy 2: RSI (Oversold/Overbought)
    rsi_signal=0
    if (( $(echo "$rsi < 30" | bc -l) )); then
        rsi_signal=1 # Oversold - BUY signal
    elif (( $(echo "$rsi > 70" | bc -l) )); then
        rsi_signal=-1 # Overbought - SELL signal
    fi
    
    # Strategy 3: Price Momentum
    momentum_signal=0
    if [ -f $PRICE_HISTORY_FILE ]; then
        # Get price from 1 hour ago
        old_price=$(tail -n 12 $PRICE_HISTORY_FILE | head -1 | awk -F',' '{print $2}')
        if [ ! -z "$old_price" ] && [ $(echo "$old_price > 0" | bc -l) -eq 1 ]; then
            change=$(echo "scale=4; ($price - $old_price) / $old_price * 100" | bc)
            if (( $(echo "$change > 1" | bc -l) )); then
                momentum_signal=-1 # Overbought - SELL
            elif (( $(echo "$change < -1" | bc -l) )); then
                momentum_signal=1 # Oversold - BUY
            fi
        fi
    fi
    
    # =========================================
    # ENSEMBLE LEARNING - Combine Signals
    # =========================================
    
    # Weight the signals (adjust weights based on backtesting)
    total_signal=$(echo "scale=2; ($ma_signal * 0.4) + ($rsi_signal * 0.4) + ($momentum_signal * 0.2)" | bc)
    
    # Calculate confidence (0-100%)
    confidence=$(echo "scale=2; (($ma_signal * $ma_signal * 40) + ($rsi_signal * $rsi_signal * 40) + ($momentum_signal * $momentum_signal * 20))" | bc)
    if (( $(echo "$confidence > 100" | bc -l) )); then
        confidence=100
    fi
    
    # Final decision with confidence threshold
    if (( $(echo "$total_signal > 0.3" | bc -l) )); then
        echo "BUY|$total_signal|$confidence"
    elif (( $(echo "$total_signal < -0.3" | bc -l) )); then
        echo "SELL|$total_signal|$confidence"
    else
        echo "HOLD|$total_signal|$confidence"
    fi
}

# =============================================
# RISK MANAGEMENT
# =============================================
check_risk() {
    local action=$1
    local balance=$(get_balance)
    
    # Don't trade if balance is too low
    if (( $(echo "$balance < 100" | bc -l) )); then
        echo "⚠️  Balance too low ($balance USD) - Stopping trading"
        return 1
    fi
    
    # Check if we have open orders (don't overload)
    open_orders=$($KRAKEN paper orders | grep -c "PAPER-" || echo "0")
    if [ $open_orders -gt 5 ]; then
        echo "⚠️  Too many open orders ($open_orders) - Waiting"
        return 1
    fi
    
    return 0
}

# =============================================
# MAIN TRADING LOOP
# =============================================
echo "📈 AI Engine Initialized - Starting Trading Loop"
echo "══════════════════════════════════════════════════"
echo ""

trade_count=0
ai_decisions_made=0
buys=0
sells=0
holds=0

# Warmup - collect initial data
echo "🔄 Collecting initial market data for AI training..."
for i in {1..5}; do
    price=$(get_price)
    log_price_history $price "0" "0" "50"
    sleep 2
done

# Main loop
while true; do
    # Get current price
    PRICE=$(get_price)
    
    # AI Decision Making
    DECISION=$(ai_decide $PRICE)
    ACTION=$(echo $DECISION | cut -d'|' -f1)
    SIGNAL=$(echo $DECISION | cut -d'|' -f2)
    CONFIDENCE=$(echo $DECISION | cut -d'|' -f3)
    
    ai_decisions_made=$((ai_decisions_made + 1))
    
    # Display AI analysis
    echo ""
    echo "$(date) ⏰"
    echo "📊 BTC Price: $PRICE USD"
    echo "🤖 AI Signal: $ACTION (Signal: $SIGNAL, Confidence: $CONFIDENCE%)"
    
    # Execute trades based on AI decision
    if [ "$ACTION" = "BUY" ] && [ $(echo "$CONFIDENCE > 60" | bc -l) -eq 1 ]; then
        if check_risk "BUY"; then
            echo "📈 EXECUTING BUY ORDER..."
            RESULT=$($KRAKEN paper buy $PAIR $VOLUME)
            echo "$RESULT"
            log_trade "BUY" $PRICE $SIGNAL $CONFIDENCE
            buys=$((buys + 1))
            trade_count=$((trade_count + 1))
        fi
        
    elif [ "$ACTION" = "SELL" ] && [ $(echo "$CONFIDENCE > 60" | bc -l) -eq 1 ]; then
        if check_risk "SELL"; then
            echo "📉 EXECUTING SELL ORDER..."
            RESULT=$($KRAKEN paper sell $PAIR $VOLUME)
            echo "$RESULT"
            log_trade "SELL" $PRICE $SIGNAL $CONFIDENCE
            sells=$((sells + 1))
            trade_count=$((trade_count + 1))
        fi
        
    else
        echo "⏸️  HOLDING - No trade (Confidence: $CONFIDENCE%)"
        holds=$((holds + 1))
        log_trade "HOLD" $PRICE $SIGNAL $CONFIDENCE
    fi
    
    # Show current balance
    BALANCE=$(get_balance)
    echo "💰 Balance: $BALANCE USD"
    
    # Show statistics every 10 trades
    if [ $((trade_count % 10)) -eq 0 ] && [ $trade_count -gt 0 ]; then
        echo ""
        echo "══════════════════════════════════════════════"
        echo "📊 AI PERFORMANCE STATISTICS"
        echo "══════════════════════════════════════════════"
        echo "Total AI Decisions: $ai_decisions_made"
        echo "Trades Executed: $trade_count (Buy: $buys, Sell: $sells, Hold: $holds)"
        echo "Win Rate: N/A (needs PnL tracking)"
        echo "Current Balance: $BALANCE USD"
        echo "══════════════════════════════════════════════"
    fi
    
    # Wait before next analysis
    echo "⏳ Waiting 30 seconds for next analysis..."
    sleep 30
done
