exec sp_updateextendedproperty 
	@name=N'sys_sensitivity_label_name'
	,@level0type=N'schema'
	,@level0name=N'dbo' 
	
	,@level1type=N'table'
	,@level1name=N'TbParametroGlobal' 

	,@level2type=N'column'
	,@level2name=N'PJBankCodigoParceiro' 
	
	,@value=N'Confidential - GDPR';
