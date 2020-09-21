FROM ubuntu:18.04

COPY /genesis.json /home

COPY /mineWhenNeeded.js /home

COPY /geth /usr/bin

RUN apt update

RUN apt  install golang-go -y

RUN export GOPATH=$HOME/Projects/Proj1

RUN export GOROOT=/usr/local/go

RUN export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


RUN geth --nousb --datadir /home/chaindata init /home/genesis.json

CMD geth --datadir "/home/chaindata" --nousb --networkid 2020 --identity "Node_1" --rpc --rpcaddr "0.0.0.0" --rpcport "8545" --rpccorsdomain "*" --port "30303" --ws --wsaddr "0.0.0.0" --wsport "4585" --nodiscover --gasprice 0 --gpoblocks 9999 --gpopercentile 0 --vmdebug --targetgaslimit '999999999999999' --allow-insecure-unlock console

EXPOSE 8545 

EXPOSE 30303 