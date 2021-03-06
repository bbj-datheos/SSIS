/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  
t.BudgetTypeID
,CAST(ISNULL(c.[CompanyId],-1) AS INT) AS [CompanyId]
,ISNULL(g.[GPPGID],-1) AS [GPPGCurrentID]
,CAST(divide.[CalendarID] AS INT) AS [CalendarID]
      --,[BudgetTypeVersion]
      --,[BudgetTypeIsCurrentBudget]
      --,[BudgetTypeIsCurrentForecast]
      --,[BudgetTypeCategory]
      --,[BudgetBrandType]
      --,[BudgetTypeMeasure]
      --,[BusinessUnitCode]
      --,[BusinessUnitName]
 --     ,divide.[CalendarID] AS [CalendarID]
      --,[GPPGNo]
      --,[GPPGName]
      --,[GPPGProductAreaName]
      ,[AmountLCY]/NoOfDays AS [Sales Budget LCY]
      ,[AmountDKK]/NoOfDays AS [Sales Budget DKK]
  FROM [EETDW_Extract].[control].[BudgetReadInSales] b
  INNER JOIN
  (
		  SELECT * FROM [EETDW_Extract].[control].[BudgetReadInDays]
		INNER JOIN
		(
		SELECT  LEFT([CalendarID],6) AS M
		      , LEFT([CalendarID],6) +'01' AS MinDayOfMonth
			  ,count(*) AS NoOfDays
		  FROM [EETDW_Extract].[control].[BudgetReadInDays]
		  WHERE [DayIsWorkingDay]='Yes'
		  GROUP BY LEFT([CalendarID],6)
		) mth ON  LEFT([BudgetReadInDays].[CalendarID],6) = M
		WHERE  [BudgetReadInDays].[DayIsWorkingDay]='Yes'
) divide ON b.[CalendarID]=divide.MinDayOfMonth
  LEFT JOIN [EETDW].[dim].[Company] c ON b.[BusinessUnitCode]=c.[CompanyKey]
  LEFT JOIN [EETDW].[dim].[GPPG] g ON b.[GPPGNo]=g.GPPGKey
 LEFT JOIN [EETDW].[dim].[BudgetType] t ON 
      b.[BudgetTypeVersion]=t.[BudgetTypeVersion]
      AND b.[BudgetTypeIsCurrentBudget]=t.[BudgetTypeIsCurrentBudget]
      AND b.[BudgetTypeIsCurrentForecast]=t.[BudgetTypeIsCurrentForecast]
      AND b.[BudgetTypeCategory]=t.[BudgetTypeCategory]
      AND b.[BudgetBrandType]=t.[BudgetBrandType]
      AND b.[BudgetTypeMeasure]=t.[BudgetTypeMeasure]

ORDER BY divide.[CalendarID]