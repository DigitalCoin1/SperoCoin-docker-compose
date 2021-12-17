# SperoCoin-docker-compose - BySperoCoin
## Requisitos
* [Docker]
* [docker-compose]

### Esse repositório possui atualmente 3 versões de compilações, sendo:
**ubuntu-1604-dbd48 -** Versão utilizando a livraria LIBDB na versão 4.8 e sistema operacional UBUNTU 16.04. Essa configuração deve ser utilizada em carteiras que não possuem saldo ou ainda não foi gerado um arquivo wallet.dat.
**ubuntu-1604-dbd53 -** Versão utilizando a livraria LIBDB na versão 5.3 e sistema operacional UBUNTU 16.04. Essa configuração deve ser utilizada em carteiras que estão migrando a versão 2.6.5.4 para a atual.
**ubuntu-1804-dbd48 -** Versão utilizando a livraria LIBDB na versão 4.8 e sistema operacional UBUNTU 18.04. Essa configuração deve ser utilizada em carteiras que não possuem saldo ou ainda não foi gerado um arquivo wallet.dat.

## Instalação
### 1) Adicione a blockchain SPERO extraída dentro da pasta data, ficando a seguinte estrutura:

```sh
./data/blocks
./data/chainstate
```
*Observação: Se você possuir um arquivo wallet.dat, adicione-o também dentro desta pasta, ficando:

```sh
./data/blocks
./data/chainstate
./data/wallet.dat
```

### 2) Edite o arquivo sperocoin.conf alterando o nome de usuário e senha RPC, além das portas de comunicação e IP's aceitáveis para a conexão externa.

```sh
rpcuser=user #usuário RPC
rpcpassword=password #senha RPC
rpcport=55681 #Porta RPC
port=55680 #Porta de Comunicação para Nós
rpcallowip=0.0.0.0 #Ips permitidos para chamadas e conexões RPC
staking=0 #(0 = desabilitado, 1 = habilitado)
```

### 3) Execute o comando para a criação da rede, imagem e container:

```sh
docker network create custom
docker-compose up -d
```

### 4) Para parar o container, envie os comandos:

```sh
docker-compose exec sperocoin_ubuntu_1804_libdb48 SperoCoind -datadir=/coin/data -conf=/coin/data/sperocoin.conf stop
docker-compose stop
```

[Docker]: <https://docs.docker.com/get-docker>
[docker-compose]: <https://docs.docker.com/compose/install>
