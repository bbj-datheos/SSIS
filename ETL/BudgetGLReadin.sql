/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [CompanyId]
     -- ,[BusinessUnitName]
      ,[CalendarID]
      ,[MainIndexNo] AS [Main Index No.]
      ,[SubIndexNo] AS [Sub Index No.]
      ,t.BudgetTypeId
	  ,d.NavisionDimensionID
      ,[Amount] AS [GL Budget LCY]
      ,[AmountDKK] AS [GL Budget DKK]
  FROM [EETDW_Extract].[control].[BudegetReadInGL] g
  LEFT JOIN [EETDW].[dim].[BudgetType] t ON 
      g.[BudgetTypeVersion]=t.[BudgetTypeVersion]
      AND g.[BudgetTypeIsCurrentBudget]=t.[BudgetTypeIsCurrentBudget]
      AND g.[BudgetTypeIsCurrentForecast]=t.[BudgetTypeIsCurrentForecast]
      AND g.[BudgetTypeLevel1]=t.[BudgetTypeLevel1]
      AND g.[BudgetTypeLevel2]=t.[BudgetTypeLevel2]
      AND g.[BudgetTypeLevel3]=t.[BudgetTypeLevel3]
      AND g.[BudgetTypeMeasure]=t.[BudgetTypeMeasure]

LEFT JOIN (SELECT * FROM [EETDW].[dim].[NavisionDimension] WHERE [DWNavisionCompany]='EET Denmark') d ON
      d.[DepartmentCode]=g.[DepartmentCode]
     AND  d.[ProjectCode]=g.[ProjectCode]
	 AND d.[DWNavisionCompany]='EET Denmark'

WHERE Amount<>0 OR AmountDKK<>0