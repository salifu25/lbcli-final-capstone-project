# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
for tx in $(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash 243821)" | jq -r '.tx[]'); do
  bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction "$tx" true \
    | jq -e 'any(.vin[]; (has("coinbase") | not) and .sequence < 4294967294)' >/dev/null 2>&1 && echo "$tx"
done
