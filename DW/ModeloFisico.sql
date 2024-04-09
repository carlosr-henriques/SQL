CREATE SCHEMA dimensional;

CREATE  TABLE dimensional.DIM_CLIENTE ( 
	sk_int_cd_cliente    INT    NOT NULL AUTO_INCREMENT  PRIMARY KEY,
	int_cd_cliente       INT    NOT NULL   ,
	chr_nm_cliente       VARCHAR(100)    NOT NULL   ,
	chr_nm_email         VARCHAR(100)    NOT NULL   ,
	dat_dt_nascimento    DATE    NOT NULL   ,
	chr_nm_telefone      VARCHAR(100)    NOT NULL   ,
	chr_bool_habilitado_campanha CHAR(1)    NOT NULL   ,
	chr_cd_cep           VARCHAR(100)    NOT NULL   ,
	chr_nm_cidade        VARCHAR(100)    NOT NULL   ,
	CONSTRAINT unq_DIM_CLIENTE_sk_int_cd_cliente UNIQUE ( sk_int_cd_cliente ) 
 ) engine=InnoDB;

CREATE  TABLE dimensional.DIM_LOJA ( 
	sk_int_cd_loja       INT    NOT NULL AUTO_INCREMENT  PRIMARY KEY,
	int_cd_loja          INT    NOT NULL   ,
	chr_nm_loja          VARCHAR(100)    NOT NULL   ,
	chr_nm_regiao        VARCHAR(100)    NOT NULL   ,
	chr_nm_cidade        VARCHAR(100)    NOT NULL   ,
	chr_nm_estado        VARCHAR(100)    NOT NULL   
 ) engine=InnoDB;

CREATE  TABLE dimensional.DIM_PERIODO ( 
	sk_int_cd_periodo    INT    NOT NULL AUTO_INCREMENT  PRIMARY KEY,
	int_cd_periodo       INT    NOT NULL   ,
	dat_dt_data          DATE    NOT NULL   ,
	int_nr_ano           INT    NOT NULL   ,
	int_nr_mes           INT    NOT NULL   ,
	int_nr_dia_mes       INT    NOT NULL   ,
	int_nr_semana        INT    NOT NULL   ,
	chr_dat_dt_data      VARCHAR(100)    NOT NULL   ,
	chr_nm_mes           VARCHAR(100)    NOT NULL   ,
	chr_nm_trimestre     VARCHAR(100)    NOT NULL   ,
	chr_nm_dia_semana    VARCHAR(100)    NOT NULL   ,
	bool_feriado         BOOLEAN    NOT NULL   ,
	chr_nm_feriado       VARCHAR(100)    NOT NULL   
 ) engine=InnoDB;

CREATE  TABLE dimensional.DIM_PRODUTO ( 
	sk_int_cd_produto    INT    NOT NULL AUTO_INCREMENT  PRIMARY KEY,
	int_cd_produto       INT    NOT NULL   ,
	chr_cd_sku           VARCHAR(100)    NOT NULL   ,
	chr_nm_produto       VARCHAR(100)    NOT NULL   ,
	chr_nm_tipo_produto  VARCHAR(100)    NOT NULL   ,
	chr_nm_marca_produto VARCHAR(100)    NOT NULL   
 ) engine=InnoDB;

CREATE  TABLE dimensional.FAT_VENDA ( 
	sk_int_cd_cliente    INT    NOT NULL   ,
	sk_int_cd_produto    INT    NOT NULL   ,
	sk_int_cd_loja       INT    NOT NULL   ,
	sk_int_cd_periodo    INT    NOT NULL   ,
	num_vlr_venda        DECIMAL(10,2)    NOT NULL   ,
	int_qtd_itens_vendidos INT    NOT NULL   ,
	CONSTRAINT pk_FAT_VENDA PRIMARY KEY ( sk_int_cd_cliente, sk_int_cd_produto, sk_int_cd_loja, sk_int_cd_periodo )
 ) engine=InnoDB;

ALTER TABLE dimensional.FAT_VENDA ADD CONSTRAINT fk_FAT_VENDA_DIM_LOJA FOREIGN KEY ( sk_int_cd_loja ) REFERENCES dimensional.DIM_LOJA( sk_int_cd_loja ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE dimensional.FAT_VENDA ADD CONSTRAINT fk_FAT_VENDA_DIM_PRODUTO FOREIGN KEY ( sk_int_cd_produto ) REFERENCES dimensional.DIM_PRODUTO( sk_int_cd_produto ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE dimensional.FAT_VENDA ADD CONSTRAINT fk_FAT_VENDA_DIM_PERIODO FOREIGN KEY ( sk_int_cd_periodo ) REFERENCES dimensional.DIM_PERIODO( sk_int_cd_periodo ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE dimensional.FAT_VENDA ADD CONSTRAINT fk_FAT_VENDA_DIM_CLIENTE FOREIGN KEY ( sk_int_cd_cliente ) REFERENCES dimensional.DIM_CLIENTE( sk_int_cd_cliente ) ON DELETE CASCADE ON UPDATE CASCADE;
