/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [FullName]
      ,[Email]
      ,[Phone]
      ,[Message]
  FROM [HospitalDCH].[dbo].[Contact]