INSERT INTO control.BudgetReadInGL
                         (BudgetTypeIsCurrentBudget, BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, MainIndexNo, SubIndexNo, 
                         DepartmentCode, ProjectCode, AmountLCY, AmountDKK, BudgetTypeVersion)
SELECT        N'No' AS BudgetTypeIsCurrentBudget, N'Yes' AS BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, MainIndexNo, 
                         SubIndexNo, DepartmentCode, ProjectCode, AmountLCY * 1.1 AS AmountLCY, AmountDKK * 1.1 AS AmountDKK, N'F201802' AS BudgetTypeVersion
FROM            control.BudgetReadInGL AS BudgetReadInGL_1
WHERE        (BudgetTypeVersion = N'B2018')


INSERT INTO control.BudgetReadInGL
                         (BudgetTypeIsCurrentBudget, BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, MainIndexNo, SubIndexNo, 
                         DepartmentCode, ProjectCode, AmountLCY, AmountDKK, BudgetTypeVersion)
SELECT        N'No' AS BudgetTypeIsCurrentBudget, N'No' AS BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, MainIndexNo, 
                         SubIndexNo, DepartmentCode, ProjectCode, AmountLCY * 1.1 AS AmountLCY, AmountDKK * 1.1 AS AmountDKK, N'F201803' AS BudgetTypeVersion
FROM            control.BudgetReadInGL AS BudgetReadInGL_1
WHERE        (BudgetTypeVersion = N'F201802')



INSERT INTO control.BudgetReadInSales
                         (BudgetTypeIsCurrentBudget, BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, [GPPGNo], [GPPGName], 
                         [GPPGProductAreaName], AmountLCY, AmountDKK, BudgetTypeVersion)
SELECT        N'No' AS BudgetTypeIsCurrentBudget, N'Yes' AS BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, [GPPGNo], 
                         [GPPGName], [GPPGProductAreaName], AmountLCY * 1.1 AS AmountLCY, AmountDKK * 1.1 AS AmountDKK, N'F201802' AS BudgetTypeVersion
FROM            control.BudgetReadInSales AS BudgetReadInSales_1
WHERE        (BudgetTypeVersion = N'B2018')



INSERT INTO control.BudgetReadInSales
                         (BudgetTypeIsCurrentBudget, BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, [GPPGNo], [GPPGName], 
                         [GPPGProductAreaName], AmountLCY, AmountDKK, BudgetTypeVersion)
SELECT        N'No' AS BudgetTypeIsCurrentBudget, N'No' AS BudgetTypeIsCurrentForecast, BudgetTypeCategory, BudgetBrandType, BudgetTypeMeasure, BusinessUnitCode, BusinessUnitName, CalendarID, [GPPGNo], 
                         [GPPGName], [GPPGProductAreaName], AmountLCY * 1.1 AS AmountLCY, AmountDKK * 1.1 AS AmountDKK, N'F201803' AS BudgetTypeVersion
FROM            control.BudgetReadInSales AS BudgetReadInSales_1
WHERE        (BudgetTypeVersion = N'F201802')