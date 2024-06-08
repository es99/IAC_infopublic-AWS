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
7. Cria um grupo de segurança _Security Groups_ para cada rede existente na VPC
    1. Caso as _Ec2_ sejam Linux, habilita a porta 22 (SSH)
    2. Caso as _Ec2_ sejam Windows, habilitar a porta 3389 (RDP)


### v2 - Refatoração do código para modularizar a infraestrutura:

__Total: 5 módulos__

Module | Description | inputs | outputs
-------|-------------|--------|---------
vpc    | cria a vpc juntamente com o Internet Gateway e eip utilizadas nas ec2 |
subnets| cria as subnets publica e privada, assim como as route tables com suas respectivas rotas |
nat_gw | cria o nat gateway para ser utilizado como saída para internet da rede privada |
security_groups | security groups com regras para o webserver e dbserver separadamente |
ec2 | cria as ec2 |

#### v2.1

- Refatorado _variables.tf_ dos módulos _subnets_ e _ec2_ para utilizarem _type object_ no lugar de variáveis individuais.
- criado arquivo ami_data.tf para buscar, independentemente de região, uma ami válida do _Windows Server 2022_ para ser utilizada nas ec2.

#### v2.2
- Criado uma _aws role_ para poder habilitar os resources _aws instances_ a utilizarem o bucket _S3_, _ssm management_ e _cloudwatch_, a variável foi inserida dentro um _object_, sendo opcional, ou seja, se a mesma não for setada, as instancia ec2 subiram sem nenhuma _role_/_iam profile_

#### v2.3
- Ao subir as ec2 (webserver e dbserver) ambas já adquirem um _elastic ip address_ (eip)/ip fixo essenciais para aplicação. Os _outputs_ informam o id e ipaddress dos respectivos recursos eip.

#### v2.4

- 14-05-2024: Inserido no _output_ do módulo _ec2_ os _instance types_ tanto do DBServer, quanto WebServer.

#### v.2.5
- 14-05-2024: Alterado tipo de instância do WebServer de _m7i-flex.xlarge_ com 4vcpu e 16ram para _r7i.xlarge_ com 4vcpu e 32ram.

#### v.3.0
- 08-06-2024: Importado para a gerência do Terraform os _ts-servers_ Main (Principal) e o servidor dedicado de Pitimbu. Esta nova infra em código encontra-se localizada
na pasta __ts-servers-infra__