# SperoCoin-docker-compose - BySperoCoin
## Requisitos
* [Docker]
* [docker-compose]

## Instalação
### 1) Adicione a blockchain SPERO extraída dentro da pasta data, ficando a seguinte estrutura:

```sh
./data/txleveldb
./data/blk0001.dat
```
*Observação: Se você possuir um arquivo wallet.dat, adicione-o também dentro desta pasta, ficando:

```sh
./data/txleveldb
./data/blk0001.dat
./data/wallet.dat
```

### 2) Edite o arquivo sperocoin.conf alterando o nome de usuário e senha RPC, além das portas de comunicação e IP's aceitáveis para a conexão externa.

```sh
rpcuser=user #usuário RPC
rpcpassword=password #senha RPC
rpcport=55681 #Porta RPC
port=55680 #Porta de Comunicação para Nós
rpcallowip=* #Ips permitidos para chamadas e conexões RPC
staking=0 #(0 = desabilitado, 1 = habilitado)
```

### 3) Execute o comando para a criação da rede, imagem e container:

```sh
docker network create custom
docker-compose up -d
```

### 4) Para parar o container, envie os comandos:

```sh
docker-compose exec sperocoin_ubuntu_1804 SperoCoind -datadir=/coin/data -conf=/coin/sperocoin.conf stop
docker-compose stop
```

[Docker]: <https://docs.docker.com/get-docker>
[docker-compose]: <https://docs.docker.com/compose/install>
