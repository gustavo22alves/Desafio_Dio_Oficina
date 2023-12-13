-- UTILIZANDO O BD OFICINA MECÂNICA

use oficina_sanja;
show tables;

-- ANALISANDO QUAIS ITENS TEM QUE SER PREENCHIDOS NA TABELA
select * from clientes;

-- ALIMENTANDO TABELA CLIENTES
insert into clientes(cpf, telefone, endereco) 
	values 
		(123456789, 234567891, 'RUA GERALDO 613'),
        (345678912, 456789123, 'RUA ALFREDO 136'),
        (567891234, 678912345, 'RUA CIDADE 99'),
        (789456123, 891234567, 'RUA ANDROMEDA 1000'),
        (912345678, 012345678, 'RUA CACAPAVA 2000');
        
select * from mecanico;
insert into mecanico (endereco_mec, mecanico_cliente)
	values
		('rua 1','1'),
        ('rua 3','2'),
        ('rua 2','3'),
        ('rua 5','1'),
        ('rua 6','4'),
        ('rua 7','5'),
        ('rua 8','2');
        
select * from ordem_servico;
insert into ordem_servico (descricao)
	values
		('troca de pastilha'),
		('troca de oleo'),
        ('troca de limpador parabrisa'),
        ('suspenção gritando'),
        ('suspensão rugindo');
        
select * from pagamento;        
insert into pagamento(pag_cliente, metodo_pag)
	values
		(1,'dinheiro'),
        (3,'dinheiro'),
        (1,'cartao'),
        (5,'pix'),
        (2,'dinheiro'),
		(1,'pix');
        
select * from servico;
insert into servico(tipo_servico, valor_serviço, servico_cliente)
	values
		('preventiva', 500, 1),
        ('corretiva', 800, 2),
        ('preditiva', 700, 4),
        ('preventiva', 300, 3),
        ('corretiva', 1500, 5);
        
select * from veiculo;
insert into veiculo(modelo, marca, placa, ano_modelo, veiculo_cliente)
	values
		('fit', 'honda', 'abc-1234', 2015,1),
		('civic', 'honda', 'def-1234', 2023,3),
		('palio', 'fiat', 'ghi-1234', 2011,4),
		('gol', 'vw', 'jkl-1234', 2010,2);
        
select * from clientes;
select * from veiculo;        
select * from ordem_servico;
select * from mecanico;        
select * from servico;
select * from pagamento;


-- RECUPERA INFORMAÇÕES DE CLIENTES E FORMAS DE PAGAMENTO

select * from clientes, pagamento  where idClientes=pag_cliente;

select name_cliente, CPF, telefone, metodo_pag from clientes, pagamento  where idClientes=pag_cliente;


-- RECUPERA O CLIENTE O SERVIÇO QUE FOI REALIZADO

select * from clientes, servico 
where idClientes=servico_cliente 
ORDER BY idClientes;

-- RECUPERA INFORMAÇÕES DO CLIENTE O TIPO E VALOR DO SERVIÇO

select CPF, telefone, tipo_servico, valor_serviço 
from clientes, servico 
where idClientes=servico_cliente
order by valor_serviço;

-- RECUPERA INFORMAÇÕES DE MECÂNICO E SERVIÇO REALIZADO SENDO VALORES COBRADOS ACIMA DE 500 REAIS

select * from mecanico, servico 
where mecanico_cliente = idServico 
having valor_serviço > 500
order by valor_serviço;

-- RECUPERANDO A QUANTIDADE DE SERVIÇOS REALIZADOS POR CPF

select c.idClientes, CPF, count(*) as Número_de_serviços from clientes c 
inner join servico s ON c.idClientes = s.servico_cliente
group by idClientes; 

-- RECUPERA MECANICO, TIPO, VALOR DO SERVIÇO E CLIENTE EM VALORS ABAIXO DE 800 REAIS

select idMecanico, tipo_servico, valor_serviço, servico_cliente 
from mecanico, servico
where mecanico_cliente=servico_cliente 
having valor_serviço < 800;

