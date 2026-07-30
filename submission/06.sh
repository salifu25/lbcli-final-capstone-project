# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
for tx in $(bitcoin-cli -signet getblock "$(bitcoin-cli -signet getblockhash 243821)" | jq -r '.tx[]'); do
  bitcoin-cli -signet getrawtransaction "$tx" true \
    | jq -e 'any(.vin[]; (has("coinbase") | not) and .sequence < 4294967294)' >/dev/null 2>&1 && echo "$tx"
done
