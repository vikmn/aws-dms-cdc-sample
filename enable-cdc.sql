exec msdb.dbo.rds_cdc_enable_db 'CustomerDB'

exec sys.sp_cdc_enable_table   
   @source_schema = N'dbo'
,  @source_name = N'CustomerInformation'
,  @role_name = N'admin'

select * from cdc.dbo_CustomerInformation_CT where Id = 173320132
--__$start_lsn – the Log Sequence Number of the commited transaction. Every change committed in the same transaction has its own row in the change table, but the same __$start_lsn
--__$end_lsn – the column is always NULL in SQL Server 2012, future compatibility is not guarantee
--__$seqval – the sequence value used to order the row changes within a transaction
--__$operation – indicates the change type made on the row
--1- Delete
--2- Insert
--3- Updated row before the change
--4- Updated row after the change

--__$update_mask – similar to the update mask available in Change Tracking, a bit mask used to identify the ordinals of the modified columns
Update [CustomerDB].[dbo].[CustomerInformation] Set Name = 'John Doe' where Id = 173320132
Update [CustomerDB].[dbo].[CustomerInformation] Set balance = 400 where Id = 173320132
Update [CustomerDB].[dbo].[CustomerInformation] Set Phone =  '(952) 420-2095' where Id = 173320132
Update [CustomerDB].[dbo].[CustomerInformation] Set IsActive =  0 where Id = 173320132
Update [CustomerDB].[dbo].[CustomerInformation] Set IsActive =  1,Balance=350 where Id = 173320132
select * from cdc.dbo_CustomerInformation_CT where Id = 173320132