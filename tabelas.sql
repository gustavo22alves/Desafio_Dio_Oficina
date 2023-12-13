-- CRIANDO UM BANCO DE DADOS REFERENTE A UMA OFICINA MECÂNICA

show databases; -- VERIFICAÇÃO DE BANCO DE DADOS EXISTENTE
create database if not exists oficina_sanja; -- CRIANDO UM BD CASO ELE JA NÃO EXISTA
use oficina_sanja; -- USANDO O BD CRIADO
show tables; -- VERIFICANDO QUE NÃO HA QUAISQUER TABELA NO BD

-- CRIANDO TABELA CLIENTE  
create table clientes(
	idClientes int auto_increment primary key,    
    CPF char (11) not null unique,
    telefone char (9) not null unique,
    endereco varchar (250) not null
);
alter table clientes
	add column name_cliente varchar(200);
    
    
-- CRIANDO A TABELA SERVIÇO
create table servico(
	idServico int auto_increment primary key,
    tipo_servico enum('corretiva','preventiva','preditiva') not null default 'corretiva',
    valor_serviço float not null,
    servico_cliente int,
    constraint fk_clientes foreign key (servico_cliente) references clientes (idClientes)
);


-- CRIANDO A TABELA VEICULO
create table veiculo(
    idVeiculo int auto_increment primary key,
    modelo varchar(100) not null,
    marca varchar(100) not null,
    placa varchar(10),
    ano_modelo int not null,
    veiculo_cliente int not null,
    constraint fk_veiculo_cliente foreign key (veiculo_cliente) references clientes(idClientes)
);


-- CRIANDO A TABELA MECANICO
create table mecanico(
    idMecanico int auto_increment primary key,
    endereco_mec varchar(200),
    mecanico_cliente int not null,
    constraint fk_mec_cliente foreign key (mecanico_cliente) references clientes(idClientes)
);


-- CRIANDO A TABELA ORDEM DE SERVIÇO
create table ordem_servico(
    idOrdem int auto_increment not null primary key,
    descricao varchar(200),
	ordem_veiculo int not null,
    ordem_cliente int not null,
    constraint fk_ordem_cliente foreign key (ordem_cliente) references clientes (idClientes),
    constraint fk_ordem_veiculo foreign key (ordem_veiculo) references veiculo (idVeiculo)
);


-- CRIANDO A TABELA PAGAMENTO
create table pagamento(
    idPagamento int auto_increment primary key,
    pag_cliente int not null,
    metodo_pag enum('cartao','pix','dinheiro') not null default 'dinheiro',
    constraint fk_pag_cliente foreign key (pag_cliente) references clientes(idClientes)
);
