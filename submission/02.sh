# How many new outputs were created by block 243,825?
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockstats 243825 | jq '.outs'
