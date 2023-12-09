/*alunos: Acácio Vinicius de Castro Gomes Bezerra;
Céu do Nascimento
Rafaele Santana*/

create table coletadelixo(
lixocoleta integer,
lixoqueima integer,
lixoenterra integer,
id_coleta integer
);

create table if not exists escolas(
nomeescola varchar(100),
endereco varchar(100),
numero varchar(20),
idescola integer
);

alter table escolas
add primary key (idescola);

create table esgotoescolas(
esgotopublico integer,
esgotofossaseptica integer,
esgotofossacomum integer,
esgotofossa integer,
semesgoto integer,
id_esgoto integer
);

create table intermediotratalixo(
semtratalixo integer,
tratalixorecicla integer,
tratalixosepara integer,
tratalixoreutiliza integer,
id_tratamentosdelixo integer
);

create table localizacao(
cidade text,
tiporegiao text,
id_localidade integer
);

select * from coletadelixo;

select * from intermediotratalixo;

/*definindo id_coleta como primary key*/
alter table coletadelixo
add primary key (id_coleta);

select * from coletadelixo;

alter table localizacao
add primary key (id_localidade);

alter table esgotoescolas
add primary key (id_esgoto);

select * from esgotoescolas;

select * from escolas;

alter table escolas
add column esgotoescolar integer;

select * from escolas;

/*adicionando chave estrangeira de esgoto na entidade escolas*/
alter table escolas
add foreign key (esgotoescolar)
references esgotoescolas(id_esgoto);

alter table escolas
add column tratamentolixo_escolar integer;

/*adicionando chave estrangeira do tratamento de lixo das escolas*/
alter table escolas
add foreign key (tratamentolixo_escolar)
references intermediotratalixo(id_tratamentosdelixo);

alter table escolas
add column coleta_lixo integer;

alter table escolas
add foreign key (coleta_lixo)
references coletadelixo(id_coleta);

/*chave estrangeira na tabela localizacao com regiao e cidade das escolas*/
alter table localizacao
add column escolalocal integer;

/*relacionamento das regioes com as escolas para consultar localizacao*/
alter table localizacao
add foreign key (escolalocal)
references escolas(idescola);

select * from localizacao join escolas
on id_localidade = idescola;

select * from escolas join coletadelixo
on idescola = id_coleta;

select * from escolas join esgotoescolas
on idescola = id_esgoto;

select * from escolas join intermediotratalixo
on idescola = id_tratamentosdelixo;


/*salvo*/