


select format(getdate(),'dd.MM.yyyy')
select format(getdate(),'d.MM.yy')
select format(getdate(),'dd.MM.yyyy')

select format(getdate(),'d', 'en-US')

select format(getdate(),'d', 'en-GB')

select format(getdate(),'d', 'zh-cn')


SELECT   
   GETDATE() AS UnconvertedDateTime,  
   CAST(GETDATE() AS NVARCHAR(30)) AS UsingCast,  
   CONVERT(nvarchar(30), GETDATE(), 126) AS UsingConvertTo_ISO8601  ,  
   CONVERT(nvarchar(30), GETDATE(), 104) AS UsingConvertGerman  ;  
GO  