/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE [toysforboys].[dbo].[orders]
  SET status = 'WAITING' WHERE status = 'TAITING';
  UPDATE [toysforboys].[dbo].[orders]
  SET status = 'CANCELLED' WHERE status = 'TANCELLED';
  UPDATE [toysforboys].[dbo].[orders]
  SET status = 'RESOLVED' WHERE status = 'TESOLVED';
  UPDATE [toysforboys].[dbo].[orders]
  SET status = 'SHIPPED' WHERE status = 'THIPPED';
  UPDATE [toysforboys].[dbo].[orders]
  SET status = 'DISPUTED' WHERE status = 'TISPUTED';
  UPDATE [toysforboys].[dbo].[orders]
  SET status = 'PROCESSING' WHERE status = 'TROCESSING'; 