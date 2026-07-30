# Which tx in block 216,351 spends the coinbase output of block 216,128?
COINBASE=$(bitcoin-cli -signet getblock "$(bitcoin-cli -signet getblockhash 216128)" | jq -r '.tx[0]')
for tx in $(bitcoin-cli -signet getblock "$(bitcoin-cli -signet getblockhash 216351)" | jq -r '.tx[]'); do
  bitcoin-cli -signet getrawtransaction "$tx" true \
    | jq -e --arg cb "$COINBASE" 'any(.vin[]; .txid == $cb)' >/dev/null 2>&1 && echo "$tx"
done
