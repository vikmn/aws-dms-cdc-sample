exec msdb.dbo.rds_cdc_enable_db 'CustomerDB'

exec sys.sp_cdc_enable_table   
   @source_schema = N'dbo'
,  @source_name = N'CustomerInformation'
,  @role_name = N'admin'

Update [CustomerDB].[dbo].[CustomerInformation] Set Name = 'John Doe' where Id = 173320132