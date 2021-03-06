--truncate table [EETDW].[dim].[BudgetType]


INSERT INTO [EETDW].[dim].[BudgetType]
           ([BudgetTypeKey]
           ,[BudgetTypeVersion]
           ,[BudgetTypeIsCurrentBudget]
           ,[BudgetTypeIsCurrentForecast]
           ,[BudgetTypeCategory]
           ,[BudgetBrandType]
		   ,[BudgetTypeMeasure]

)
SELECT DISTINCT 
       [BudgetTypeVersion] + N'-' + [BudgetTypeIsCurrentBudget] + N'-' + [BudgetTypeIsCurrentForecast] + N'-' + [BudgetTypeCategory] + N'-' + [BudgetBrandType]  + N'-' + [BudgetTypeMeasure] AS BudgetTypeKey


      ,[BudgetTypeVersion]
      ,[BudgetTypeIsCurrentBudget]
      ,[BudgetTypeIsCurrentForecast]
      ,[BudgetTypeCategory]
      ,[BudgetBrandType]
      ,[BudgetTypeMeasure]

  FROM [EETDW_Extract].[control].[BudgetReadInSales]
  ORDER BY 1,2,3,4,5,6,7