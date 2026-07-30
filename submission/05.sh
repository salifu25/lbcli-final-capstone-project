# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb 2 \
  | jq -r '.fee * 100000000 | round'
