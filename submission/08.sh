# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
BLOCKHASH=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb true | jq -r '.blockhash')
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$BLOCKHASH" | jq '.height'
