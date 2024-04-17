#IAC_infopublic-AWS

## Código HCL (Terraform) que replica a infraestrutura de uma empresa na AWS

### passo-a-passo:

1. Cria uma VPC
2. Cria um Internet Gateway
    1. Anexa o gateway a VPC.
3. Cria duas subnets
    1. __pública__ que aceita conexões diretamente da Internet.
    2. __privada__ acessa a Internet mas não aceita conexões de fora.
4. Cria uma tabela de rota pública
    1. Associa a rede pública a esta tabela
    2. cria uma rota para a Internet com CIDR _0.0.0.0/0_ apontando para o Internet Gateway
5. Cria um NAT Gateway
    1. Adiciona este gateway a uma rede pública, (já que esta tem acesso a Internet)
    __obs__: É preciso reserver um IP elástico _Elastic IP_
6. Cria uma tabela de rota privada
    1. Associa a rede privada a esta tabela
    2. Cria uma rota para a Internet com CIDR _0.0.0.0/0_ apontando para o NAT Gateway
7. Cria um grupo de segurança _Security Groups_ para cada rede existenta na VPC
    1. Caso as _Ec2_ sejam Linux, habilita a porta 22 (SSH)
    2. Caso as _Ec2_ sejam Windows, habilitar a porta 3389 (RDP)


### v2 - Refatoração do código para modularizar a infraestrutura:

__Total: 5 módulos__

Module | Description
-------|-------------
vpc    | cria a vpc juntamente com o Internet Gateway
subnets| cria as subnets publica e privada, assim como as route tables com suas respectivas rotas
nat_gw | cria o nat gateway para ser utilizado como saída para internet da rede privada
security_groups | security groups com regras para o webserver e dbserver separadamente
ec2 | cria as ec2 

#### v2.1

- Refatorado _variables.tf_ dos módulos _subnets_ e _ec2_ para utilizarem _type object_ no lugar de variáveis individuais.
- criado arquivo ami_data.tf para buscar, independentemente de região, uma ami válida do _Windows Server 2022_ para ser utilizada nas ec2.

