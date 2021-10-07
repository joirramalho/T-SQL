USE dbSigaOverdose

-- STEP 1 --

BEGIN TRY
    BEGIN TRAN
        DELETE TbAlunoObs WHERE IdTipoOcorrencia = (SELECT tipo.IdTipoOcorrencia FROM TbTipoOcorrencia tipo WHERE tipo.NomeTipoOcorrencia = 'Pendência financeira no outro banco')
    COMMIT TRAN
END TRY
BEGIN CATCH
    IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN;

    THROW; -- raise error to the client
END CATCH

-- STEP 2 --

BEGIN TRY
    BEGIN TRAN

        INSERT INTO TbAlunoObs(
                IdAluno, IdAlunoObs, IdTipoOcorrencia, StImpedimento, DataOcorrencia, IdUsuarioRegistro,
                ObservacaoRegistro, DataLiberacao, IdUsuarioLiberacao, ObservacaoLiberacao, DataInclusao, StExibirInternet)
        (SELECT 
                IdAluno = alu.IdAluno, 
                IdAlunoObs = ROW_NUMBER() OVER (ORDER BY alu.IdAluno) + ISNULL( ( SELECT MAX(IdAlunoObs) FROM TbAlunoObs ), 0 ), 
                IdTipoOcorrencia, StImpedimento, DataOcorrencia, IdUsuarioRegistro, ObservacaoRegistro, DataLiberacao,
                IdUsuarioLiberacao, ObservacaoLiberacao, DataInclusao, StExibirInternet
        FROM(
        SELECT DISTINCT
            auxMatricula                        = CASE 
                                            WHEN u.Endereco LIKE '%Cabo de São Roque%' THEN 'CS'
                                        END
                                        + Matricula,
            IdAlunoObs                          = null,
            IdTipoOcorrencia            = tipo.IdTipoOcorrencia,
            StImpedimento                       = 1,
            DataOcorrencia                      = GETDATE(),
            IdUsuarioRegistro           = usu.IdUsuario,
            ObservacaoRegistro      = CASE 
                                        WHEN a.Sexo = 'F' THEN 'A aluna ' + a.NomeAluno + ', matrícula ' + a.Matricula + ', possui pendência financeira.'
                                        WHEN a.Sexo = 'M' THEN 'O aluno ' + a.NomeAluno + ', matrícula ' + a.Matricula + ', possui pendência financeira.'
                                    END,
            DataLiberacao                       = NULL, --
            IdUsuarioLiberacao          = NULL, --
            ObservacaoLiberacao         = NULL, --
            DataInclusao                        = GETDATE(),
            StExibirInternet            = 0
        FROM    dbSigaEspacoEducacao..VwTituloCobranca tc 
        INNER   JOIN dbSigaEspacoEducacao..TbAluno a ON tc.IdAluno = a.IdAluno
        LEFT    JOIN dbSigaEspacoEducacao..TbUnidade u ON a.IdUnidade = u.IdUnidade
        LEFT    JOIN TbUsuario usu ON usu.Login = 'suporte'
        LEFT    JOIN TbTipoOcorrencia tipo ON tipo.NomeTipoOcorrencia = 'Pendência financeira no outro banco'
        WHERE   tc.StAbertoEmAtraso = 1) pendencias

        INNER JOIN TbAluno alu ON pendencias.auxMatricula = alu.Matricula
        )

    COMMIT TRAN
END TRY
BEGIN CATCH
    IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN;

    THROW; -- raise error to the client
END CATCH


-- STEP 3 --

BEGIN TRY
    BEGIN TRAN

        INSERT INTO TbAlunoObs(
                IdAluno, IdAlunoObs, IdTipoOcorrencia, StImpedimento, DataOcorrencia, IdUsuarioRegistro,
                ObservacaoRegistro, DataLiberacao, IdUsuarioLiberacao, ObservacaoLiberacao, DataInclusao, StExibirInternet)
        (SELECT 
                IdAluno = alu.IdAluno, 
                IdAlunoObs = ROW_NUMBER() OVER (ORDER BY alu.IdAluno) + ISNULL( ( SELECT MAX(IdAlunoObs) FROM TbAlunoObs ), 0 ), 
                IdTipoOcorrencia, StImpedimento, DataOcorrencia, IdUsuarioRegistro, ObservacaoRegistro, DataLiberacao,
                IdUsuarioLiberacao, ObservacaoLiberacao, DataInclusao, StExibirInternet
        FROM(
        SELECT DISTINCT
            auxMatricula                        = CASE 
                                            WHEN u.Endereco LIKE '%Nascimento de Castro%' THEN 'NC'
                                            WHEN u.Endereco LIKE '%Abel Cabral%' THEN 'AB'
                                        END
                                        + a.Matricula,
            IdAlunoObs                          = null,
            IdTipoOcorrencia            = tipo.IdTipoOcorrencia,
            StImpedimento                       = 1,
            DataOcorrencia                      = GETDATE(),
            IdUsuarioRegistro           = usu.IdUsuario,
            ObservacaoRegistro      = CASE 
                                        WHEN a.Sexo = 'F' THEN 'A aluna ' + a.NomeAluno + ', matrícula ' + a.Matricula + ', possui pendência financeira.'
                                        WHEN a.Sexo = 'M' THEN 'O aluno ' + a.NomeAluno + ', matrícula ' + a.Matricula + ', possui pendência financeira.'
                                    END,
            DataLiberacao                       = NULL, --
            IdUsuarioLiberacao          = NULL, --
            ObservacaoLiberacao         = NULL, --
            DataInclusao                        = GETDATE(),
            StExibirInternet            = 0
        FROM    dbSigaCursinhoOverdose..VwTituloCobranca tc 
        INNER   JOIN dbSigaCursinhoOverdose..TbAluno a ON tc.IdAluno = a.IdAluno
        LEFT    JOIN dbSigaCursinhoOverdose..TbUnidade u ON a.IdUnidade = u.IdUnidade
        LEFT    JOIN TbUsuario usu ON usu.Login = 'suporte'
        LEFT    JOIN TbTipoOcorrencia tipo ON tipo.NomeTipoOcorrencia = 'Pendência financeira no outro banco'
        WHERE   tc.StAbertoEmAtraso = 1
        ) pendencias
        INNER JOIN TbAluno alu ON pendencias.auxMatricula = alu.Matricula

        )

    COMMIT TRAN
END TRY
BEGIN CATCH
    IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN;

    THROW; -- raise error to the client
END CATCH