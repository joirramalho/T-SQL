ALTER FUNCTION dbo.ufn_EPDescription (@COLUMN_SEARCH VARCHAR(64))
RETURNS VARCHAR(512)
AS
BEGIN
    RETURN
        CASE 
			-- Chaves Primárias
            WHEN @COLUMN_SEARCH LIKE 'IdAutorizacao%'					 	THEN 'Identificador da autorizaçãoo '  + REPLACE( @COLUMN_SEARCH, 'IdAutorizacao', '')
            WHEN @COLUMN_SEARCH LIKE 'IdAcao'								THEN 'Identificador da ação'
            WHEN @COLUMN_SEARCH LIKE 'IdAreaAtuacao' 	 					THEN 'Identificador de Área de atuação (Ex.: Civil/Militar)'
            WHEN @COLUMN_SEARCH LIKE 'IdAutorizadorCadastro'				THEN 'Identificador do Autorizador de cadastro'
            WHEN @COLUMN_SEARCH LIKE 'IdBanco'		 						THEN 'Identificador de Banco'
            WHEN @COLUMN_SEARCH LIKE 'IdCargoFuncao'					 	THEN 'Identificador de Cargo & Funcao'
            WHEN @COLUMN_SEARCH LIKE 'IdCidade'		 						THEN 'Identificador de Cidade'
            WHEN @COLUMN_SEARCH LIKE 'IdDiretoria%'					 		THEN 'Identificador da Diretoria '  + REPLACE( @COLUMN_SEARCH, 'IdDiretoria', '')
            WHEN @COLUMN_SEARCH LIKE 'IdEstado'					 			THEN 'Identificador de Estado'
			WHEN @COLUMN_SEARCH LIKE 'IdEstadoCivil'	 					THEN 'Identificador de Estado Civil (Ex.: 0-Não informado,1-Solteiro(a),2-Casado(a), etc)'
            WHEN @COLUMN_SEARCH LIKE 'IdFeriado'					 		THEN 'Identificador de feriado'
            WHEN @COLUMN_SEARCH LIKE 'IdGrupoUnidadeJurisdicionada' 		THEN 'Identificador do Grupo da Unidade Jurisdicionada (Ex.: 1-Tribunal de Justiça, 2-Procuradoria Geral de Justiça, 3-Assembleia Legislativa)'
            WHEN @COLUMN_SEARCH LIKE 'IdMicrorregiao'					 	THEN 'Identificador da Microrregião'
            WHEN @COLUMN_SEARCH LIKE 'IdModulo'					 			THEN 'Identificador do módulo do sistema'
            WHEN @COLUMN_SEARCH LIKE 'IdOrgao%' 							THEN 'Identificador do Orgão' + REPLACE( @COLUMN_SEARCH, 'IdOrgao', '')
            WHEN @COLUMN_SEARCH LIKE 'IdOperadoraPlanoSaude'				THEN 'Identificador da Operadora de Plano Saúde'
            WHEN @COLUMN_SEARCH LIKE 'IdOperador%' 							THEN 'Identificador do Operador ' + REPLACE( @COLUMN_SEARCH, 'IdOperador', '')
            WHEN @COLUMN_SEARCH LIKE 'IdPerfil'		 						THEN 'Identificador de perfil do operador interno/externo'

            WHEN @COLUMN_SEARCH LIKE 'IdPessoaFisica%'						THEN 'Identificador da Pessoa física ' + REPLACE( @COLUMN_SEARCH, 'IdPessoaFisica', '')
            WHEN @COLUMN_SEARCH LIKE 'IdPessoaJuridica%' 					THEN 'Identificador da Pessoa Jurídica '  + REPLACE( @COLUMN_SEARCH, 'IdPessoaJuridica', '')
            WHEN @COLUMN_SEARCH LIKE 'IdUnidadeJurisdicionada%' 			THEN 'Identificador da Unidade Jurisdicionada ' + REPLACE( @COLUMN_SEARCH, 'IdUnidadeJurisdicionada', '')

            WHEN @COLUMN_SEARCH LIKE 'IdOrgaoNatureza'					 	THEN 'Identificador da Natureza do Órgao (Ex.: 1-Poder Executivo Municipal > 50.000 hab; 2-Poder Legislativo Municipal > 50.000 hab; 6-Poder Executivo Estadual, etc'
            
            WHEN @COLUMN_SEARCH LIKE 'IdPagina'								THEN 'Identificador da página'
            WHEN @COLUMN_SEARCH LIKE 'IdRelator'					 		THEN 'Identificador do Relator do Processo'
            WHEN @COLUMN_SEARCH LIKE 'IdSetor%'					 			THEN 'Identificador do Setor '  + REPLACE( @COLUMN_SEARCH, 'IdSetor', '')
            WHEN @COLUMN_SEARCH LIKE 'IdSiglaLRF'					 		THEN 'Identificador da IdSiglaLRF (Ex.: 1-Fundos de Assistência Social, 2-Câmaras Municipais, etc)' 
            WHEN @COLUMN_SEARCH LIKE 'IdSolicitacao%'					 	THEN 'Identificador da do Solicitacao do ' + REPLACE( @COLUMN_SEARCH, 'IdSolicitacao', '')

            WHEN @COLUMN_SEARCH LIKE 'IdTipoAdministracao'					THEN 'Identificador do Tipo de Administração (Ex.: 0-não informado, 1-DIRETA, 2-INDIRETA)'
            WHEN @COLUMN_SEARCH LIKE 'IdTipoDocumento'					 	THEN 'Identificador de documentos (Ex.: 1-CPF, 2-CNPJ)'
            WHEN @COLUMN_SEARCH LIKE 'IdTipoSetor'							THEN 'Identificador do Tipo do Setor (Ex.: 0-Não informado, 1-Diretoria, 2-Coordenação, 3-Grupo de Trabalho e 4-Comissão'
            WHEN @COLUMN_SEARCH LIKE 'IdTipo%'								THEN 'Identificador do Tipo de '  + REPLACE( @COLUMN_SEARCH, 'IdTipo', '')

            WHEN @COLUMN_SEARCH LIKE 'Id%'									THEN 'Identificador de '  + REPLACE( @COLUMN_SEARCH, 'Id', '')

            
            -- Auditoria
        	WHEN @COLUMN_SEARCH LIKE 'IdSessaoOperacao' 					THEN 'Identificador da Operação do Registro'
            WHEN @COLUMN_SEARCH LIKE 'IdSessao' 		 					THEN 'Identificador da Sessão do Registro'
            WHEN @COLUMN_SEARCH LIKE 'DataInclusao' 						THEN 'Data da Inclusão do Registro'
            WHEN @COLUMN_SEARCH LIKE 'DataBloqueio%'	 					THEN 'Data de bloqueio de(o) ' + REPLACE( @COLUMN_SEARCH, 'DataBloqueio', '')
            WHEN @COLUMN_SEARCH LIKE 'DataExpiracao%'	 					THEN 'Data de expiracao ' + REPLACE( @COLUMN_SEARCH, 'DataExpiracao', '')
            WHEN @COLUMN_SEARCH LIKE 'DataInativacao'						THEN 'Data de inativação do Registro (softdelete)'
            WHEN @COLUMN_SEARCH LIKE 'DataSessao' 							THEN 'Data da abertura da Sessão'
            
            

			-- Palavras chave %%
            WHEN @COLUMN_SEARCH LIKE '%Ativo%' 						THEN REPLACE( @COLUMN_SEARCH, 'Ativo', '') + ' Ativo? 1-Sim/0-Não'
            WHEN @COLUMN_SEARCH LIKE '%CPF%' 						THEN 'Número do CPF' + REPLACE( @COLUMN_SEARCH, 'CPF', '')
            WHEN @COLUMN_SEARCH LIKE '%CNPJ%' 						THEN 'Número do CNPJ' + REPLACE( @COLUMN_SEARCH, 'CNPJ', '')
            WHEN @COLUMN_SEARCH LIKE '%Febraban%'	 				THEN 'Código FEBRABAN (Ex.: 001-Banco Brasil, 104-Caixa Econômica)'
            WHEN @COLUMN_SEARCH LIKE '%HASH%' 						THEN 'HASH de(o) ' + REPLACE( @COLUMN_SEARCH, 'HASH', '') + '(Número identificador de arquivo que é baseado no conteúdo binário do mesmo; cada arquivo diferente possui um hash específico; usado para checar se o conteúdo original do arquivo recebido foi preservado. )'
            WHEN @COLUMN_SEARCH LIKE '%IBGE%' 						THEN 'Código da cidade no IBGE (Ex.:)'
            WHEN @COLUMN_SEARCH LIKE '%Justificativa%' 				THEN 'Justificativa' + REPLACE( @COLUMN_SEARCH, 'Justificativa', '')
            WHEN @COLUMN_SEARCH LIKE '%Nascimento%' 				THEN 'Data de Nascimento' + REPLACE( @COLUMN_SEARCH, 'Nascimento', '')
            WHEN @COLUMN_SEARCH LIKE '%Observacao%' 				THEN 'Observação de(o) ' + REPLACE( @COLUMN_SEARCH, 'Observacao', '')
            WHEN @COLUMN_SEARCH LIKE '%Observacoes%' 				THEN 'Observacoes'
            
            
            -- Prefixos
            WHEN @COLUMN_SEARCH LIKE 'Ano%' 							THEN 'Ano de(o) ' + REPLACE( @COLUMN_SEARCH, 'Ano', '')
            WHEN @COLUMN_SEARCH LIKE 'Bairro%' 							THEN 'Bairro do(a) ' + REPLACE( @COLUMN_SEARCH, 'Bairro', '')
            WHEN @COLUMN_SEARCH LIKE 'Cargo%' 							THEN 'Cargo de(a) ' + REPLACE( @COLUMN_SEARCH, 'Cargo', '')
            WHEN @COLUMN_SEARCH LIKE 'CEP%' 							THEN 'CEP do(a) ' + REPLACE( @COLUMN_SEARCH, 'CEP', '')
            WHEN @COLUMN_SEARCH LIKE 'Codigo%' 							THEN 'Código de(a) ' + REPLACE( @COLUMN_SEARCH, 'Codigo', '')
            WHEN @COLUMN_SEARCH LIKE 'Complemento%'						THEN 'Complemento do Logradouro'
            WHEN @COLUMN_SEARCH LIKE 'Data%' 							THEN 'Data de(a) ' + REPLACE( @COLUMN_SEARCH, 'Data', '')
            WHEN @COLUMN_SEARCH LIKE 'Descricao%' 						THEN 'Descrição de(a) ' + REPLACE( @COLUMN_SEARCH, 'Descricao', '')
            WHEN @COLUMN_SEARCH LIKE 'Email%' 							THEN 'E-mail de(a) ' + REPLACE( @COLUMN_SEARCH, 'Email', '')
            WHEN @COLUMN_SEARCH LIKE 'Identidade%' 						THEN 'Número da Identidade'
            WHEN @COLUMN_SEARCH LIKE 'Logradouro%' 						THEN 'Nome completo do Logradouro, com abreviação somente no tipo (Ex.: R., Av., Trav., Rod. etc)'
            WHEN @COLUMN_SEARCH LIKE 'Matricula%' 						THEN 'Matrícula de(a) ' + REPLACE( @COLUMN_SEARCH, 'Matricula', '')
            WHEN @COLUMN_SEARCH LIKE 'Nome%' 							THEN 'Nome de(o) ' + REPLACE( @COLUMN_SEARCH, 'Nome', '')
            WHEN @COLUMN_SEARCH LIKE 'Numero%' 							THEN 'Número de(a) ' + REPLACE( @COLUMN_SEARCH, 'Numero', '')
            WHEN @COLUMN_SEARCH LIKE 'Sexo%' 							THEN 'Sexo'
            WHEN @COLUMN_SEARCH LIKE 'Sigla%' 							THEN 'Sigla de(a) ' + REPLACE( @COLUMN_SEARCH, 'Sigla', '')
            WHEN @COLUMN_SEARCH LIKE 'Telefone%' 						THEN 'Telefone do(a) ' + REPLACE( @COLUMN_SEARCH, 'Telefone', '')
            WHEN @COLUMN_SEARCH LIKE 'TituloEleitor%' 					THEN 'Número do Título de Eleitor'
            

            ELSE @COLUMN_SEARCH
        END 
END
	
--	select dbo.ufn_EPDescription ('DataInclusao');