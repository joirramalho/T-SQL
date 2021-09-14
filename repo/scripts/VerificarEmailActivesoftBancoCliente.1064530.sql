/*	
	14/05/2016 Sérgio Barbosa
		Criando script para verificar se existe e-mail da activesoft cadastrado na configuração do banco de dados do cliente.
		Em circunstâncias normais (banco de produção) não deve existir.
		
	11/10/2016 Sérgio Barbosa
		Ajuste no script VerificarEmailActivesoftBancoCliente. {CRM 96159}
*/
GO

--IF EXISTS (SELECT 1 FROM TbUnidade WHERE SiglaUnidade = 'ACTIVE')
  GOTO FIM

DECLARE @Mensagem VARCHAR(MAX)

SET @Mensagem = ''

IF EXISTS ( SELECT 1
            FROM   TbUnidade u
            WHERE  CHARINDEX( 'Activesoft', u.EmailUnidade ) > 0 )
	SET @Mensagem = @Mensagem + 'E-mail do domínio @activesoft cadastrado: Arquivos > Escolas e unidades > Unidades > F4-Alterar > Dados da unidade > E-mail.' + CHAR(10)

IF EXISTS ( SELECT 1
	    FROM   TbParametroInternet pi
	    WHERE  CHARINDEX( 'Activesoft', pi.EmailSetorBiblioteca ) > 0
	    OR	   CHARINDEX( 'Activesoft', pi.EmailSetorDirecao ) > 0 ) OR
   EXISTS ( SELECT 1
            FROM   TbUnidade u
            WHERE  CHARINDEX( 'Activesoft', u.EmailSetorSecretaria ) > 0
            OR	   CHARINDEX( 'Activesoft', u.EmailSetorFinanceiro ) > 0 )
	SET @Mensagem = @Mensagem + 'E-mail do domínio @activesoft cadastrado: Utilitários > Parâmetros > Parâmetros do módulo internet.' + CHAR(10)

IF EXISTS ( SELECT 1
	    FROM   TbMensagemConfiguracaoContaSMTP mcc
	    WHERE  ( ( CHARINDEX( 'activesoft', mcc.Email_EmailComCopia )  > 0 ) AND ( mcc.Email_EmailComCopia  <> 'agenda@activesoft.com.br' ) )
            OR	   ( ( CHARINDEX( 'activesoft', mcc.Email_EmailRemetente ) > 0 ) AND ( mcc.Email_EmailRemetente <> 'agenda@activesoft.com.br' ) )
            OR     ( ( CHARINDEX( 'activesoft', mcc.Email_EmailResponder ) > 0 ) AND ( mcc.Email_EmailResponder <> 'agenda@activesoft.com.br' ) ) )
	SET @Mensagem = @Mensagem + 'E-mail do domínio @activesoft cadastrado: Utilitários > Parâmetros > Envio de E-Mail/SMS > Configurar servidores STMP.' + CHAR(10)

IF EXISTS ( SELECT 1
	    FROM   TbParametroMobile pm
	    WHERE  CHARINDEX( 'Activesoft', pm.EmailMensagemUsuario ) > 0 
	    AND    pm.EmailMensagemUsuario <> 'agenda@activesoft.com.br' )
	SET @Mensagem = @Mensagem + 'E-mail do domínio @activesoft cadastrado: Utilitários > Parâmetros > Mobile.' + CHAR(10)

IF ( @Mensagem <> '' )
  RAISERROR( @Mensagem, 16, 1)
  
  
FIM: