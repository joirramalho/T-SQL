-- DESLIGAR Verificação Pendência entre Siga & Bib pós Restore

ALTER VIEW dbo.VwBibliotecaPendencia
AS

SELECT Tipo = '', 
Descricao = '', 
       IdAluno = 0
       
WHERE        1=0