-- dbCrmActivesoft.dbo.TbColetaDados definition

-- Drop table

-- DROP TABLE dbCrmActivesoft.dbo.TbColetaDados;

CREATE TABLE dbCrmActivesoft.dbo.TbColetaDados (
	IdColetaDados bigint IDENTITY(1,1) NOT NULL,
	DataHora datetime DEFAULT getdate() NOT NULL,
	IdCliente int NOT NULL,
	IdUnidade int NULL,
	IdColetaIndicador int NOT NULL,
	ValorInteger int NULL,
	ValorNumeric numeric(12,2) NULL,
	ValorString varchar(8000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	ValorDate datetime NULL
);
 CREATE NONCLUSTERED INDEX IX_TbColetaDados ON dbo.TbColetaDados (  IdColetaIndicador ASC  , DataHora ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE CLUSTERED INDEX TbColetaDados_IdCliente_IdColetaIdentificador_DataHora ON dbo.TbColetaDados (  IdCliente ASC  , IdColetaIndicador ASC  , DataHora DESC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- dbCrmActivesoft.dbo.TbColetaDados foreign keys

ALTER TABLE dbCrmActivesoft.dbo.TbColetaDados ADD CONSTRAINT FK_TbColetaDados_TbCliente FOREIGN KEY (IdCliente) REFERENCES dbCrmActivesoft.dbo.TbCliente(IdCliente);
ALTER TABLE dbCrmActivesoft.dbo.TbColetaDados ADD CONSTRAINT FK_TbColetaDados_TbClienteUnidade FOREIGN KEY (IdCliente,IdUnidade) REFERENCES dbCrmActivesoft.dbo.TbClienteUnidade(IdCliente,IdUnidade);
ALTER TABLE dbCrmActivesoft.dbo.TbColetaDados ADD CONSTRAINT FK_TbColetaDados_TbColetaIndicador FOREIGN KEY (IdColetaIndicador) REFERENCES dbCrmActivesoft.dbo.TbColetaIndicador(IdColetaIndicador);