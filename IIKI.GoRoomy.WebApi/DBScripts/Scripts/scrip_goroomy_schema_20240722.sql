USE [IIKI_GoRoomyDB]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'v_Users', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Users'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'v_Users', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Users'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'v_Users', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Users'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'v_FormattedAddress', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_FormattedAddress'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'v_FormattedAddress', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_FormattedAddress'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'v_EntityAddress', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_EntityAddress'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'v_EntityAddress', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_EntityAddress'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblVendors', N'COLUMN',N'PurchasingWebServiceURL'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'PurchasingWebServiceURL'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblVendors', N'COLUMN',N'PreferredVendorStatus'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'PreferredVendorStatus'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblVendors', N'COLUMN',N'CreditRating'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'CreditRating'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblVendors', N'COLUMN',N'AccountNumber'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'AccountNumber'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblUnitofMeasurements', N'COLUMN',N'UoMType'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUnitofMeasurements', @level2type=N'COLUMN',@level2name=N'UoMType'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblStateProvinces', N'COLUMN',N'FIPSCode'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStateProvinces', @level2type=N'COLUMN',@level2name=N'FIPSCode'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', N'CONSTRAINT',N'CK_tblShipMethods_ShipRate'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'CONSTRAINT',@level2name=N'CK_tblShipMethods_ShipRate'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', N'CONSTRAINT',N'CK_tblShipMethods_ShipBaseRate'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'CONSTRAINT',@level2name=N'CK_tblShipMethods_ShipBaseRate'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', N'CONSTRAINT',N'PK_tblShipMethods_Id'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'CONSTRAINT',@level2name=N'PK_tblShipMethods_Id'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', N'COLUMN',N'ShipRate'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'ShipRate'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', N'COLUMN',N'ShipBaseRate'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'ShipBaseRate'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', N'COLUMN',N'CompanyName'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblShipMethods', N'COLUMN',N'Id'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'Id'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblProducts', N'COLUMN',N'InboundDate'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'InboundDate'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblProducts', N'COLUMN',N'WarrantyPeroid'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'WarrantyPeroid'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblProducts', N'COLUMN',N'SupplierWarranty'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'SupplierWarranty'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblProducts', N'COLUMN',N'ProductStatus'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'ProductStatus'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblProducts', N'COLUMN',N'ProductSerialNumber'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'ProductSerialNumber'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblEmployees', N'COLUMN',N'SickLeaveHours'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblEmployees', @level2type=N'COLUMN',@level2name=N'SickLeaveHours'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblEmployees', N'COLUMN',N'VacationHours'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblEmployees', @level2type=N'COLUMN',@level2name=N'VacationHours'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblEmployees', N'COLUMN',N'SalaryType'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblEmployees', @level2type=N'COLUMN',@level2name=N'SalaryType'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblCurrencies', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCurrencies'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tblCurrencies', N'COLUMN',N'CountryId'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCurrencies', @level2type=N'COLUMN',@level2name=N'CountryId'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'CONSTRAINT',N'PK_ErrorLogs_ErrorLogsID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'CONSTRAINT',@level2name=N'PK_ErrorLogs_ErrorLogsID'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorMessage'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorMessage'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorLine'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorLine'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorProcedure'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorProcedure'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorState'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorState'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorSeverity'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorSeverity'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorNumber'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorNumber'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'UserName'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'UserName'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'CONSTRAINT',N'DF_ErrorLogs_ErrorTime'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'CONSTRAINT',@level2name=N'DF_ErrorLogs_ErrorTime'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorTime'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorTime'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ErrorLogs', N'COLUMN',N'ErrorLogsID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorLogsID'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'CONSTRAINT',N'PK_DatabaseLogs_DatabaseLogsID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'CONSTRAINT',@level2name=N'PK_DatabaseLogs_DatabaseLogsID'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'XmlEvent'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'XmlEvent'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'TSQL'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'TSQL'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'Object'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'Object'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'Schema'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'Schema'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'Event'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'Event'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'DatabaseUser'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'DatabaseUser'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'PostTime'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'PostTime'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLogs', N'COLUMN',N'DatabaseLogsID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'DatabaseLogsID'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'TRIGGER',N'ddlDatabaseTriggerLog', NULL,NULL, NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'TRIGGER',@level0name=N'ddlDatabaseTriggerLog'
GO
/****** Object:  DdlTrigger [ddlDatabaseTriggerLog]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TRIGGER IF EXISTS [ddlDatabaseTriggerLog] ON DATABASE
GO
/****** Object:  Trigger [trInsertSetDefaultPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TRIGGER IF EXISTS [dbo].[trInsertSetDefaultPermissions]
GO
/****** Object:  Trigger [trDeleteUserPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TRIGGER IF EXISTS [dbo].[trDeleteUserPermissions]
GO
/****** Object:  StoredProcedure [dbo].[uspPrintError]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[uspPrintError]
GO
/****** Object:  StoredProcedure [dbo].[uspLogError]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[uspLogError]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateUser]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_ValidateUser]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUserPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_UpdateUserPermissions]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateRolesDefaultPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_UpdateRolesDefaultPermissions]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateProfileImage]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_UpdateProfileImage]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateInsertUserInfo]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_UpdateInsertUserInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchUsers]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SearchUsers]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateVendor]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateVendor]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateUserInformation]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateUserInformation]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateNavigation]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateNavigation]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateEmployee]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateEmployee]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateCustomer]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateCustomer]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateContactAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateContactAddress]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateContact]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateContact]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateCompanyType]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateCompanyType]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertUpdateAddress]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertAreaNavigationAndRights]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_InsertAreaNavigationAndRights]
GO
/****** Object:  StoredProcedure [dbo].[usp_HasPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_HasPermissions]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetVendors]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetVendors]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserUpdateActivities]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserUpdateActivities]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserPermissionsList]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserPermissionsList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserNavigationList]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserNavigationList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserModulesList]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserModulesList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserList]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserInfo]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserAreaRulesList]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserAreaRulesList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserApplicationAreasList]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUserApplicationAreasList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUnitofMeasurements]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetUnitofMeasurements]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetStateProvinces]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetStateProvinces]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRolesList]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetRolesList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRolesDefaultPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetRolesDefaultPermissions]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProducts]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetProducts]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetProductDocuments]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductCategories]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetProductCategories]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPermissionDefinitions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetPermissionDefinitions]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetNavigations]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetNavigations]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetNavigationBreadCrumbs]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetNavigationBreadCrumbs]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMax]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetMax]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMainModules]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetMainModules]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetLoginUser]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetLoginUser]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelWithDependents]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotelWithDependents]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotels]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotels]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelRoomServices]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotelRoomServices]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelRooms]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotelRooms]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelReservations]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotelReservations]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelPolicies]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotelPolicies]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotelDocuments]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelCategories]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetHotelCategories]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEntityDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetEntityDocuments]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEntityAddresses_Old]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetEntityAddresses_Old]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEntityAddresses]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetEntityAddresses]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployees]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetEmployees]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmailByUserID]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetEmailByUserID]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDocumentTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetDocumentTypes]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetDocuments]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDivisions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetDivisions]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCustomers]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCustomers]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCountries]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCountries]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContactTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetContactTypes]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContacts]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetContacts]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContactDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetContactDocuments]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContactAddresses]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetContactAddresses]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCompanyTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCompanyTypes]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCompanies]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCompanies]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCommaSeperatedString]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCommaSeperatedString]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCities]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCities]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCastes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetCastes]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetBranches]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetBranches]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAspNetUsers]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetAspNetUsers]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAspNetRoles]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetAspNetRoles]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetApplicationSupportedLanguages]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetApplicationSupportedLanguages]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetApplicationAreas]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetApplicationAreas]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAddressTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetAddressTypes]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAddresses]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_GetAddresses]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteVendors]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DeleteVendors]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteNewlyCreatedUser]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_DeleteNewlyCreatedUser]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckRecordExistsById]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CheckRecordExistsById]
GO
/****** Object:  StoredProcedure [dbo].[usp_3ResetIndentity]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_3ResetIndentity]
GO
/****** Object:  StoredProcedure [dbo].[usp_2CalculateAllTablesMemoryInKBs]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_2CalculateAllTablesMemoryInKBs]
GO
/****** Object:  StoredProcedure [dbo].[usp_1GetEntityClass]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_1GetEntityClass]
GO
/****** Object:  StoredProcedure [dbo].[usp_1GetBALClass]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_1GetBALClass]
GO
/****** Object:  StoredProcedure [dbo].[usp_0GetAllTablesFromOtherServer]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_0GetAllTablesFromOtherServer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblShipMethods]') AND type in (N'U'))
ALTER TABLE [dbo].[tblShipMethods] DROP CONSTRAINT IF EXISTS [CK_tblShipMethods_ShipRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblShipMethods]') AND type in (N'U'))
ALTER TABLE [dbo].[tblShipMethods] DROP CONSTRAINT IF EXISTS [CK_tblShipMethods_ShipBaseRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblVendors]') AND type in (N'U'))
ALTER TABLE [dbo].[tblVendors] DROP CONSTRAINT IF EXISTS [FK_tblVendors_tblContacts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUserInformation]') AND type in (N'U'))
ALTER TABLE [dbo].[tblUserInformation] DROP CONSTRAINT IF EXISTS [FK_tblUserInformation_tblContacts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUserInformation]') AND type in (N'U'))
ALTER TABLE [dbo].[tblUserInformation] DROP CONSTRAINT IF EXISTS [FK_AspNetUsers_tblUserInformation_Id_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUnitofMeasurements]') AND type in (N'U'))
ALTER TABLE [dbo].[tblUnitofMeasurements] DROP CONSTRAINT IF EXISTS [FK_tblUnitsofMeasurement_tblCompanies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUnitofMeasurements]') AND type in (N'U'))
ALTER TABLE [dbo].[tblUnitofMeasurements] DROP CONSTRAINT IF EXISTS [FK_tblUnitsofMeasurement_tblBranches]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProducts]') AND type in (N'U'))
ALTER TABLE [dbo].[tblProducts] DROP CONSTRAINT IF EXISTS [FK_Products_UnitOfMeasurement]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProducts]') AND type in (N'U'))
ALTER TABLE [dbo].[tblProducts] DROP CONSTRAINT IF EXISTS [FK_Products_ProductCategories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProducts]') AND type in (N'U'))
ALTER TABLE [dbo].[tblProducts] DROP CONSTRAINT IF EXISTS [FK_Products_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProducts]') AND type in (N'U'))
ALTER TABLE [dbo].[tblProducts] DROP CONSTRAINT IF EXISTS [FK_Products_Branch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductDocuments]') AND type in (N'U'))
ALTER TABLE [dbo].[tblProductDocuments] DROP CONSTRAINT IF EXISTS [FK_tblProductDocuments_tblProducts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotels]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotels] DROP CONSTRAINT IF EXISTS [FK_tblHotels_tblHotelCategories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotels]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotels] DROP CONSTRAINT IF EXISTS [FK_tblHotels_tblCompanies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelDocuments]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelDocuments] DROP CONSTRAINT IF EXISTS [FK_tblHotelDocuments_tblHotels]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelCategories]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelCategories] DROP CONSTRAINT IF EXISTS [FK_tblHotelCategories_tblCompanies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelCategories]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelCategories] DROP CONSTRAINT IF EXISTS [FK_tblHotelCategories_tblBranches]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmployees]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEmployees] DROP CONSTRAINT IF EXISTS [FK_tblEmployees_tblContacts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDivisions]') AND type in (N'U'))
ALTER TABLE [dbo].[tblDivisions] DROP CONSTRAINT IF EXISTS [FK_tblDivisions_tblCompanies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDivisions]') AND type in (N'U'))
ALTER TABLE [dbo].[tblDivisions] DROP CONSTRAINT IF EXISTS [FK_tblDivisions_tblBranches]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCustomers]') AND type in (N'U'))
ALTER TABLE [dbo].[tblCustomers] DROP CONSTRAINT IF EXISTS [FK_tblCustomers_tblContacts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContactDocuments]') AND type in (N'U'))
ALTER TABLE [dbo].[tblContactDocuments] DROP CONSTRAINT IF EXISTS [FK_tblContactDocuments_tblContacts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCompanies]') AND type in (N'U'))
ALTER TABLE [dbo].[tblCompanies] DROP CONSTRAINT IF EXISTS [FK__tblCompanyTypes__tblCompanies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblBranches]') AND type in (N'U'))
ALTER TABLE [dbo].[tblBranches] DROP CONSTRAINT IF EXISTS [FK_tblBranches_tblCompanies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAddresses]') AND type in (N'U'))
ALTER TABLE [dbo].[tblAddresses] DROP CONSTRAINT IF EXISTS [FK_tblAddresses_tblAddressTypes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUserInformation]') AND type in (N'U'))
ALTER TABLE [dbo].[tblUserInformation] DROP CONSTRAINT IF EXISTS [DF__tblUserIn__IsMan__51EF2864]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblShipMethods]') AND type in (N'U'))
ALTER TABLE [dbo].[tblShipMethods] DROP CONSTRAINT IF EXISTS [DF_tblShipMethods_ShipRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblShipMethods]') AND type in (N'U'))
ALTER TABLE [dbo].[tblShipMethods] DROP CONSTRAINT IF EXISTS [DF_tblShipMethods_ShipBaseRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRoomServices]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRoomServices] DROP CONSTRAINT IF EXISTS [DF_tblHotelRoomServices_RecordStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_ForthSlotRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_ForthSlotTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_ThirdSlotRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_ThirdSlotTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_SecondSlotRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_SecondSlotTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_FirstSlotRate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblHotelRooms]') AND type in (N'U'))
ALTER TABLE [dbo].[tblHotelRooms] DROP CONSTRAINT IF EXISTS [DF_tblHotelRooms_FirstSlotTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntityTypes]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEntityTypes] DROP CONSTRAINT IF EXISTS [DF_tblEntityTypes_UpdatedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntityTypes]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEntityTypes] DROP CONSTRAINT IF EXISTS [DF_tblEntityTypes_UpdatedBy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntityTypes]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEntityTypes] DROP CONSTRAINT IF EXISTS [DF_tblEntityTypes_CreatedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntityTypes]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEntityTypes] DROP CONSTRAINT IF EXISTS [DF_tblEntityTypes_CreatedBy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntityTypes]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEntityTypes] DROP CONSTRAINT IF EXISTS [DF_tblEntityTypes_RecordStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntityTypes]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEntityTypes] DROP CONSTRAINT IF EXISTS [DF_tblEntityTypes_UniqueGUID]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEntityAddresses]') AND type in (N'U'))
ALTER TABLE [dbo].[tblEntityAddresses] DROP CONSTRAINT IF EXISTS [DF_tblEntityAddresses_RecordGUID]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContactTypes]') AND type in (N'U'))
ALTER TABLE [dbo].[tblContactTypes] DROP CONSTRAINT IF EXISTS [DF_tblContactTypes_RecordStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContactAddresses]') AND type in (N'U'))
ALTER TABLE [dbo].[tblContactAddresses] DROP CONSTRAINT IF EXISTS [DF_tblContactAddresses_RecordGUID]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAreaRules]') AND type in (N'U'))
ALTER TABLE [dbo].[tblAreaRules] DROP CONSTRAINT IF EXISTS [DF_tbl_Rights_AreaRules_IsLineBreak]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLogs]') AND type in (N'U'))
ALTER TABLE [dbo].[ErrorLogs] DROP CONSTRAINT IF EXISTS [DF_ErrorLogs_ErrorTime]
GO
/****** Object:  Index [IX_tblStateProvinces]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP INDEX IF EXISTS [IX_tblStateProvinces] ON [dbo].[tblStateProvinces]
GO
/****** Object:  Table [dbo].[tblVendors]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblVendors]
GO
/****** Object:  Table [dbo].[tblUserUpdateActivities]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblUserUpdateActivities]
GO
/****** Object:  Table [dbo].[tblUserSessions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblUserSessions]
GO
/****** Object:  Table [dbo].[tblUserPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblUserPermissions]
GO
/****** Object:  Table [dbo].[tblUserLoginAttempts]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblUserLoginAttempts]
GO
/****** Object:  Table [dbo].[tblUnitofMeasurements]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblUnitofMeasurements]
GO
/****** Object:  Table [dbo].[tblStateProvinces]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblStateProvinces]
GO
/****** Object:  Table [dbo].[tblShipMethods]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblShipMethods]
GO
/****** Object:  Table [dbo].[tblRolesDefaultPermissions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblRolesDefaultPermissions]
GO
/****** Object:  Table [dbo].[tblPromotions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblPromotions]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblProducts]
GO
/****** Object:  Table [dbo].[tblProductDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblProductDocuments]
GO
/****** Object:  Table [dbo].[tblProductCategories]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblProductCategories]
GO
/****** Object:  Table [dbo].[tblPermissionDefinitions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblPermissionDefinitions]
GO
/****** Object:  Table [dbo].[tblNavigations]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblNavigations]
GO
/****** Object:  Table [dbo].[tblNavigationBreadCrumbs]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblNavigationBreadCrumbs]
GO
/****** Object:  Table [dbo].[tblMainModules]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblMainModules]
GO
/****** Object:  Table [dbo].[tblHotels]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotels]
GO
/****** Object:  Table [dbo].[tblHotelRoomTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelRoomTypes]
GO
/****** Object:  Table [dbo].[tblHotelRoomServices]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelRoomServices]
GO
/****** Object:  Table [dbo].[tblHotelRooms]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelRooms]
GO
/****** Object:  Table [dbo].[tblHotelReservations]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelReservations]
GO
/****** Object:  Table [dbo].[tblHotelRatings]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelRatings]
GO
/****** Object:  Table [dbo].[tblHotelPolicies]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelPolicies]
GO
/****** Object:  Table [dbo].[tblHotelDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelDocuments]
GO
/****** Object:  Table [dbo].[tblHotelCategories]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelCategories]
GO
/****** Object:  Table [dbo].[tblHotelAddresses]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblHotelAddresses]
GO
/****** Object:  Table [dbo].[tblEntityTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblEntityTypes]
GO
/****** Object:  Table [dbo].[tblEmployees]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblEmployees]
GO
/****** Object:  Table [dbo].[tblDivisions]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblDivisions]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCustomers]
GO
/****** Object:  Table [dbo].[tblCurrencies]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCurrencies]
GO
/****** Object:  Table [dbo].[tblCountries_old]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCountries_old]
GO
/****** Object:  Table [dbo].[tblContactDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblContactDocuments]
GO
/****** Object:  Table [dbo].[tblContactAddresses]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblContactAddresses]
GO
/****** Object:  Table [dbo].[tblCompanyTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCompanyTypes]
GO
/****** Object:  Table [dbo].[tblCompanies]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCompanies]
GO
/****** Object:  Table [dbo].[tblCommonStatusAndTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCommonStatusAndTypes]
GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCities]
GO
/****** Object:  Table [dbo].[tblCastes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCastes]
GO
/****** Object:  Table [dbo].[tblBranches]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblBranches]
GO
/****** Object:  Table [dbo].[tblAreaRules]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblAreaRules]
GO
/****** Object:  Table [dbo].[tblApplicationSupportedLanguages]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblApplicationSupportedLanguages]
GO
/****** Object:  Table [dbo].[tblApplicationAreas]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblApplicationAreas]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[ErrorLogs]
GO
/****** Object:  Table [dbo].[DatabaseLogs]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[DatabaseLogs]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[__EFMigrationsHistory]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnLeadingZeros]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[ufnLeadingZeros]
GO
/****** Object:  View [dbo].[v_Users]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP VIEW IF EXISTS [dbo].[v_Users]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[tblContactTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblContactTypes]
GO
/****** Object:  Table [dbo].[tblContacts]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblContacts]
GO
/****** Object:  Table [dbo].[tblUserInformation]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblUserInformation]
GO
/****** Object:  View [dbo].[v_EntityAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP VIEW IF EXISTS [dbo].[v_EntityAddress]
GO
/****** Object:  View [dbo].[v_EntityDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP VIEW IF EXISTS [dbo].[v_EntityDocuments]
GO
/****** Object:  Table [dbo].[tblDocumentTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblDocumentTypes]
GO
/****** Object:  Table [dbo].[tblDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblDocuments]
GO
/****** Object:  Table [dbo].[tblEntityDocuments]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblEntityDocuments]
GO
/****** Object:  View [dbo].[v_FormattedAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP VIEW IF EXISTS [dbo].[v_FormattedAddress]
GO
/****** Object:  Table [dbo].[tblEntityAddresses]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblEntityAddresses]
GO
/****** Object:  Table [dbo].[tblAddresses]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblAddresses]
GO
/****** Object:  Table [dbo].[tblCountries]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblCountries]
GO
/****** Object:  Table [dbo].[tblAddressTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP TABLE IF EXISTS [dbo].[tblAddressTypes]
GO
/****** Object:  UserDefinedFunction [dbo].[UrlEncode]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[UrlEncode]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitParameters]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[SplitParameters]
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[Split]
GO
/****** Object:  UserDefinedFunction [dbo].[SingularToPlural]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[SingularToPlural]
GO
/****** Object:  UserDefinedFunction [dbo].[Singularize]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[Singularize]
GO
/****** Object:  UserDefinedFunction [dbo].[ReplaceTags]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[ReplaceTags]
GO
/****** Object:  UserDefinedFunction [dbo].[PluralToSingular]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[PluralToSingular]
GO
/****** Object:  UserDefinedFunction [dbo].[Pluralize]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[Pluralize]
GO
/****** Object:  UserDefinedFunction [dbo].[GetVendorUniqueNumber]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetVendorUniqueNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[GetStartDateTimeOffset]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetStartDateTimeOffset]
GO
/****** Object:  UserDefinedFunction [dbo].[GetOffset]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetOffset]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNumberStr]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetNumberStr]
GO
/****** Object:  UserDefinedFunction [dbo].[GetLastDates]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetLastDates]
GO
/****** Object:  UserDefinedFunction [dbo].[GetJSONValue]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetJSONValue]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHotelAverageRating]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetHotelAverageRating]
GO
/****** Object:  UserDefinedFunction [dbo].[GetFormatAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetFormatAddress]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityTypeId]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetEntityTypeId]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityDocumentFullPath]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetEntityDocumentFullPath]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityAddressFormatted]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetEntityAddressFormatted]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetEntityAddress]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEndDateTimeOffset]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetEndDateTimeOffset]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomCodes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetCustomCodes]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCommonStatusAndTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[GetCommonStatusAndTypes]
GO
/****** Object:  UserDefinedFunction [dbo].[Get8DigitRandomNumberUsingNewID]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[Get8DigitRandomNumberUsingNewID]
GO
/****** Object:  UserDefinedFunction [dbo].[CapitalizeFirstLetter]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP FUNCTION IF EXISTS [dbo].[CapitalizeFirstLetter]
GO
/****** Object:  Schema [Rights]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP SCHEMA IF EXISTS [Rights]
GO
/****** Object:  Schema [Contact]    Script Date: 7/22/2024 9:51:46 AM ******/
DROP SCHEMA IF EXISTS [Contact]
GO
/****** Object:  Schema [Contact]    Script Date: 7/22/2024 9:51:46 AM ******/
CREATE SCHEMA [Contact]
GO
/****** Object:  Schema [Rights]    Script Date: 7/22/2024 9:51:46 AM ******/
CREATE SCHEMA [Rights]
GO
/****** Object:  UserDefinedFunction [dbo].[CapitalizeFirstLetter]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[CapitalizeFirstLetter]
(
--string need to format
@string VARCHAR(500)--increase the variable size depending on your needs.
)
RETURNS VARCHAR(500)
AS

BEGIN
--Declare Variables
DECLARE @Index INT,
@ResultString VARCHAR(200)--result string size should equal to the @string variable size
--Initialize the variables
SET @Index = 1
SET @ResultString = ''
--Run the Loop until END of the string

WHILE (@Index <LEN(@string)+1)
BEGIN
IF (@Index = 1)--first letter of the string
BEGIN
--make the first letter capital
SET @ResultString =
@ResultString + UPPER(SUBSTRING(@string, @Index, 1))
SET @Index = @Index+ 1--increase the index
END

-- IF the previous character is space or '-' or next character is '-'

ELSE IF ((SUBSTRING(@string, @Index-1, 1) =' 'or SUBSTRING(@string, @Index-1, 1) ='-' or SUBSTRING(@string, @Index+1, 1) ='-') and @Index+1 <> LEN(@string))
BEGIN
--make the letter capital
SET
@ResultString = @ResultString + UPPER(SUBSTRING(@string,@Index, 1))
SET
@Index = @Index +1--increase the index
END
ELSE-- all others
BEGIN
-- make the letter simple
SET
@ResultString = @ResultString + LOWER(SUBSTRING(@string,@Index, 1))
SET
@Index = @Index +1--incerase the index
END
END--END of the loop

IF (@@ERROR
<> 0)-- any error occur return the sEND string
BEGIN
SET
@ResultString = @string
END
-- IF no error found return the new string
RETURN @ResultString
END
GO
/****** Object:  UserDefinedFunction [dbo].[Get8DigitRandomNumberUsingNewID]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[Get8DigitRandomNumberUsingNewID] 
(
	@UniqueID uniqueidentifier
)
RETURNS varchar(32)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(8)

	DECLARE @randNumber BIGINT =Convert(bigint, (LEFT(CHECKSUM(@UniqueID),8)))

	IF(@randNumber<0)
	BEGIN
		SET @randNumber=@randNumber*-1
	END

	-- Return the result of the function
	RETURN Convert(Nvarchar(8), @randNumber)

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetCommonStatusAndTypes]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetCommonStatusAndTypes] 
(
	-- Add the parameters for the function here	
	@StatusTypeId BIGINT,
	@StatusTypeName NVARCHAR(200) =null,
	@StatusId BIGINT =0,
	@StatusName NVARCHAR(200) =null
)
RETURNS NVARCHAR(4000)
AS
BEGIN

if(@StatusId =0 ) 
BEGIN
	SET @StatusId = NULL
	END
	-- Declare the return variable here
	DECLARE @Result NVARCHAR(4000)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = (SELECT StatusTypeId,StatusTypeName,StatusId,StatusName
						FROM tblCommonStatusAndTypes t
							WHERE (@StatusTypeId IS NULL OR t.StatusTypeId=@StatusTypeId)
							AND (@StatusTypeName IS NULL OR t.StatusTypeName like '%'+@StatusTypeName+'%')
							AND (@StatusId IS NULL OR t.StatusId=@StatusId)
							AND (@StatusName IS NULL OR t.StatusName like '%'+@StatusName+'%')
						FOR JSON AUTO)


	
	-- Return the result of the function
	RETURN ISNULL(@Result,'') 

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomCodes]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCustomCodes]
(
	@string VARCHAR(500)--increase the variable size depending on your needs.
)
RETURNS bigint
AS
BEGIN
	if(@string='DUPLICATE')
		BEGIN
			RETURN -392378460
		END
	if(@string='EXCEPTION')
		BEGIN
			RETURN -392378461
		END
	
	
	RETURN 0
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetEndDateTimeOffset]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[GetEndDateTimeOffset] 
(
	-- Add the parameters for the function here
	@date datetimeoffset(7)
)
RETURNS datetimeoffset(7)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result datetimeoffset(7)

	SET @date = ISNULL(@date, SYSDATETIMEOFFSET())

	-- Add the T-SQL statements to compute the return value here
	DECLARE @TimeZoneMinutes INT = datepart(tz, @date);
	SET @Result = DATEADD(MCS, -1, DATEADD(DD, 1, DATETIMEOFFSETFROMPARTS(datepart(yyyy, @date), datepart(mm, @date), datepart(dd, @date), 0, 0, 0, 0, @TimeZoneMinutes/60, @TimeZoneMinutes%60, 7)));

	-- Return the result of the function
	RETURN @Result

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetEntityAddress] 
(
	-- Add the parameters for the function here
	@tblName VARCHAR(200),
	@RecordId BIGINT,
	@AddressTypeId BIGINT
)
RETURNS NVARCHAR(4000)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result NVARCHAR(4000)

	-- Add the T-SQL statements to compute the return value here
	
	SELECT TOP(1)
    @Result= CONCAT(
    CASE
        WHEN COALESCE([AddressLine1],'') != '' THEN [AddressLine1]
        ELSE ''
    END
    , CASE
        WHEN COALESCE([AddressLine2],'') != '' THEN ', ' + [AddressLine2]
        ELSE ''
    END
    , CASE
        WHEN COALESCE([City],'') !='' THEN ', ' + [City]
        ELSE ''
    END
    , CASE
        WHEN COALESCE([Province],'') != '' THEN ', ' + [Province]
        ELSE ''
    END
    , CONCAT( tC.CountryName , '(ISO3:',tc.ISO3 ,')')
	)
FROM [dbo].[tblEntityAddresses] t
LEFT JOIN tblAddresses tA ON tA.Id=t.AddressId
LEFT JOIN tblCountries tC ON tC.Id=tA.CountryId
JOIN tblEntityTypes tET on tET.TableName=@tblName
WHERE t.EntityId=@RecordId AND tA.AddressTypeId=@AddressTypeId
	-- Return the result of the function
	RETURN ISNULL(@Result,'') 

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityAddressFormatted]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create FUNCTION [dbo].[GetEntityAddressFormatted] 
(
	-- Add the parameters for the function here
	@tblName VARCHAR(200),
	@EntityId bigint
)
RETURNS VARCHAR(600)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result VARCHAR(600)
	DECLARE @EntityTypeId bigint

	-- Add the T-SQL statements to compute the return value here
	select @EntityTypeId=Id from tblEntityTypes Where TableName=@tblName

	SELECT @Result = CONCAT(
				COALESCE(ta.[AddressLine1], ''), 
				CASE WHEN ta.[AddressLine1] IS NOT NULL AND ta.[AddressLine1] != '' THEN ' ' ELSE '' END,
				COALESCE(ta.[AddressLine2], ''), 
				CASE WHEN ta.[AddressLine2] IS NOT NULL AND ta.[AddressLine2] != '' THEN ' ' ELSE '' END,
				COALESCE(ta.[City], ''), 
				CASE 
					WHEN (COALESCE(ta.[AddressLine1], '') != '' OR COALESCE(ta.[AddressLine2], '') != '' OR COALESCE(ta.[City], '') != '') 
					THEN ' (' ELSE '' END, 
				COALESCE(ta.[ZipCode], ''), 
				CASE 
					WHEN (COALESCE(ta.[AddressLine1], '') != '' OR COALESCE(ta.[AddressLine2], '') != '' OR COALESCE(ta.[City], '') != '') 
					THEN ')' ELSE '' END, 
				', ', 
				COALESCE(ta.[Province], ''), 
				', ', 
				COALESCE(tc.[CountryName], '')
			)
			FROM tblEntityAddresses AS tea
			JOIN tblAddresses ta ON ta.Id=tea.AddressId
			JOIN tblCountries tc ON tc.Id=ta.CountryId
			WHERE tea.EntityTypeId=@EntityTypeId 
				AND tea.EntityId=@EntityId
	-- Return the result of the function
	RETURN @Result

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityDocumentFullPath]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetEntityDocumentFullPath] 
(
	-- Add the parameters for the function here
	@tblName VARCHAR(200)=null,
	@EntityTypeId bigint=null,
	@DocumentPath VARCHAR(500)
)
RETURNS VARCHAR(600)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result VARCHAR(600)
	DECLARE @EntityTypeName VARCHAR(200)

	-- Add the T-SQL statements to compute the return value here
	select @EntityTypeName=TypeName from tblEntityTypes 
	Where (@EntityTypeId = 0 OR @EntityTypeId IS NULL AND TableName = @tblName)
		OR (Id = @EntityTypeId)

	SET @Result = CASE WHEN LEFT(@DocumentPath, 1) = '/' THEN CONCAT('/Resources/',@EntityTypeName, @DocumentPath) ELSE CONCAT('/Resources/',@EntityTypeName,'/', @DocumentPath) END
	-- Return the result of the function
	RETURN @Result

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetEntityTypeId]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetEntityTypeId] 
(
	-- Add the parameters for the function here
	@tblName VARCHAR(200)
)
RETURNS bigint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bigint

	-- Add the T-SQL statements to compute the return value here
	select @Result=Id from tblEntityTypes Where TableName=@tblName

	-- Return the result of the function
	RETURN @Result

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetFormatAddress]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetFormatAddress](
    @AddressLine1 NVARCHAR(256),
    @AddressLine2 NVARCHAR(256),
    @City NVARCHAR(100),
    @ZipCode NVARCHAR(100),
    @Province NVARCHAR(100),
    @CountryName NVARCHAR(100)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN CONCAT(
        COALESCE(@AddressLine1, ''), 
        CASE WHEN @AddressLine1 IS NOT NULL AND @AddressLine1 != '' THEN ' ' ELSE '' END,
        COALESCE(@AddressLine2, ''), 
        CASE WHEN @AddressLine2 IS NOT NULL AND @AddressLine2 != '' THEN ' ' ELSE '' END,
        COALESCE(@City, ''), 
        CASE 
            WHEN (COALESCE(@AddressLine1, '') != '' OR COALESCE(@AddressLine2, '') != '' OR COALESCE(@City, '') != '') 
            THEN ' (' ELSE '' END, 
        COALESCE(@ZipCode, ''), 
        CASE 
            WHEN (COALESCE(@AddressLine1, '') != '' OR COALESCE(@AddressLine2, '') != '' OR COALESCE(@City, '') != '') 
            THEN ')' ELSE '' END, 
        ', ', 
        COALESCE(@Province, ''), 
        ', ', 
        COALESCE(@CountryName, '')
    );
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetHotelAverageRating]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetHotelAverageRating] (@HotelId INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @AverageRating FLOAT;

    -- Calculate the average rating for the specified hotel
    SELECT @AverageRating = AVG(CAST(Rating AS FLOAT))
    FROM tblHotelRatings
    WHERE HotelId = @HotelId;

    -- Check if the hotel has no ratings and set @AverageRating to 0 if that's the case
    IF @AverageRating IS NULL
    BEGIN
        SET @AverageRating = 0;
    END

    RETURN @AverageRating;
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetJSONValue]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[GetJSONValue] 
(
	-- Add the parameters for the function here
	@JSONString nvarchar(max),
	@FieldName nvarchar(max),
	@Delimeter nvarchar(max) = ':',
	@EndValueDelimeter nvarchar(max) = ','
)
RETURNS nvarchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(max) = NULL

	DECLARE @Length int = LEN(@FieldName)
	DECLARE @NameIndex int = CHARINDEX(@FieldName, @JSONString, 0)

	SET @JSONString = RTRIM(LTRIM(ISNULL(@JSONString, '')))
	SET @FieldName = RTRIM(LTRIM(ISNULL(@FieldName, '')))
	SET @Delimeter = RTRIM(LTRIM(ISNULL(@Delimeter, '')))
	SET @EndValueDelimeter = RTRIM(LTRIM(ISNULL(@EndValueDelimeter, '')))

	IF @JSONString = '' OR @FieldName = '' OR @Delimeter = '' OR @EndValueDelimeter = ''
		BEGIN
			RETURN @Result
		END

	IF @NameIndex < 0
		BEGIN
			RETURN @Result
		END

	DECLARE @ValueIndex int = CHARINDEX(@Delimeter, @JSONString, @NameIndex) 

	IF @ValueIndex < 0
		BEGIN
			RETURN @Result
		END

	SET @ValueIndex = @ValueIndex + 1

	DECLARE @ValueCompleteIndex int = CHARINDEX(@EndValueDelimeter, @JSONString, @ValueIndex) 

	IF @ValueCompleteIndex < 0
		BEGIN
			RETURN @Result
		END

	IF @ValueCompleteIndex <= @ValueIndex
		BEGIN
			RETURN @Result
		END
	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = SUBSTRING(@JSONString, @ValueIndex, @ValueCompleteIndex - @ValueIndex)

	-- Return the result of the function
	RETURN @Result

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetLastDates]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create FUNCTION [dbo].[GetLastDates]
(   
    @Days int,
	@Date datetimeoffset
)
RETURNS @tempTable TABLE(LastDates datetimeoffset)
AS
BEGIN
    DECLARE @Count INT = 0 
    WHILE(@Count>-@Days)
	BEGIN
		insert INTO @tempTable VALUES(DATEADD(day, @Count, @Date))
		SET @Count = @Count - 1
	END
    RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetNumberStr]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[GetNumberStr] 
(
	-- Add the parameters for the function here
	@Number bigint
)
RETURNS varchar(32)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(32)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = CASE
						WHEN @Number >= 1000000 THEN '1M+'
						WHEN @Number < 1000000 AND @Number >= 800000 THEN '800000+'
						WHEN @Number < 800000 AND @Number >= 500000 THEN '500000+'
						WHEN @Number < 500000 AND @Number >= 300000 THEN '300000+'
						WHEN @Number < 300000 AND @Number >= 100000 THEN '100000+'
						WHEN @Number < 300000 AND @Number >= 100000 THEN '100000+'
						WHEN @Number < 100000 AND @Number >= 80000 THEN '80000+'
						WHEN @Number < 80000 AND @Number >= 50000 THEN '50000+'
						WHEN @Number < 50000 AND @Number >= 30000 THEN '30000+'
						WHEN @Number < 30000 AND @Number >= 10000 THEN '10000+'
						WHEN @Number < 8000 AND @Number >= 5000 THEN '5000+'
						WHEN @Number < 5000 AND @Number >= 3000 THEN '3000+'
						WHEN @Number < 3000 AND @Number >= 1000 THEN '1000+'
						WHEN @Number < 800 AND @Number >= 500 THEN '500+'
						WHEN @Number < 500 AND @Number >= 300 THEN '300+'
						WHEN @Number < 300 AND @Number >= 100 THEN '100+'
						WHEN @Number < 80 AND @Number >= 50 THEN '50+'
						WHEN @Number < 50 AND @Number >= 30 THEN '30+'
						WHEN @Number < 30 AND @Number >= 10 THEN '10+'
						WHEN @Number < 8 AND @Number >= 5 THEN '< 10'
						WHEN @Number < 5 AND @Number >= 3 THEN '< 10'
						WHEN @Number < 3 AND @Number >= 1 THEN '< 10'
						ELSE '0'
					END

	-- Return the result of the function
	RETURN @Result

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetOffset]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  FUNCTION [dbo].[GetOffset] 
(
 @CurrentOffset varchar(10) = NULL
)
RETURNS nvarchar(32)
AS
BEGIN
 -- Declare the return variable here
 DECLARE @Result nvarchar(32)

 SET @CurrentOffset = RTRIM(LTRIM(ISNULL(@CurrentOffset, '')))

 IF @CurrentOffset = '' OR LEN(@CurrentOffset) < 5
  BEGIN
   SET @CurrentOffset = '+00:00'
  END

 DECLARE @FirstCol int = CHARINDEX(':', @CurrentOffset, 1) 

 IF @FirstCol > 0
  BEGIN
   DECLARE @SecondCol int = CHARINDEX(':', @CurrentOffset, @FirstCol + 1)

 
   IF @SecondCol > 0
    BEGIN
     SET @CurrentOffset = SUBSTRING(@CurrentOffset, 1, @SecondCol - 1)
    END
  END

 IF LEN(@CurrentOffset) = 5
  BEGIN
   SET @CurrentOffset = '+' + @CurrentOffset
  END



 SET @Result = @CurrentOffset
 -- Return the result of the function
 RETURN @Result

END

GO
/****** Object:  UserDefinedFunction [dbo].[GetStartDateTimeOffset]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[GetStartDateTimeOffset] 
(
	-- Add the parameters for the function here
	@date datetimeoffset(7)
)
RETURNS datetimeoffset(7)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result datetimeoffset(7)

	SET @date = DATEADD(YY, -100, ISNULL(@date, SYSDATETIMEOFFSET()))

	-- Add the T-SQL statements to compute the return value here
	DECLARE @TimeZoneMinutes INT = datepart(tz, @date);
	SET @Result = DATETIMEOFFSETFROMPARTS(datepart(yyyy, @date), datepart(mm, @date), datepart(dd, @date), 0, 0, 0, 0, @TimeZoneMinutes/60, @TimeZoneMinutes%60, 7);

	-- Return the result of the function
	RETURN @Result

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetVendorUniqueNumber]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetVendorUniqueNumber] 
(
	@UniqueID uniqueidentifier
)
RETURNS varchar(50)
AS
BEGIN

	DECLARE @randNumber varchar(50) = NULL
	GOTOHERE:

	SET @randNumber = [dbo].[Get8DigitRandomNumberUsingNewID](@UniqueID)

	IF EXISTS(SELECT Id FROM dbo.tblVendors Where UniqueNumber=@randNumber)
	BEGIN
		GOTO GOTOHERE;
	END

	-- Return the result of the function
	RETURN Convert(Nvarchar(8), @randNumber)

END


GO
/****** Object:  UserDefinedFunction [dbo].[Pluralize]    Script Date: 7/22/2024 9:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Pluralize] 
(
    @noun nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN

DECLARE @QueryString nvarchar(4000)
SET @QueryString = N'FORMSOF(INFLECTIONAL,"' + @noun + N'")'
RETURN
(SELECT TOP 1 REPLACE(display_term,'''','')
FROM sys.dm_fts_parser(@QueryString,1033,0,0)
--where display_term Not Like '%''%') --AND RIGHT(display_term,1) = 's'
)

END
GO
/****** Object:  UserDefinedFunction [dbo].[PluralToSingular]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[PluralToSingular] (@plural_word NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @singular_word NVARCHAR(255)

    SET @singular_word = @plural_word

    -- Remove trailing 's' if it exists
    IF RIGHT(@plural_word, 1) = 's'
        SET @singular_word = LEFT(@plural_word, LEN(@plural_word) - 1)

    ---- 'ss' if it exists at end its singular e.g. Mess, Chess
    --IF RIGHT(@plural_word, 2) = 'ss'
    --    SET @singular_word = @plural_word
	
    -- Replace trailing 'ies' if it exists with y ie. cherries, ladies
    IF RIGHT(@plural_word, 3) = 'ies'
        SET @singular_word = LEFT(@plural_word, LEN(@plural_word) - 3)+'y'
		
    -- Remove trailing 'es' if it exists 'oes' or 'hes' ie. witches, dishes,heroes, potatoes
    IF RIGHT(@plural_word, 3) = 'oes' OR RIGHT(@plural_word, 3) = 'hes' OR RIGHT(@plural_word, 4) = 'sses'
        SET @singular_word = LEFT(@plural_word, LEN(@plural_word) - 2)

    -- Handle some common irregular plurals
    IF @singular_word IN ('children', 'men', 'women', 'people', 'mice', 'lice')
        SET @singular_word = CASE
            WHEN @singular_word = 'children' THEN 'child'
            WHEN @singular_word = 'men' THEN 'man'
            WHEN @singular_word = 'women' THEN 'woman'
            WHEN @singular_word = 'people' THEN 'person'
            WHEN @singular_word = 'mice' THEN 'mouse'
            WHEN @singular_word = 'lice' THEN 'louse'
        END

	IF (RIGHT(@singular_word,1)='''')
		SET @singular_word=LEFT(@singular_word, LEN(@singular_word) - 1)

    RETURN @singular_word
END
GO
/****** Object:  UserDefinedFunction [dbo].[ReplaceTags]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Umair Ali
-- Create date: 
-- Description:	
-- =============================================
create FUNCTION [dbo].[ReplaceTags] (
	  @pInputString NVARCHAR(max),
      @pTagsString NVARCHAR(max),
	  @pItemSeparator   VARCHAR(5) = '|',
	  @pKeyValueSeparator VARCHAR(5) = ','
)

RETURNS nvarchar(max)
AS
BEGIN

	IF (@pInputString IS NULL OR @pInputString = '')
		RETURN @pInputString;

	IF (@pTagsString IS NULL OR @pTagsString = '')
		RETURN @pInputString;

    IF (@pItemSeparator IS NULL OR @pItemSeparator = '')
        SET @pItemSeparator = '|'

    IF (@pKeyValueSeparator IS NULL OR @pKeyValueSeparator = '')
        SET @pKeyValueSeparator = ','

	DECLARE @Item           NVARCHAR(max)
	DECLARE @ItemList       NVARCHAR(max)
	DECLARE @KeyValue		NVARCHAR(max)
	DECLARE @ItemIndex		INT
	DECLARE @KeyValueIndex	INT
	DECLARE @TagName		NVARCHAR(max)
	DECLARE @TagValue		NVARCHAR(max)
	DECLARE @ReturnString	NVARCHAR(max)

	SET @ReturnString = @pInputString  
	SET @ItemList = @pTagsString
	SET @ItemIndex = CHARINDEX(@pItemSeparator, @ItemList, 0)

	WHILE (@ItemIndex != 0)
		BEGIN
			SET @Item = SUBSTRING(@ItemList, 0, @ItemIndex)
			SET @KeyValueIndex = CHARINDEX(@pKeyValueSeparator, @Item, 0)

			IF @KeyValueIndex > 0
				BEGIN
					SET @TagName = SUBSTRING(@Item, 0, @KeyValueIndex)
					SET @TagValue = SUBSTRING(@Item, @KeyValueIndex+1, LEN(@Item)-@KeyValueIndex)

					SET @ReturnString = REPLACE(@ReturnString, @TagName, @TagValue)
				END

			-- Set @ItemList = @ItemList minus one less item
			SET @ItemList = SUBSTRING(@ItemList, @ItemIndex+1, LEN(@ItemList)-@ItemIndex)
			SET @ItemIndex = CHARINDEX(@pItemSeparator, @ItemList, 0)
		END -- End WHILE

		IF LEN(@ItemList) > 0 AND @ItemIndex = 0 AND RIGHT(@ItemList, 1) != @pItemSeparator
			BEGIN
				SET @Item = @ItemList
				SET @KeyValueIndex = CHARINDEX(@pKeyValueSeparator, @Item, 0)

				IF @KeyValueIndex > 0
					BEGIN
						SET @TagName = SUBSTRING(@Item, 0, @KeyValueIndex)
						SET @TagValue = SUBSTRING(@Item, @KeyValueIndex+1, LEN(@Item)-@KeyValueIndex)

						SET @ReturnString = REPLACE(@ReturnString, @TagName, @TagValue)
					END
			END

	RETURN @ReturnString;

END -- End Function






GO
/****** Object:  UserDefinedFunction [dbo].[Singularize]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Singularize]
(
	@FieldName varchar(max)
)
RETURNS varchar(max)
AS
BEGIN
	DECLARE @Output varchar(max)

	IF @FieldName NOT LIKE '%s'
	-- already singular
	BEGIN
		SET @Output = @FieldName
	END

	ELSE IF @FieldName LIKE '%ss'
	-- already singular ie. mass, chess
	BEGIN
		SET @Output = @FieldName
	END

	ELSE IF @FieldName LIKE '%ies' 
	-- ie. cherries, ladies
	BEGIN
		SET @Output = SUBSTRING(@FieldName, 1, LEN(@FieldName)-3) + 'y'
	END

	ELSE IF @FieldName LIKE '%oes' 
	-- ie. heroes, potatoes
	BEGIN
		SET @Output = SUBSTRING(@FieldName, 1, LEN(@FieldName) -2)
	END

	ELSE IF @FieldName LIKE '%es' and SUBSTRING(@FieldName, LEN(@FieldName)-2, 1) in ('a', 'e', 'i', 'o', 'u')
	-- ie. massages, phases
	BEGIN
		SET @Output = SUBSTRING(@FieldName, 1, LEN(@FieldName) -1)
	END

	ELSE IF @FieldName LIKE '%es' and SUBSTRING(@FieldName, LEN(@FieldName) -2, 1) in ('h')
	-- ie. witches, dishes
	BEGIN
		SET @Output = SUBSTRING(@FieldName, 1, LEN(@FieldName) - 2)
	END

	ELSE IF @FieldName LIKE '%es' and SUBSTRING(@FieldName, LEN(@FieldName) -2, 1) in ('b','c','d','f','g','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z')
	-- ie. kisses, judges
	BEGIN
		SET @Output = SUBSTRING(@FieldName, 1, LEN(@FieldName) - 1)
	END

	ELSE IF @FieldName LIKE '%s'
	-- ie. laps, clocks, boys
	BEGIN
		SET @Output = SUBSTRING(@FieldName, 1, LEN(@FieldName) -1)
	END

	RETURN @Output
END
GO
/****** Object:  UserDefinedFunction [dbo].[SingularToPlural]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SingularToPlural] (@singular_word NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @plural_word NVARCHAR(255)

    SET @plural_word = @singular_word

    -- Handle some common pluralization patterns
    IF @singular_word IN ('child', 'man', 'woman', 'person', 'mouse', 'louse')
        SET @plural_word = CASE
            WHEN @singular_word = 'child' THEN 'children'
            WHEN @singular_word = 'man' THEN 'men'
            WHEN @singular_word = 'woman' THEN 'women'
            WHEN @singular_word = 'person' THEN 'people'
            WHEN @singular_word = 'mouse' THEN 'mice'
            WHEN @singular_word = 'louse' THEN 'lice'
        END;
    ELSE
		BEGIN
			SET @plural_word = @singular_word
			IF RIGHT(@singular_word, 1) = 'y'
				SET @plural_word = LEFT(@singular_word, LEN(@singular_word) - 1)+'ie'

			IF RIGHT(@singular_word, 1) = 'o' OR RIGHT(@singular_word, 1) = 'h' OR RIGHT(@singular_word, 2) = 'ss'
				SET @plural_word = @singular_word+'e'

			-- Handle regular plurals by adding 's' to the end if not end with ss
			IF RIGHT(@plural_word, 1) != 's'
				SET @plural_word = @plural_word + 's'
       END
	  RETURN @plural_word
		

END
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Umair Ali
-- Create date: 
-- Description:	
-- =============================================
Create FUNCTION [dbo].[Split] (
      @pInputString NVARCHAR(max),
      @pDelimiter   VARCHAR(5)
)

RETURNS @Items TABLE (
      Id NVARCHAR(max)
)

AS
BEGIN

	IF (@pInputString IS NULL OR @pInputString = '')
		RETURN;

      IF (@pDelimiter IS NULL OR @pDelimiter = '')
            SET @pDelimiter = ','

--INSERT INTO @Items VALUES (@Delimiter) -- Diagnostic
--INSERT INTO @Items VALUES (@InputString) -- Diagnostic

      DECLARE @Item           NVARCHAR(max)
      DECLARE @ItemList       NVARCHAR(max)
      DECLARE @DelimIndex     INT

      SET @ItemList = @pInputString
      SET @DelimIndex = CHARINDEX(@pDelimiter, @ItemList, 0)
      WHILE (@DelimIndex != 0)
      BEGIN
            SET @Item = SUBSTRING(@ItemList, 0, @DelimIndex)
            INSERT INTO @Items VALUES (@Item)

            -- Set @ItemList = @ItemList minus one less item
            SET @ItemList = SUBSTRING(@ItemList, @DelimIndex+1, LEN(@ItemList)-@DelimIndex)
            SET @DelimIndex = CHARINDEX(@pDelimiter, @ItemList, 0)
      END -- End WHILE

      IF @Item IS NOT NULL -- At least one delimiter was encountered in @InputString
      BEGIN
            SET @Item = @ItemList
            INSERT INTO @Items VALUES (@Item)
      END

      -- No delimiters were encountered in @InputString, so just return @InputString
      ELSE INSERT INTO @Items VALUES (@pInputString)

      RETURN

END -- End Function



GO
/****** Object:  UserDefinedFunction [dbo].[SplitParameters]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create FUNCTION [dbo].[SplitParameters] (
      @pInputString NVARCHAR(max),
      @pDelimiter   VARCHAR(5),
	  @pValueSeparator   VARCHAR(5)
)

RETURNS @Items TABLE (
	[Name] nvarchar(max),
	[Value] nvarchar(max)
)

AS
BEGIN

	IF (@pInputString IS NULL OR @pInputString = '')
		RETURN;

      IF (@pDelimiter IS NULL OR @pDelimiter = '')
            SET @pDelimiter = '|'

      IF (@pValueSeparator IS NULL OR @pValueSeparator = '')
            SET @pValueSeparator = ','

      DECLARE @Values           NVARCHAR(max)
      DECLARE @ItemList       NVARCHAR(max)
	  DECLARE @KeyValue		  NVARCHAR(max)
      DECLARE @DelimIndex     INT
	  DECLARE @ValueIndex     INT
	  DECLARE @Name nvarchar(max),
			@DataColumn nvarchar(max)

      SET @ItemList = @pInputString
      SET @DelimIndex = CHARINDEX(@pDelimiter, @ItemList, 0)

      WHILE (@DelimIndex != 0) OR LEN(@ItemList) > 0
      BEGIN
		IF @DelimIndex > 0
			BEGIN
				SET @Values = SUBSTRING(@ItemList, 0, @DelimIndex)
			END
		ELSE IF LEN(@ItemList) > 0
			BEGIN
				SET @Values = @ItemList
			END
		ELSE
			BEGIN
				RETURN
			END

			SET @ValueIndex = CHARINDEX(@pValueSeparator, @Values, 0)

			SET @Name	= NULL
			SET @DataColumn = NULL

			IF @ValueIndex > 0
				BEGIN
					SET @Name = SUBSTRING(@Values, 0, @ValueIndex)
				END

			SET @Values = SUBSTRING(@Values, @ValueIndex+1, LEN(@Values)-@ValueIndex)
			SET @ValueIndex = CHARINDEX(@pValueSeparator, @Values, 0)
			
			IF @ValueIndex > 0
				BEGIN
					SET @DataColumn = SUBSTRING(@Values, 0, @ValueIndex)
				END
			ELSE IF LEN(@Values) > 0
				BEGIN
					SET @DataColumn = @Values
				END


            INSERT INTO @Items VALUES (@Name, @DataColumn)

            -- Set @ItemList = @ItemList minus one less item
            SET @ItemList = SUBSTRING(@ItemList, @DelimIndex+1, LEN(@ItemList)-@DelimIndex)

			IF @DelimIndex <= 0
				BEGIN
					SET @ItemList = ''
				END

            SET @DelimIndex = CHARINDEX(@pDelimiter, @ItemList, 0)

			
      END -- End WHILE

     /* IF @Item IS NOT NULL -- At least one delimiter was encountered in @InputString
      BEGIN
            SET @Item = @ItemList
            INSERT INTO @Items VALUES (@Item)
      END

      -- No delimiters were encountered in @InputString, so just return @InputString
      ELSE INSERT INTO @Items VALUES (@pInputString)*/

      RETURN

END -- End Function



---------------------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  UserDefinedFunction [dbo].[UrlEncode]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[UrlEncode](@url NVARCHAR(1024))
RETURNS NVARCHAR(3072)
AS
BEGIN
    DECLARE @count INT, @c NCHAR(1), @i INT, @urlReturn NVARCHAR(3072)
    SET @count = LEN(@url)
    SET @i = 1
    SET @urlReturn = ''    
    WHILE (@i <= @count)
     BEGIN
        SET @c = SUBSTRING(@url, @i, 1)
        IF @c LIKE N'[A-Za-z0-9()''*\-._!~]' COLLATE Latin1_General_BIN ESCAPE N'\' COLLATE Latin1_General_BIN
         BEGIN
            SET @urlReturn = @urlReturn + @c
         END
        ELSE
         BEGIN
            SET @urlReturn = 
                   @urlReturn + 'A' /*'%'
                   + SUBSTRING(sys.fn_varbintohexstr(CAST(@c AS VARBINARY(MAX))),3,2)
                   + ISNULL(NULLIF(SUBSTRING(sys.fn_varbintohexstr(CAST(@c AS VARBINARY(MAX))),5,2), '00'), '')*/
         END
        SET @i = @i +1
     END
    RETURN @urlReturn
END




GO
/****** Object:  Table [dbo].[tblAddressTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddressTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AddressTypeCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[AddressTypeName] [nvarchar](200) NOT NULL,
	[AddressTypeNameUrdu] [nvarchar](200) NULL,
	[AddressTypeDescription] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblAddressTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountries]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountries](
	[Id] [bigint] NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[ISO3] [nchar](10) NULL,
	[NumericCode] [nchar](10) NULL,
	[ISO2] [nchar](10) NULL,
	[PhoneCode] [nvarchar](255) NULL,
	[Capital] [nvarchar](255) NULL,
	[CurrencyCode] [nvarchar](255) NULL,
	[CurrencySymbol] [nvarchar](255) NULL,
	[TLD] [nvarchar](255) NULL,
	[NativeName] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[Subregion] [nvarchar](255) NULL,
	[Timezones] [nvarchar](max) NULL,
	[Translations] [nvarchar](max) NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
	[Emoji] [nvarchar](191) NULL,
	[EmojiUnicode] [nvarchar](191) NULL,
	[WikiDataId] [nvarchar](255) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblCountries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAddresses]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddresses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AddressTypeId] [bigint] NULL,
	[AddressLine1] [nvarchar](256) NOT NULL,
	[AddressLine1Urdu] [nvarchar](256) NULL,
	[AddressLine2] [nvarchar](256) NULL,
	[AddressLine2Urdu] [nvarchar](256) NULL,
	[CountryId] [bigint] NULL,
	[Province] [nvarchar](50) NULL,
	[ProvinceUrdu] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[CityUrdu] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEntityAddresses]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntityAddresses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[EntityTypeId] [bigint] NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[RecordGUID] [uniqueidentifier] NULL,
	[IsDefault] [bit] NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
	[updatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_tblEntityAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_FormattedAddress]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_FormattedAddress]
AS
SELECT 
ea.Id EntityAddressId
,ea.EntityTypeId
,ea.EntityId
,ea.AddressId
,ta.CountryId
,ta.AddressTypeId
,tat.AddressTypeName
,dbo.GetFormatAddress(ta.AddressLine1, ta.AddressLine2, ta.City, ta.ZipCode, ta.Province, tc.CountryName) AS FormattedAddress
FROM dbo.tblEntityAddresses AS ea 
INNER JOIN dbo.tblAddresses AS ta ON ta.Id = ea.AddressId 
INNER JOIN dbo.tblCountries AS tc ON ta.CountryId = tc.Id 
INNER JOIN dbo.tblAddressTypes AS tat ON ta.AddressTypeId = tat.Id
GO
/****** Object:  Table [dbo].[tblEntityDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntityDocuments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EntityTypeId] [bigint] NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblEntityDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocuments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentTypeId] [bigint] NULL,
	[DocumentTitle] [nvarchar](50) NULL,
	[DocumentName] [nvarchar](500) NULL,
	[DocumentExtension] [nvarchar](8) NULL,
	[DocumentPath] [nvarchar](500) NULL,
	[DocumentRevision] [nvarchar](5) NULL,
	[ChangeNumber] [int] NULL,
	[FileType] [nchar](10) NULL,
 CONSTRAINT [PK_tblDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocumentTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentTypeCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[DocumentTypeName] [nvarchar](100) NOT NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__tblDocumentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_EntityDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_EntityDocuments]
AS
SELECT 
ted.Id
,ted.Id EntityDocumentId
,ted.EntityTypeId
,ted.EntityId
,ted.DocumentId
,ted.IsPrimary
,ted.RecordStatus
,td.DocumentName
,td.DocumentPath
,td.DocumentExtension
,td.FileType
,td.DocumentTitle
,td.ChangeNumber
,td.DocumentRevision
,td.DocumentTypeId
,tdt.DocumentTypeName
,CASE WHEN td.DocumentPath IS NOT NULL THEN [dbo].[GetEntityDocumentFullPath](null,ted.EntityTypeId,td.DocumentPath) ELSE '' END DocumentFullPath
FROM dbo.tblEntityDocuments AS ted 
JOIN tblDocuments td ON td.Id = ted.DocumentId
JOIN tblDocumentTypes tdt ON tdt.Id = td.DocumentTypeId
GO
/****** Object:  View [dbo].[v_EntityAddress]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_EntityAddress]
AS
SELECT        ea.Id AS Expr1, ea.Id AS EntityAddressId, ea.EntityTypeId, ea.EntityId, ea.AddressId, ea.IsDefault, ta.CountryId AS Expr2, tc.CountryName, ta.AddressLine1 AS Expr3, ta.AddressLine2 AS Expr4, ta.City AS Expr5, 
                         ta.Province AS Expr6, ta.ZipCode AS Expr7, ta.AddressTypeId AS Expr8, tat.AddressTypeName, dbo.GetFormatAddress(ta.AddressLine1, ta.AddressLine2, ta.City, ta.ZipCode, ta.Province, tc.CountryName) AS FormattedAddress, 
                         ea.RecordStatus, ta.AddressLine1Urdu AS Expr9, ta.AddressLine2Urdu AS Expr10, ta.*, ta.ProvinceUrdu AS Expr11, ta.CityUrdu AS Expr12, tat.AddressTypeNameUrdu
FROM            dbo.tblEntityAddresses AS ea INNER JOIN
                         dbo.tblAddresses AS ta ON ta.Id = ea.AddressId INNER JOIN
                         dbo.tblCountries AS tc ON ta.CountryId = tc.Id INNER JOIN
                         dbo.tblAddressTypes AS tat ON ta.AddressTypeId = tat.Id
GO
/****** Object:  Table [dbo].[tblUserInformation]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserInformation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[CustomUserId] [varchar](7) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ContactId] [bigint] NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
	[IsManulaCreatedUser] [bit] NOT NULL,
	[DefaultTheme] [nvarchar](50) NULL,
	[DefaultLanguage] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUserInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContacts]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContacts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactTypeId] [bigint] NULL,
	[NameStyle] [bit] NULL,
	[NameTitle] [nchar](20) NULL,
	[NameTitleUrdu] [nchar](20) NULL,
	[FirstName] [nvarchar](50) NULL,
	[FirstNameUrdu] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[MiddleNameUrdu] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[LastNameUrdu] [nvarchar](100) NULL,
	[Suffix] [nchar](20) NULL,
	[SuffixUrdu] [nchar](20) NULL,
	[NationalIdNumber] [nvarchar](200) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[EmailPromotion] [bit] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[CellNumber] [nvarchar](50) NULL,
	[FaxNumber] [nvarchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[BirthDay] [int] NULL,
	[BirthMonth] [int] NULL,
	[BirthYear] [int] NULL,
	[MaritalStatus] [nvarchar](50) NULL,
	[MarriageDate] [datetimeoffset](7) NULL,
	[DivorceDate] [datetimeoffset](7) NULL,
	[DivorceReason] [nvarchar](256) NULL,
	[Gender] [nvarchar](20) NULL,
	[CasteId] [bigint] NULL,
	[SubCasteId] [bigint] NULL,
	[AboutContact] [nvarchar](500) NULL,
	[ContactImage] [nvarchar](256) NULL,
	[DivisionId] [bigint] NULL,
 CONSTRAINT [PK_tblContacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContactTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContactTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactTypeCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[ContactTypeName] [nvarchar](200) NOT NULL,
	[ContactTypeNameUrdu] [nvarchar](200) NULL,
	[ContactTypeDescription] [nvarchar](256) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblContactTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](256) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Users]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Users]
AS
SELECT        ANUR.UserId, ANU.Email, ANU.EmailConfirmed, ANU.PhoneNumber, ANU.PhoneNumberConfirmed, ANU.TwoFactorEnabled, ANU.LockoutEndDateUtc, ANU.LockoutEnabled, ANU.AccessFailedCount, ANU.UserName, ANUR.RoleId,
                          ANR.Name AS RoleName, tUI.Id AS UserInformationId, tUI.UserId AS Expr1, tUI.CustomUserId, tUI.CompanyId, tUI.BranchId, tUI.ContactId, tUI.IsManulaCreatedUser, tUI.DefaultTheme, tUI.DefaultLanguage, tUI.RecordStatus, 
                         tUI.CreatedBy, tUI.CreatedDate, tUI.UpdatedBy, tUI.UpdatedDate, tC.ContactTypeId, tC.NameStyle, tC.NameTitle, tC.NameTitleUrdu, tC.FirstName, tC.FirstNameUrdu, tC.MiddleName, tC.MiddleNameUrdu, tC.LastName, 
                         tC.LastNameUrdu, tC.Suffix, tC.SuffixUrdu, tC.NationalIdNumber, tC.EmailAddress, tC.EmailPromotion, tC.PhoneNumber AS Expr2, tC.CellNumber, tC.FaxNumber, tC.BirthDate, tC.BirthDay, tC.BirthMonth, tC.BirthYear, 
                         tC.MaritalStatus, tC.MarriageDate, tC.DivorceDate, tC.DivorceReason, tC.Gender, tC.CasteId, tC.SubCasteId, tC.AboutContact, tC.ContactImage, tC.DivisionId, tCT.ContactTypeCode, tCT.ContactTypeName, 
                         tCT.ContactTypeNameUrdu, tCT.ContactTypeDescription
FROM  dbo.tblUserInformation AS tUI
	INNER JOIN dbo.AspNetUsers AS ANU ON tUI.UserId = ANU.Id 
	INNER JOIN dbo.AspNetUserRoles AS ANUR ON ANU.Id = ANUR.UserId 
	INNER JOIN  dbo.AspNetRoles AS ANR ON ANUR.RoleId = ANR.Id 
	INNER JOIN dbo.tblContacts AS tC ON tC.Id = tUI.ContactId 
	INNER JOIN dbo.tblContactTypes AS tCT ON tCT.Id = tC.ContactTypeId
GO
/****** Object:  UserDefinedFunction [dbo].[ufnLeadingZeros]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ufnLeadingZeros](
    @Value int,
	@Stringlength int=10
) 
RETURNS varchar(100) 
WITH SCHEMABINDING 
AS 
BEGIN
if(@Stringlength>100)
	BEGIN
		SET @Stringlength=100
	END

    DECLARE @ReturnValue varchar(100);

    SET @ReturnValue = CONVERT(varchar(100), @Value);
    SET @ReturnValue = REPLICATE('0', @Stringlength - DATALENGTH(@ReturnValue)) + @ReturnValue;

    RETURN (@ReturnValue);
END;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatabaseLogs]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseLogs](
	[DatabaseLogsID] [int] IDENTITY(1,1) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[DatabaseUser] [sysname] NOT NULL,
	[Event] [sysname] NOT NULL,
	[Schema] [sysname] NULL,
	[Object] [sysname] NULL,
	[TSQL] [nvarchar](max) NOT NULL,
	[XmlEvent] [xml] NOT NULL,
 CONSTRAINT [PK_DatabaseLogs_DatabaseLogsID] PRIMARY KEY NONCLUSTERED 
(
	[DatabaseLogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[ErrorLogsID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NOT NULL,
	[UserName] [sysname] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](126) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_ErrorLogs_ErrorLogsID] PRIMARY KEY CLUSTERED 
(
	[ErrorLogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApplicationAreas]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApplicationAreas](
	[Id] [int] NOT NULL,
	[ApplicationAreaCode] [nvarchar](256) NOT NULL,
	[ApplicationAreaName] [nvarchar](256) NOT NULL,
	[ModuleId] [int] NULL,
	[ParentId] [int] NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_dbo.tbl_Rights_ApplicationAreas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApplicationSupportedLanguages]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApplicationSupportedLanguages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](256) NULL,
	[EnglishName] [nvarchar](256) NULL,
	[NativeName] [nvarchar](512) NULL,
	[CultureName] [nvarchar](50) NULL,
	[IsNeutralCulture] [bit] NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblApplicationSupportedLanguages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAreaRules]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAreaRules](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ApplicationAreaId] [bigint] NOT NULL,
	[AreaRuleCode] [nvarchar](256) NOT NULL,
	[AreaRuleName] [nvarchar](256) NOT NULL,
	[AreaDetails] [nvarchar](512) NOT NULL,
	[NavigationId] [bigint] NULL,
	[MainNavigationId] [bigint] NULL,
	[IsLineBreak] [bit] NULL,
	[PermissionDefinitionId] [bigint] NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tbl_Rights_AreaRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBranches]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBranches](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NULL,
	[BranchCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[BranchName] [nvarchar](255) NULL,
	[BranchLogo] [nvarchar](255) NULL,
	[BranchContact] [nvarchar](50) NULL,
	[BranchContact2] [nvarchar](50) NULL,
	[BranchEmail] [nvarchar](255) NULL,
	[BranchWebsite] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[City] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Province] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[AboutBranch] [nvarchar](500) NULL,
	[ExpiryDate] [datetimeoffset](7) NULL,
	[LicenseInfo] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblBranches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCastes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCastes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CasteCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[CasteName] [nvarchar](200) NOT NULL,
	[CasteNameUrdu] [nvarchar](200) NULL,
	[CasteDescription] [nvarchar](256) NULL,
	[ParentId] [bigint] NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblCasts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](255) NOT NULL,
	[StateProvinceId] [bigint] NOT NULL,
	[StateProvinceCode] [nvarchar](255) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
	[Latitude] [decimal](10, 8) NOT NULL,
	[Longitude] [decimal](11, 8) NOT NULL,
	[WikiDataId] [nvarchar](255) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblCities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommonStatusAndTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommonStatusAndTypes](
	[Id] [bigint] NOT NULL,
	[CompanyTypeId] [bigint] NOT NULL,
	[StatusTypeId] [int] NOT NULL,
	[StatusTypeName] [nvarchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
	[StatusValue] [int] NULL,
	[ParentStatusId] [int] NULL,
	[StatusDescription] [nvarchar](250) NULL,
	[IsRecordActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblCommonStatusAndTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompanies]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompanies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyTypeId] [bigint] NULL,
	[CompanyCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[CompanyName] [nvarchar](255) NULL,
	[CompanyLogo] [nvarchar](255) NULL,
	[CompanyContact] [nvarchar](100) NULL,
	[CompanyContact2] [nvarchar](100) NULL,
	[CompanyEmail] [nvarchar](100) NULL,
	[Website] [nvarchar](256) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[City] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Province] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[AboutCompany] [nvarchar](500) NULL,
	[ExpiryDate] [datetimeoffset](7) NULL,
	[LicenseInfo] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__tblCompanies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompanyTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompanyTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[TypeDescription] [nvarchar](100) NOT NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__tblCompanyTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContactAddresses]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContactAddresses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[ContactId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[RecordGUID] [uniqueidentifier] NULL,
	[IsDefault] [bit] NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
	[updatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_tblContactAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContactDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContactDocuments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[ContactId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblContactDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountries_old]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountries_old](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](150) NOT NULL,
	[PhoneCode] [varchar](16) NULL,
	[CountryAbbreviation] [varchar](5) NULL,
	[ShortName] [varchar](5) NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCurrencies]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCurrencies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[CurrencyCode] [nchar](3) NOT NULL,
	[CurrencyName] [nvarchar](50) NOT NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblCurrencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[MainUserId] [nvarchar](128) NULL,
	[UserId] [nvarchar](128) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ContactId] [bigint] NULL,
	[TerritoryID] [bigint] NULL,
	[CustomerType] [nchar](20) NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblCustomers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDivisions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDivisions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DivisionCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[DivisionName] [nvarchar](255) NULL,
	[DivisionNameUrdu] [nvarchar](255) NULL,
	[DivisionDescription] [nvarchar](max) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ParentId] [bigint] NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblDivisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployees]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployees](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[MainUserId] [nvarchar](128) NULL,
	[UserId] [nvarchar](128) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ContactId] [bigint] NULL,
	[ManagerId] [bigint] NULL,
	[EmployeeType] [nchar](20) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[HiringDate] [datetimeoffset](7) NULL,
	[SalaryType] [tinyint] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
	[TotalAllowedVacations] [smallint] NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblEmployees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEntityTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntityTypes](
	[Id] [bigint] NOT NULL,
	[UniqueGUID] [uniqueidentifier] NULL,
	[TypeName] [nvarchar](256) NOT NULL,
	[TableName] [nvarchar](256) NULL,
	[PrimaryKeyColumn] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblEntityTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelAddresses]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelAddresses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HotelId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[RecordGUID]  AS (newid()),
	[IsDefault] [bit] NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
	[updatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_tblHotelAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelCategories]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelCategories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[CategoryName] [nvarchar](255) NULL,
	[CategoryNameUrdu] [nvarchar](255) NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ParentId] [bigint] NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotelCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelDocuments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[HotelId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotelDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelPolicies]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelPolicies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HotelId] [bigint] NULL,
	[RoomId] [bigint] NULL,
	[PolicyType] [tinyint] NULL,
	[PolicyTypeName] [nvarchar](50) NULL,
	[PolicyDescription] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotelPolicies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelRatings]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelRatings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[HotelId] [bigint] NULL,
	[IPAddress] [nvarchar](50) NULL,
	[Rating] [tinyint] NULL,
	[Comments] [nvarchar](256) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotelRatings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelReservations]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelReservations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReservationCode] [nvarchar](50) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[HotelId] [bigint] NULL,
	[HotelRoomId] [bigint] NULL,
	[CustomerId] [bigint] NULL,
	[BookingDateTime] [datetimeoffset](7) NULL,
	[CheckInDateTime] [datetimeoffset](7) NULL,
	[CheckOutDateTime] [datetimeoffset](7) NULL,
	[ReservationStatusId] [int] NULL,
	[ReservationMadeByStatusId] [int] NULL,
	[PaymentMethodId] [int] NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[TotalDiscount] [decimal](18, 0) NULL,
	[PromotionId] [bigint] NULL,
	[PromotionComments] [nvarchar](256) NULL,
	[TotalAmountPaid] [decimal](18, 0) NULL,
	[EmergencyContactName] [nvarchar](128) NULL,
	[EmergencyContactNumber] [nvarchar](128) NULL,
	[CustomerComments] [nvarchar](256) NULL,
	[HotelComments] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotelReservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelRooms]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelRooms](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoomCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[RoomTypeId] [bigint] NULL,
	[HotelId] [bigint] NULL,
	[RoomNumber] [nchar](10) NULL,
	[RoomName] [nvarchar](256) NOT NULL,
	[MinRoomPrice] [decimal](18, 0) NULL,
	[MaxRoomPrice] [decimal](18, 0) NULL,
	[RoomPrice] [decimal](18, 0) NULL,
	[FirstSlotTime] [decimal](18, 0) NULL,
	[FirstSlotRate] [decimal](18, 0) NULL,
	[SecondSlotTime] [decimal](18, 0) NULL,
	[SecondSlotRate] [decimal](18, 0) NULL,
	[ThirdSlotTime] [decimal](18, 0) NULL,
	[ThirdSlotRate] [decimal](18, 0) NULL,
	[ForthSlotTime] [decimal](18, 0) NULL,
	[ForthSlotRate] [decimal](18, 0) NULL,
	[RoomDescription] [nvarchar](256) NOT NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblRooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelRoomServices]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelRoomServices](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HotelId] [bigint] NULL,
	[RoomId] [bigint] NULL,
	[RoomTypeId] [bigint] NULL,
	[ParentServiceId] [bigint] NULL,
	[RoomServiceName] [nvarchar](256) NOT NULL,
	[RoomServiceDescription] [nvarchar](256) NULL,
	[RoomServiceIcon] [nvarchar](256) NULL,
	[ServicePriority] [int] NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotelRoomServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelRoomTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelRoomTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoomTypeCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[HotelID] [bigint] NULL,
	[RoomTypeName] [nvarchar](256) NOT NULL,
	[RoomTypeDescription] [nvarchar](256) NOT NULL,
	[RoomTypeMinPrice] [decimal](18, 0) NULL,
	[RoomTypeMaxPrice] [decimal](18, 0) NULL,
	[RoomTypePrice] [decimal](18, 0) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotelRoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotels]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotels](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HotelCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[HotelName] [nvarchar](255) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[CityId] [bigint] NULL,
	[CategoryId] [bigint] NULL,
	[AllowRefund] [bit] NULL,
	[LatLong] [nvarchar](100) NULL,
	[HotelDescription] [nvarchar](max) NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblHotels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMainModules]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMainModules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleCode] [nvarchar](256) NOT NULL,
	[ModuleName] [nvarchar](256) NOT NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_dbo.tbl_Rights_MainModules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_ModuleCode_tbl_Rights_MainModules] UNIQUE NONCLUSTERED 
(
	[ModuleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNavigationBreadCrumbs]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNavigationBreadCrumbs](
	[Id] [bigint] NOT NULL,
	[NavigationId] [bigint] NOT NULL,
	[ParentNavigationId] [bigint] NULL,
	[PageName] [nvarchar](250) NOT NULL,
	[Controller] [nvarchar](250) NULL,
	[ControllerAction] [nvarchar](250) NULL,
	[IsLink] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblNavigationBreadCrumbs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNavigations]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNavigations](
	[Id] [bigint] NOT NULL,
	[DisplayOrder] [bigint] NOT NULL,
	[ParentId] [bigint] NULL,
	[MenuTitle] [nvarchar](256) NOT NULL,
	[MenuTitleArabic] [nvarchar](512) NULL,
	[MenuTitleChinese] [nvarchar](512) NULL,
	[MenuTitleFilipino] [nvarchar](512) NULL,
	[MenuTitleFrench] [nvarchar](512) NULL,
	[MenuTitleHindi] [nvarchar](512) NULL,
	[MenuTitlePersian] [nvarchar](512) NULL,
	[MenuTitleRussian] [nvarchar](512) NULL,
	[MenuTitleSpanish] [nvarchar](512) NULL,
	[MenuTitleTurkish] [nvarchar](512) NULL,
	[MenuTitleUrdu] [nvarchar](512) NULL,
	[ApplicationArea] [nvarchar](128) NULL,
	[Area] [nvarchar](128) NULL,
	[Controller] [nvarchar](128) NULL,
	[Action] [nvarchar](128) NULL,
	[MenuIcon] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblNavigations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermissionDefinitions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermissionDefinitions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionCode] [nvarchar](150) NULL,
	[PermissionTitle] [nvarchar](150) NOT NULL,
	[PermissionDescription] [nvarchar](256) NULL,
	[RecordStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductCategories]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductCategories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[CategoryName] [nvarchar](255) NULL,
	[CategoryNameUrdu] [nvarchar](255) NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ParentId] [bigint] NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductDocuments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblProductDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[ProductSerialNumber] [nvarchar](255) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ProductCategoryId] [bigint] NULL,
	[ProductName] [nvarchar](255) NULL,
	[ProductNameUrdu] [nvarchar](255) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[PurchasePrice] [decimal](18, 2) NULL,
	[SalePrice] [decimal](18, 2) NULL,
	[ProductImageURL] [nvarchar](200) NULL,
	[UnitOfMeasurementId] [bigint] NULL,
	[Qty] [decimal](18, 2) NULL,
	[Weight] [decimal](18, 2) NULL,
	[ProductColor] [nvarchar](50) NULL,
	[ProductSize] [nvarchar](50) NULL,
	[IsPurchased] [bit] NULL,
	[PurchaseCount] [bigint] NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[SellStartDate] [datetimeoffset](7) NULL,
	[SellEndDate] [datetimeoffset](7) NULL,
	[DaysToManufacture] [int] NULL,
	[ProoductQuality] [nchar](10) NULL,
	[IsManufactured] [bit] NULL,
	[ManufacturingDate] [datetimeoffset](7) NULL,
	[ExpiryDate] [datetimeoffset](7) NULL,
	[IsProductPart] [bit] NULL,
	[AssetFlag] [nvarchar](100) NULL,
	[Reserve] [nvarchar](100) NULL,
	[ReserveQty] [bigint] NULL,
	[ProductStatus] [nvarchar](50) NULL,
	[SoftwareVersion] [nvarchar](100) NULL,
	[HardwareVersion] [nvarchar](100) NULL,
	[FWVersion] [nvarchar](100) NULL,
	[ProductOrigin] [nvarchar](200) NULL,
	[SupplierWarranty] [nvarchar](100) NULL,
	[WarrantyPeroid] [int] NULL,
	[WarrantyStartDate] [datetime] NULL,
	[IsBoxOpen] [bit] NULL,
	[IPN] [nvarchar](50) NULL,
	[RFID] [nvarchar](100) NULL,
	[InboundDate] [datetime] NULL,
	[SubInventory] [nchar](10) NULL,
	[ParentId] [bigint] NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPromotions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPromotions](
	[Id] [bigint] NULL,
	[PromotionTitle] [nvarchar](255) NULL,
	[PromotionDescription] [nvarchar](500) NULL,
	[DiscountPercent] [decimal](18, 0) NULL,
	[PromotionStartDate] [datetimeoffset](7) NULL,
	[PromotionEndDate] [datetimeoffset](7) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRolesDefaultPermissions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolesDefaultPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[ModulesPermissions] [varchar](max) NOT NULL,
	[ApplicationAreasPermissions] [varchar](max) NULL,
 CONSTRAINT [PK_dbo.tbl_Rights_RolesDefaultPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShipMethods]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShipMethods](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[ShipBaseRate] [money] NOT NULL,
	[ShipRate] [money] NOT NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblShipMethods_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStateProvinces]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStateProvinces](
	[Id] [bigint] NOT NULL,
	[StateProvinceName] [nvarchar](255) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
	[FIPSCode] [nvarchar](255) NULL,
	[ISO2] [nvarchar](255) NULL,
	[RecordType] [nvarchar](191) NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
	[WikiDataId] [nvarchar](255) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblStateProvinces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUnitofMeasurements]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUnitofMeasurements](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UnitCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[UnitName] [nvarchar](200) NULL,
	[UnitNameUrdu] [nvarchar](200) NULL,
	[UnitDescription] [nvarchar](255) NULL,
	[UoMType] [nvarchar](100) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblUnitsofMeasurement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserLoginAttempts]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserLoginAttempts](
	[Id] [nvarchar](64) NOT NULL,
	[UserID] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordHash] [varbinary](256) NULL,
	[RememberMe] [bit] NULL,
	[IsLoginSucceed] [bit] NULL,
	[UserIPAddress] [nvarchar](64) NULL,
	[ReturnUrl] [nvarchar](max) NULL,
	[RequestObject] [text] NULL,
	[AcceptTypes] [nvarchar](max) NULL,
	[AnonymousID] [nvarchar](256) NULL,
	[AppRelativeCurrentExecutionFilePath] [nvarchar](max) NULL,
	[ApplicationPath] [nvarchar](max) NULL,
	[Browser] [nvarchar](max) NULL,
	[ClientCertificate] [nvarchar](max) NULL,
	[ContentEncoding] [nvarchar](max) NULL,
	[ContentLength] [int] NULL,
	[ContentType] [nvarchar](256) NULL,
	[Cookies] [nvarchar](max) NULL,
	[CurrentExecutionFilePath] [nvarchar](max) NULL,
	[CurrentExecutionFilePathExtension] [nvarchar](max) NULL,
	[FilePath] [nvarchar](max) NULL,
	[Files] [nvarchar](max) NULL,
	[Form] [nvarchar](max) NULL,
	[Headers] [nvarchar](max) NULL,
	[HttpChannelBinding] [nvarchar](max) NULL,
	[HttpMethod] [nvarchar](max) NULL,
	[IsAuthenticated] [bit] NULL,
	[IsLocal] [bit] NULL,
	[IsSecureConnection] [bit] NULL,
	[LogonUserIdentity] [nvarchar](max) NULL,
	[Params] [nvarchar](max) NULL,
	[Path] [nvarchar](max) NULL,
	[PathInfo] [nvarchar](max) NULL,
	[PhysicalApplicationPath] [nvarchar](max) NULL,
	[PhysicalPath] [nvarchar](max) NULL,
	[QueryString] [nvarchar](max) NULL,
	[RawUrl] [nvarchar](max) NULL,
	[ReadEntityBodyMode] [nvarchar](256) NULL,
	[RequestType] [nvarchar](max) NULL,
	[ServerVariables] [nvarchar](max) NULL,
	[TimedOutToken] [nvarchar](max) NULL,
	[TlsTokenBindingInfo] [nvarchar](max) NULL,
	[TotalBytes] [int] NULL,
	[Unvalidated] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[UrlReferrer] [nvarchar](max) NULL,
	[UserAgent] [nvarchar](max) NULL,
	[UserHostAddress] [nvarchar](256) NULL,
	[UserHostName] [nvarchar](256) NULL,
	[UserLanguages] [nvarchar](max) NULL,
	[RecCreatedDt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblUserLoginAttempts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserPermissions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[MainUserId] [nvarchar](128) NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[ModulesAssigned] [varchar](max) NOT NULL,
	[RightsAssigned] [varchar](max) NULL,
 CONSTRAINT [PK_dbo.tbl_Rights_UserPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserSessions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserSessions](
	[Id] [nvarchar](256) NOT NULL,
	[SessionID] [nvarchar](256) NOT NULL,
	[WebsiteID] [nvarchar](64) NOT NULL,
	[RecCreatedBy] [nvarchar](256) NULL,
	[RecCreatedDt] [datetimeoffset](7) NULL,
	[RecUpdatedBy] [nvarchar](256) NULL,
	[RecUpdatedDt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblUserSessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[WebsiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserUpdateActivities]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserUpdateActivities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UpdatedUserId] [nvarchar](128) NOT NULL,
	[UpdatedDate] [datetimeoffset](7) NOT NULL,
	[ActionPerformedBy] [nvarchar](256) NOT NULL,
	[ActionPerformed] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_tblUserUpdateActivities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVendors]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVendors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorCode]  AS (right('0000000000'+CONVERT([nvarchar](10),[Id]),(10))) PERSISTED,
	[MainUserId] [nvarchar](128) NULL,
	[UserId] [nvarchar](128) NULL,
	[CompanyId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ContactId] [bigint] NULL,
	[AccountNumber] [nvarchar](25) NULL,
	[VendorType] [nchar](20) NULL,
	[CompanyName] [nvarchar](128) NULL,
	[CreditRating] [tinyint] NULL,
	[PreferredVendorStatus] [tinyint] NULL,
	[PurchasingWebServiceURL] [nvarchar](1024) NULL,
	[UniqueNumber] [nvarchar](50) NULL,
	[RecordStatus] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_tblVendors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblStateProvinces]    Script Date: 7/22/2024 9:51:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_tblStateProvinces] ON [dbo].[tblStateProvinces]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLogs] ADD  CONSTRAINT [DF_ErrorLogs_ErrorTime]  DEFAULT (getdate()) FOR [ErrorTime]
GO
ALTER TABLE [dbo].[tblAreaRules] ADD  CONSTRAINT [DF_tbl_Rights_AreaRules_IsLineBreak]  DEFAULT ((0)) FOR [IsLineBreak]
GO
ALTER TABLE [dbo].[tblContactAddresses] ADD  CONSTRAINT [DF_tblContactAddresses_RecordGUID]  DEFAULT (newid()) FOR [RecordGUID]
GO
ALTER TABLE [dbo].[tblContactTypes] ADD  CONSTRAINT [DF_tblContactTypes_RecordStatus]  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[tblEntityAddresses] ADD  CONSTRAINT [DF_tblEntityAddresses_RecordGUID]  DEFAULT (newid()) FOR [RecordGUID]
GO
ALTER TABLE [dbo].[tblEntityTypes] ADD  CONSTRAINT [DF_tblEntityTypes_UniqueGUID]  DEFAULT (newid()) FOR [UniqueGUID]
GO
ALTER TABLE [dbo].[tblEntityTypes] ADD  CONSTRAINT [DF_tblEntityTypes_RecordStatus]  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[tblEntityTypes] ADD  CONSTRAINT [DF_tblEntityTypes_CreatedBy]  DEFAULT (N'MTIC') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEntityTypes] ADD  CONSTRAINT [DF_tblEntityTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblEntityTypes] ADD  CONSTRAINT [DF_tblEntityTypes_UpdatedBy]  DEFAULT (N'MTIC') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEntityTypes] ADD  CONSTRAINT [DF_tblEntityTypes_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_FirstSlotTime]  DEFAULT ((4)) FOR [FirstSlotTime]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_FirstSlotRate]  DEFAULT ((0)) FOR [FirstSlotRate]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_SecondSlotTime]  DEFAULT ((8)) FOR [SecondSlotTime]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_SecondSlotRate]  DEFAULT ((0)) FOR [SecondSlotRate]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_ThirdSlotTime]  DEFAULT ((12)) FOR [ThirdSlotTime]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_ThirdSlotRate]  DEFAULT ((0)) FOR [ThirdSlotRate]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_ForthSlotTime]  DEFAULT ((16)) FOR [ForthSlotTime]
GO
ALTER TABLE [dbo].[tblHotelRooms] ADD  CONSTRAINT [DF_tblHotelRooms_ForthSlotRate]  DEFAULT ((0)) FOR [ForthSlotRate]
GO
ALTER TABLE [dbo].[tblHotelRoomServices] ADD  CONSTRAINT [DF_tblHotelRoomServices_RecordStatus]  DEFAULT ((1)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[tblShipMethods] ADD  CONSTRAINT [DF_tblShipMethods_ShipBaseRate]  DEFAULT ((0.00)) FOR [ShipBaseRate]
GO
ALTER TABLE [dbo].[tblShipMethods] ADD  CONSTRAINT [DF_tblShipMethods_ShipRate]  DEFAULT ((0.00)) FOR [ShipRate]
GO
ALTER TABLE [dbo].[tblUserInformation] ADD  CONSTRAINT [DF__tblUserIn__IsMan__51EF2864]  DEFAULT ((0)) FOR [IsManulaCreatedUser]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[tblAddresses]  WITH CHECK ADD  CONSTRAINT [FK_tblAddresses_tblAddressTypes] FOREIGN KEY([AddressTypeId])
REFERENCES [dbo].[tblAddressTypes] ([Id])
GO
ALTER TABLE [dbo].[tblAddresses] CHECK CONSTRAINT [FK_tblAddresses_tblAddressTypes]
GO
ALTER TABLE [dbo].[tblBranches]  WITH CHECK ADD  CONSTRAINT [FK_tblBranches_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([Id])
GO
ALTER TABLE [dbo].[tblBranches] CHECK CONSTRAINT [FK_tblBranches_tblCompanies]
GO
ALTER TABLE [dbo].[tblCompanies]  WITH CHECK ADD  CONSTRAINT [FK__tblCompanyTypes__tblCompanies] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[tblCompanyTypes] ([Id])
GO
ALTER TABLE [dbo].[tblCompanies] CHECK CONSTRAINT [FK__tblCompanyTypes__tblCompanies]
GO
ALTER TABLE [dbo].[tblContactDocuments]  WITH CHECK ADD  CONSTRAINT [FK_tblContactDocuments_tblContacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([Id])
GO
ALTER TABLE [dbo].[tblContactDocuments] CHECK CONSTRAINT [FK_tblContactDocuments_tblContacts]
GO
ALTER TABLE [dbo].[tblCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomers_tblContacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([Id])
GO
ALTER TABLE [dbo].[tblCustomers] CHECK CONSTRAINT [FK_tblCustomers_tblContacts]
GO
ALTER TABLE [dbo].[tblDivisions]  WITH CHECK ADD  CONSTRAINT [FK_tblDivisions_tblBranches] FOREIGN KEY([BranchId])
REFERENCES [dbo].[tblBranches] ([Id])
GO
ALTER TABLE [dbo].[tblDivisions] CHECK CONSTRAINT [FK_tblDivisions_tblBranches]
GO
ALTER TABLE [dbo].[tblDivisions]  WITH CHECK ADD  CONSTRAINT [FK_tblDivisions_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([Id])
GO
ALTER TABLE [dbo].[tblDivisions] CHECK CONSTRAINT [FK_tblDivisions_tblCompanies]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblContacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([Id])
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblContacts]
GO
ALTER TABLE [dbo].[tblHotelCategories]  WITH CHECK ADD  CONSTRAINT [FK_tblHotelCategories_tblBranches] FOREIGN KEY([BranchId])
REFERENCES [dbo].[tblBranches] ([Id])
GO
ALTER TABLE [dbo].[tblHotelCategories] CHECK CONSTRAINT [FK_tblHotelCategories_tblBranches]
GO
ALTER TABLE [dbo].[tblHotelCategories]  WITH CHECK ADD  CONSTRAINT [FK_tblHotelCategories_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([Id])
GO
ALTER TABLE [dbo].[tblHotelCategories] CHECK CONSTRAINT [FK_tblHotelCategories_tblCompanies]
GO
ALTER TABLE [dbo].[tblHotelDocuments]  WITH CHECK ADD  CONSTRAINT [FK_tblHotelDocuments_tblHotels] FOREIGN KEY([HotelId])
REFERENCES [dbo].[tblHotels] ([Id])
GO
ALTER TABLE [dbo].[tblHotelDocuments] CHECK CONSTRAINT [FK_tblHotelDocuments_tblHotels]
GO
ALTER TABLE [dbo].[tblHotels]  WITH CHECK ADD  CONSTRAINT [FK_tblHotels_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([Id])
GO
ALTER TABLE [dbo].[tblHotels] CHECK CONSTRAINT [FK_tblHotels_tblCompanies]
GO
ALTER TABLE [dbo].[tblHotels]  WITH CHECK ADD  CONSTRAINT [FK_tblHotels_tblHotelCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tblHotelCategories] ([Id])
GO
ALTER TABLE [dbo].[tblHotels] CHECK CONSTRAINT [FK_tblHotels_tblHotelCategories]
GO
ALTER TABLE [dbo].[tblProductDocuments]  WITH CHECK ADD  CONSTRAINT [FK_tblProductDocuments_tblProducts] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProducts] ([Id])
GO
ALTER TABLE [dbo].[tblProductDocuments] CHECK CONSTRAINT [FK_tblProductDocuments_tblProducts]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_Products_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[tblBranches] ([Id])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_Products_Branch]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_Products_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([Id])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_Products_Company]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[tblProductCategories] ([Id])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_Products_UnitOfMeasurement] FOREIGN KEY([UnitOfMeasurementId])
REFERENCES [dbo].[tblUnitofMeasurements] ([Id])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_Products_UnitOfMeasurement]
GO
ALTER TABLE [dbo].[tblUnitofMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_tblUnitsofMeasurement_tblBranches] FOREIGN KEY([BranchId])
REFERENCES [dbo].[tblBranches] ([Id])
GO
ALTER TABLE [dbo].[tblUnitofMeasurements] CHECK CONSTRAINT [FK_tblUnitsofMeasurement_tblBranches]
GO
ALTER TABLE [dbo].[tblUnitofMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_tblUnitsofMeasurement_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([Id])
GO
ALTER TABLE [dbo].[tblUnitofMeasurements] CHECK CONSTRAINT [FK_tblUnitsofMeasurement_tblCompanies]
GO
ALTER TABLE [dbo].[tblUserInformation]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_tblUserInformation_Id_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblUserInformation] CHECK CONSTRAINT [FK_AspNetUsers_tblUserInformation_Id_UserId]
GO
ALTER TABLE [dbo].[tblUserInformation]  WITH CHECK ADD  CONSTRAINT [FK_tblUserInformation_tblContacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([Id])
GO
ALTER TABLE [dbo].[tblUserInformation] CHECK CONSTRAINT [FK_tblUserInformation_tblContacts]
GO
ALTER TABLE [dbo].[tblVendors]  WITH CHECK ADD  CONSTRAINT [FK_tblVendors_tblContacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([Id])
GO
ALTER TABLE [dbo].[tblVendors] CHECK CONSTRAINT [FK_tblVendors_tblContacts]
GO
ALTER TABLE [dbo].[tblShipMethods]  WITH CHECK ADD  CONSTRAINT [CK_tblShipMethods_ShipBaseRate] CHECK  (([ShipBaseRate]>(0.00)))
GO
ALTER TABLE [dbo].[tblShipMethods] CHECK CONSTRAINT [CK_tblShipMethods_ShipBaseRate]
GO
ALTER TABLE [dbo].[tblShipMethods]  WITH CHECK ADD  CONSTRAINT [CK_tblShipMethods_ShipRate] CHECK  (([ShipRate]>(0.00)))
GO
ALTER TABLE [dbo].[tblShipMethods] CHECK CONSTRAINT [CK_tblShipMethods_ShipRate]
GO
/****** Object:  StoredProcedure [dbo].[usp_0GetAllTablesFromOtherServer]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[usp_0GetAllTablesFromOtherServer]

AS

BEGIN
/*Execute this before executing this procedure*/
--EXEC sp_configure 'show advanced options', 1
--RECONFIGURE

--EXEC sp_configure 'ad hoc distributed queries', 1
--RECONFIGURE
/*END Execute this before executing this procedure*/


IF OBJECT_ID('TableList') IS NOT NULL
	BEGIN
		DROP TABLE [dbo].[TableList]
	END


	SELECT Name TableName, ROW_NUMBER() OVER(ORDER BY Name) As Id Into TableList
		FROM OPENDATASOURCE('SQLOLEDB', 'Data Source=DELL-E6540\MSSQLEXPRESS12;UID=sa;Pwd=123456;').[IIKI_BaseAppDB].sys.tables 


	DECLARE @TableCount int 
	DECLARE @SQL varchar(500)
	DECLARE @TableName varchar(256)

	SELECT @TableCount = COUNT(1) from TableList


		WHILE @TableCount > 0 
		BEGIN

			SELECT Top 1 @TableName = TableName from TableList ORDER BY TableName
			SELECT @SQL = 'Select *  Into '+@TableName+' from OPENDATASOURCE(''SQLOLEDB'', ''Data Source=DELL-E6540\MSSQLEXPRESS12;UID=sa;Pwd=123456;'').[IIKI_BaseAppDB].dbo.' + @TableName
	
			EXEC (@SQL)
	
			DELETE 	TableList WHERE TableName = @TableName
			SELECT @TableCount = COUNT(1) from TableList
	
		END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_1GetBALClass]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_1GetBALClass]( 
@TableName SYSNAME ,
@NameSpace VARCHAR(500)=null,
@ClassName VARCHAR(256)=null,
--check if needs to create only one method
@CreateWholeClass bit =1,
--create methods if these below are true
@GetList bit=1,
@GetById bit=1,
@Create bit=1,
@Update bit=1,
@Delete bit=1,
@AddUpdate bit=1
)
AS
SET NOCOUNT ON;
BEGIN

   
	DECLARE @TableNameSingular nvarchar(256)=null
	SELECT @TableNameSingular = dbo.PluralToSingular(@TableName)
	--Object type used new object / List<Object>
	DECLARE @ClassObjectName nvarchar(256)= CASE WHEN @TableNameSingular LIKE 'tbl%' THEN RIGHT(@TableNameSingular, LEN(@TableNameSingular) - 3) ELSE @TableNameSingular END 

	IF @ClassName IS NULL OR @ClassName=''
		BEGIN
			SET @ClassName = @ClassObjectName+'BAL'
		END
	DECLARE @ClassDefinition nvarchar(500)= ''
	DECLARE @DefaultUsings nvarchar(500)= ''
	IF(@CreateWholeClass=1)
		BEGIN
			SET @ClassDefinition =  CHAR(13)+CHAR(10) +'public class ' + @ClassName + CHAR(13)+CHAR(10) + '{'+  CHAR(13)+CHAR(10) 
			SET @DefaultUsings = CHAR(13)+CHAR(10) +'using System.Collections.Generic;'
									+ CHAR(13)+CHAR(10) +'using IIKI.BaseApp.Business.Objects;'
									+ CHAR(13)+CHAR(10) +'using IIKI.BaseApp.DataAccess;'
									+ CHAR(13)+CHAR(10) +'using System.Linq;'
									+ CHAR(13)+CHAR(10) +'using IIKI.BaseApp.Utils;'
									+ CHAR(13)+CHAR(10) +'using System;'
									+ CHAR(13)+CHAR(10) +''
		END

	IF @CreateWholeClass =1 AND ( @NameSpace IS NULL OR @NameSpace='')
		BEGIN
			SET @NameSpace = CHAR(13)+CHAR(10) + 'namespace IIKI.BaseApp.Business.Methods'+  CHAR(13)+CHAR(10) +'{'
		END
	ELSE IF @CreateWholeClass =1
		BEGIN 
			SET @NameSpace = CHAR(13)+CHAR(10) + 'namespace ' + @NameSpace +  CHAR(13)+CHAR(10) +'{'
		END

	DECLARE @Result VARCHAR(MAX) =null
	

    SELECT @Result =  ''
		+  @DefaultUsings
		+  @NameSpace
		+  @ClassDefinition
        +  CASE WHEN @GetList=1 THEN 
		'public static List<'+@ClassObjectName+'> GetList(string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection") '
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'try'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + @ClassObjectName+' oObj = new '+@ClassObjectName+'();'
		+  CHAR(13)+CHAR(10) + 'Filters Filter = new Filters();'
		+  CHAR(13)+CHAR(10) + 'Filter.AddSqlParameters(() => oObj.OffSet, OffSet);'
		+  CHAR(13)+CHAR(10) + 'Filter.AddSqlParameters(() => oObj.PageSize, PageSize);'
		+  CHAR(13)+CHAR(10) + 'Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);'
		+  CHAR(13)+CHAR(10) + 'Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);'
		+  CHAR(13)+CHAR(10) + 'if (!string.IsNullOrEmpty(SearchString))'
		+  CHAR(13)+CHAR(10) + 'Filter.AddSqlParameters(() => oObj.SearchString, SearchString);'
		+  CHAR(13)+CHAR(10) + 'IRepository<'+@ClassObjectName+'> oRepository = new Repository<'+@ClassObjectName+'>(uow.DataContext);'
		+  CHAR(13)+CHAR(10) + 'return oRepository.LoadSP(Filter);'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + 'catch (Exception ex)'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'throw ex;'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) 
		+  CHAR(13)+CHAR(10) 
		ELSE '' END
		+ CASE WHEN @GetById=1 THEN 
		'public static '+@ClassObjectName+' Get(long Id, string ConnectionStringName = "DefaultConnection") '
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'try'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + @ClassObjectName+' oObj = new '+@ClassObjectName+'();'
		+  CHAR(13)+CHAR(10) + 'Filters Filter = new Filters();'
		+  CHAR(13)+CHAR(10) + 'Filter.AddSqlParameters(() => oObj.Id, Id);'
		+  CHAR(13)+CHAR(10) + 'IRepository<'+@ClassObjectName+'> oRepository = new Repository<'+@ClassObjectName+'>(uow.DataContext);'
		+  CHAR(13)+CHAR(10) + 'var list = oRepository.LoadSP(Filter);'
		+  CHAR(13)+CHAR(10) + 'if (list.Count > 0)'
		+  CHAR(13)+CHAR(10) + 'return list.FirstOrDefault();'
		+  CHAR(13)+CHAR(10) + 'return oObj;'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + 'catch (Exception ex)'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'throw ex;'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) 
		+  CHAR(13)+CHAR(10) 
		ELSE '' END
		+ CASE WHEN @Create=1 THEN 
		   'public static long Add('+@ClassObjectName+' o'+@ClassObjectName+', string ConnectionStringName = "DefaultConnection") '
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'try'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'Filters Filter = new Filters();'
		+  CHAR(13)+CHAR(10) + 'IRepository<'+@ClassObjectName+'> oRepository = new Repository<'+@ClassObjectName+'>(uow.DataContext);'
		+  CHAR(13)+CHAR(10) + 'return oRepository.Insert(o'+@ClassObjectName+');'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + 'catch (Exception ex)'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'throw ex;'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) 
		+  CHAR(13)+CHAR(10)  
		ELSE '' END
		+ CASE WHEN @Update=1 THEN 
		  'public static long Update('+@ClassObjectName+' o'+@ClassObjectName+', string ConnectionStringName = "DefaultConnection") '
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'try'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'Filters Filter = new Filters();'
		+  CHAR(13)+CHAR(10) + 'IRepository<'+@ClassObjectName+'> oRepository = new Repository<'+@ClassObjectName+'>(uow.DataContext);'
		+  CHAR(13)+CHAR(10) + 'Filter.AddParameters(() => o'+@ClassObjectName+'.Id, OperatorsList.Equal, o'+@ClassObjectName+'.Id);'
		+  CHAR(13)+CHAR(10) + 'return oRepository.Update(o'+@ClassObjectName+', Filter);'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + 'catch (Exception ex)'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'throw ex;'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) 
		+  CHAR(13)+CHAR(10)  
		ELSE '' END
		+ CASE WHEN @Delete=1 THEN 
		  'public static long Delete('+@ClassObjectName+' o'+@ClassObjectName+', string ConnectionStringName = "DefaultConnection") '
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'try'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'Filters Filter = new Filters();'
		+  CHAR(13)+CHAR(10) + 'IRepository<'+@ClassObjectName+'> oRepository = new Repository<'+@ClassObjectName+'>(uow.DataContext);'
		+  CHAR(13)+CHAR(10) + 'Filter.AddParameters(() => o'+@ClassObjectName+'.Id, OperatorsList.Equal, o'+@ClassObjectName+'.Id);'
		+  CHAR(13)+CHAR(10) + 'return oRepository.Delete(o'+@ClassObjectName+', Filter);'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + 'catch (Exception ex)'
		+  CHAR(13)+CHAR(10) + '{'
		+  CHAR(13)+CHAR(10) + 'throw ex;'
		+  CHAR(13)+CHAR(10) + '}'
		+  CHAR(13)+CHAR(10) + '}'
		ELSE '' END
		+  CHAR(13)+CHAR(10) +
		+  CHAR(13)+CHAR(10) +
		--END of class and usings
		+  CASE WHEN @CreateWholeClass=1 THEN  CHAR(13)+CHAR(10) + '}' +  CHAR(13)+CHAR(10) + '}' ELSE '' END
		
		

PRINT SUBSTRING(@Result,0,8000)
PRINT SUBSTRING(@Result,8000,8000)
PRINT SUBSTRING(@Result,16000,8000)
PRINT SUBSTRING(@Result,24000,8000)
PRINT SUBSTRING(@Result,32000,8000)
PRINT SUBSTRING(@Result,40000,8000)
PRINT SUBSTRING(@Result,48000,8000)
PRINT SUBSTRING(@Result,56000,8000)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_1GetEntityClass]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_1GetEntityClass]( 
@TableName SYSNAME ,
@NameSpace VARCHAR(500)=null,
@ClassName VARCHAR(256)=null,
@BaseClassName VARCHAR(256)=null,
@IsMultiLingual bit = 0
)
AS
SET NOCOUNT ON;
BEGIN

   
	DECLARE @TableNameSingular nvarchar(256)=null
	SELECT @TableNameSingular = dbo.PluralToSingular(@TableName)
	--Object type used new object / List<Object>
	DECLARE @ClassObjectName nvarchar(256)= CASE WHEN @TableNameSingular LIKE 'tbl%' THEN RIGHT(@TableNameSingular, LEN(@TableNameSingular) - 3) ELSE @TableNameSingular END 
	
	IF @ClassName IS NULL OR @ClassName=''
		BEGIN
			SET @ClassName = @ClassObjectName
		END
	DECLARE @ClassDefinition nvarchar(500)= ''
	DECLARE @DefaultUsings nvarchar(500)= ''

	if(@BaseClassName IS NOT NULL)
		SET @BaseClassName = ' : ' + @BaseClassName
	else
		SET @BaseClassName = ''

	--Class Definition & Tables and Procedure
	SET @ClassDefinition =  CHAR(13)+CHAR(10) +'[DataTable("dbo.'+@TableName+'")]'
		+  CHAR(13)+CHAR(10) +'[StoreProcedure("dbo.usp_Get'+RIGHT(@TableName, LEN(@TableName) - 3)+'")]'
		+  CHAR(13)+CHAR(10) +'public class ' + @ClassName + @BaseClassName + CHAR(13)+CHAR(10) + '{'+  CHAR(13)+CHAR(10) 
	
	
	-- Initialize the default usings with common namespaces
SET @DefaultUsings = CHAR(13) + CHAR(10) + 'using System;'
					+ CHAR(13) + CHAR(10) + 'using System.Data;'
					+ CHAR(13) + CHAR(10) + 'using IIKI.BaseApp.Utils;'

		-- Add multilingual namespace if applicable
		IF (@IsMultiLingual = 1)
		BEGIN
			SET @DefaultUsings = @DefaultUsings + CHAR(13) + CHAR(10) + 'using IIKI.BaseApp.Localization.Resources;'
		END

		-- Add additional namespaces
		SET @DefaultUsings = @DefaultUsings + CHAR(13) + CHAR(10) + 'using System.ComponentModel.DataAnnotations;'
							+ CHAR(13) + CHAR(10);
		
	IF ( @NameSpace IS NULL OR @NameSpace='')
		BEGIN
			SET @NameSpace = CHAR(13)+CHAR(10) + 'namespace IIKI.BaseApp.Business.Objects'+  CHAR(13)+CHAR(10) +'{'
		END
	ELSE 
		BEGIN
			SET @NameSpace = CHAR(13)+CHAR(10) + 'namespace ' + @NameSpace +  CHAR(13)+CHAR(10) +'{'
		END

	DECLARE @ResourceName nvarchar(256) = null
	-- Add multilingual resource name if applicable
	IF (@IsMultiLingual = 1)
	BEGIN
		SET @ResourceName = @ClassObjectName+'Labels'
	END

	DECLARE @Result VARCHAR(MAX) =null
	

    SELECT @Result =  ''
		+  @DefaultUsings
		+  @NameSpace
		+  @ClassDefinition

    SELECT @Result =  @Result +  CHAR(13)+CHAR(10) +
		 --IIF(ColumnName='Id','', --Skip Id column if enherited with baseentity
		 ISNULL(DataAttributes,'') +
        'public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }'+ CHAR(13)+CHAR(10) 
		--)
		
    FROM
    (
        SELECT 
            REPLACE(col.name, ' ', '_') ColumnName,
            column_id ColumnId,
            CASE typ.name 
                WHEN 'bigint' THEN 'long'
                WHEN 'binary' THEN 'byte[]'
                WHEN 'bit' THEN 'bool'
                WHEN 'char' THEN 'string'
                WHEN 'date' THEN 'DateTime'
                WHEN 'datetime' THEN 'DateTime'
                WHEN 'datetime2' THEN 'DateTime'
                WHEN 'datetimeoffset' THEN 'DateTimeOffset'
                WHEN 'smalldatetime' THEN 'DateTime'
                WHEN 'timestamp' THEN 'DateTime'
                WHEN 'time' THEN 'TimeSpan'
                WHEN 'decimal' THEN 'decimal'
                WHEN 'float' THEN 'float'
                WHEN 'image' THEN 'byte[]'
                WHEN 'int' THEN 'int'
                WHEN 'money' THEN 'decimal'
                WHEN 'nchar' THEN 'string'
                WHEN 'ntext' THEN 'string'
                WHEN 'numeric' THEN 'decimal'
                WHEN 'nvarchar' THEN 'string'
                WHEN 'real' THEN 'double'
                WHEN 'smallint' THEN 'short'
                WHEN 'smallmoney' THEN 'decimal'
                WHEN 'text' THEN 'string'
                WHEN 'tinyint' THEN 'byte'
                WHEN 'uniqueidentifier' THEN 'Guid'
                WHEN 'varbinary' THEN 'byte[]'
                WHEN 'varchar' THEN 'string'
                ELSE 'UNKNOWN_' + typ.name
            END ColumnType,
            CASE 
                WHEN col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
                THEN '?' 
                ELSE '' 
            END NullableSign
			,CASE 
				WHEN col.is_computed =1 AND col.name like '%Code'
					THEN '[AutoGeneratedField(Type = DbType.String)]'+ CHAR(13)+CHAR(10) +
						CASE WHEN ISNULL(@ResourceName ,'') !='' 
							THEN '[Display(Name = "RecordCode", Prompt = "RecordCode"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
							ELSE '[Display(Name = "RecordCode", Prompt = "RecordCode"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'+ CHAR(13)+CHAR(10)
						END
					--'[Display(Name = "RecordCode", Prompt = "RecordCode"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
				WHEN col.is_computed =1 AND col.name not like '%Code'
					THEN '[AutoGeneratedField(Type = DbType.String)]' + CHAR(13)+CHAR(10) +
						CASE WHEN ISNULL(@ResourceName ,'') !='' 
							THEN '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
							ELSE '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'+ CHAR(13)+CHAR(10)
						END
					--'[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)
				WHEN typ.name ='nvarchar' OR  typ.name ='varchar' OR  typ.name ='nchar' OR  typ.name ='char' OR  typ.name ='ntext' OR  typ.name ='text'
					THEN	
						CASE 
							WHEN col.name = 'CreatedBy' OR col.name = 'UpdatedBy'
								THEN '[DataField(Type = DbType.String, IsShowOnForm = false)]'+ CHAR(13)+CHAR(10) +
									CASE WHEN ISNULL(@ResourceName ,'') !='' 
										THEN '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
										ELSE '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'+ CHAR(13)+CHAR(10)
									END
								--'[Display(Name = "'+col.name+'", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
							WHEN col.name like '%Description'
								THEN '[DataField(Type = DbType.String)]'+ CHAR(13)+CHAR(10) +
									CASE WHEN ISNULL(@ResourceName ,'') !='' 
										THEN '[Display(Name = "RecordDescription", Prompt = "RecordDescription"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
										ELSE '[Display(Name = "RecordDescription", Prompt = "RecordDescription"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'+ CHAR(13)+CHAR(10)
									END
								--'[Display(Name = "RecordDescription", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)+
								+ CHAR(13)+CHAR(10)+
								CASE WHEN ISNULL(@ResourceName ,'') !='' 
									THEN '[Required(ErrorMessageResourceName = "RecordDescriptionRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
									ELSE '[Required(ErrorMessage = "RecordDescription is Required"/*, AllowEmptyStrings = false*/)]'+ CHAR(13)+CHAR(10)
								END
								--+'[Required(ErrorMessageResourceName = "RecordDescriptionRequired", ErrorMessageResourceType = typeof(CommonLabels))]'+ CHAR(13)+CHAR(10)+
								+ CHAR(13)+CHAR(10)+
								CASE WHEN ISNULL(@ResourceName ,'') !='' 
									THEN '[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+', ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels), MinimumLength = 0)]'+ CHAR(13)+CHAR(10)
									ELSE '[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+',ErrorMessage = "StringMinMaxLength", MinimumLength = 0)]'+ CHAR(13)+CHAR(10)
								END
								--'[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+', ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]'+ CHAR(13)+CHAR(10) 
							WHEN col.name like '%Name'
								THEN '[DataField(Type = DbType.String)]'+ CHAR(13)+CHAR(10) +
									CASE WHEN ISNULL(@ResourceName ,'') !='' 
										THEN '[Display(Name = "RecordName", Prompt = "RecordName"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'
										ELSE '[Display(Name = "RecordName", Prompt = "RecordName"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'
									END
								--'[Display(Name = "RecordName", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)+
								+ CHAR(13)+CHAR(10)+
								CASE WHEN ISNULL(@ResourceName ,'') !='' 
									THEN '[Required(ErrorMessageResourceName = "RecordNameRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
									ELSE '[Required(ErrorMessage = "RecordName is Required"/*, AllowEmptyStrings = false*/)]'+ CHAR(13)+CHAR(10)
								END
								--+'[Required(ErrorMessageResourceName = "RecordNameRequired", ErrorMessageResourceType = typeof(CommonLabels))]'+ CHAR(13)+CHAR(10)+
								+ CHAR(13)+CHAR(10)+
								CASE WHEN ISNULL(@ResourceName ,'') !='' 
									THEN '[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+', ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels), MinimumLength = 0)]'+ CHAR(13)+CHAR(10)
									ELSE '[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+',ErrorMessage = "StringMinMaxLength", MinimumLength = 0)]'+ CHAR(13)+CHAR(10)
								END
								--'[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+', ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]'+ CHAR(13)+CHAR(10) 
							ELSE
								'[DataField(Type = DbType.String)]'+ CHAR(13)+CHAR(10)+
								CASE WHEN ISNULL(@ResourceName ,'') !='' 
									THEN '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'
									ELSE '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'
								END
								--'[Display(Name = "'+col.name+'", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)+
								+ CHAR(13)+CHAR(10)+
								CASE WHEN ISNULL(@ResourceName ,'') !='' 
									THEN '[Required(ErrorMessageResourceName = "'+col.name+'Required"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)
									ELSE '[Required(ErrorMessage = "'+col.name+' is Required"/*, AllowEmptyStrings = false*/)]'+ CHAR(13)+CHAR(10)
								END
								--+'[Required(ErrorMessageResourceName = "'+col.name+'Required", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)+
								+ CHAR(13)+CHAR(10)+
								CASE WHEN ISNULL(@ResourceName ,'') !='' 
									THEN '[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+', ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels), MinimumLength = 0)]'+ CHAR(13)+CHAR(10)
									ELSE '[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+',ErrorMessage = "StringMinMaxLength", MinimumLength = 0)]'+ CHAR(13)+CHAR(10)
								END
								--'[StringLength('+IIF(col.max_length>0,CAST(col.max_length as NVARCHAR(10)),'8000')+', ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]'+ CHAR(13)+CHAR(10) 
						END
				WHEN col.name='RecordStatus'
					THEN '[DataField(Type = DbType.Int32,IsShowOnForm =false)]'+ CHAR(13)+CHAR(10) +
						CASE WHEN ISNULL(@ResourceName ,'') !='' 
							THEN '[Display(Name = "RecordStatus", Prompt = "RecordStatus"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
							ELSE '[Display(Name = "RecordStatus", Prompt = "RecordStatus"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'+ CHAR(13)+CHAR(10)
						END
					--'[Display(Name = "RecordStatus", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10) 
				WHEN col.name = 'CreatedDate' OR col.name = 'UpdatedDate'
					THEN '[DataField(Type = DbType.'+CASE typ.name WHEN 'date' THEN 'DateTime' WHEN 'datetime' THEN 'DateTime' WHEN 'datetime2' THEN 'DateTime' WHEN 'smalldatetime' THEN 'DateTime' WHEN 'timestamp' THEN 'DateTime' WHEN 'datetimeoffset' THEN 'DateTimeOffset' END+', IsShowOnForm = false)]'+ CHAR(13)+CHAR(10) +
						CASE WHEN ISNULL(@ResourceName ,'') !='' 
							THEN '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
							ELSE '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'+ CHAR(13)+CHAR(10)
						END
					--'[Display(Name = "'+col.name+'", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'+ CHAR(13)+CHAR(10)
				--Case For Foreign Keys
				WHEN col.name like '%Id' AND (typ.name ='bigint' OR  typ.name ='int')
					THEN '[DataField(Type = DbType.'+CASE typ.name WHEN 'smallint' THEN 'Int16' WHEN 'int' THEN 'Int32' WHEN 'tinyint' THEN 'Int32' WHEN 'bigint' THEN 'Int64' WHEN 'char' THEN 'String' WHEN 'nchar' THEN 'String' WHEN 'ntext' THEN 'String' WHEN 'text' THEN 'String' WHEN 'nvarchar' THEN 'String' WHEN 'varchar' THEN 'String' WHEN 'bit' THEN 'Boolean' WHEN 'time' THEN 'Time' WHEN 'date' THEN 'DateTime' WHEN 'datetime' THEN 'DateTime' WHEN 'datetime2' THEN 'DateTime' WHEN 'smalldatetime' THEN 'DateTime' WHEN 'timestamp' THEN 'DateTime' WHEN 'datetimeoffset' THEN 'DateTimeOffset' WHEN 'decimal' THEN 'Decimal' WHEN 'money' THEN 'Decimal' WHEN 'numeric' THEN 'Decimal' WHEN 'smallmoney' THEN 'Decimal' WHEN 'float' THEN 'Double' WHEN 'real' THEN 'Double' WHEN 'image' THEN 'Byte' WHEN 'varbinary' THEN 'Byte' WHEN 'binary' THEN 'Binary' WHEN 'uniqueidentifier' THEN 'Guid' ELSE 'UNKNOWN_' + typ.name END+')]'+ CHAR(13)+CHAR(10) +
						CASE WHEN ISNULL(@ResourceName ,'') !='' 
							THEN '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+LEFT(col.name, LEN(col.name) - 2)+'Labels))]'
							ELSE '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'
						END
					--'[Display(Name = "'+col.name+'", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+LEFT(col.name, LEN(col.name) - 2)+'Labels))]'+ CHAR(13)+CHAR(10)+
					+ CHAR(13)+CHAR(10)+
					CASE WHEN ISNULL(@ResourceName ,'') !='' 
						THEN '[Required(ErrorMessageResourceName = "'+col.name+'Required"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+LEFT(col.name, LEN(col.name) - 2)+'Labels))]'+ CHAR(13)+CHAR(10)
						ELSE '[Required(ErrorMessage = "'+col.name+' is Required"/*, AllowEmptyStrings = false*/)]'+ CHAR(13)+CHAR(10)
					END
					--+'[Required(ErrorMessageResourceName = "'+col.name+'Required", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+LEFT(col.name, LEN(col.name) - 2)+'Labels))]'+ CHAR(13)+CHAR(10) 
				ELSE 
					'[DataField(Type = DbType.'+CASE typ.name WHEN 'smallint' THEN 'Int16' WHEN 'int' THEN 'Int32' WHEN 'tinyint' THEN 'Int32' WHEN 'bigint' THEN 'Int64' WHEN 'char' THEN 'String' WHEN 'nchar' THEN 'String' WHEN 'ntext' THEN 'String' WHEN 'text' THEN 'String' WHEN 'nvarchar' THEN 'String' WHEN 'varchar' THEN 'String' WHEN 'bit' THEN 'Boolean' WHEN 'time' THEN 'Time' WHEN 'date' THEN 'DateTime' WHEN 'datetime' THEN 'DateTime' WHEN 'datetime2' THEN 'DateTime' WHEN 'smalldatetime' THEN 'DateTime' WHEN 'timestamp' THEN 'DateTime' WHEN 'datetimeoffset' THEN 'DateTimeOffset' WHEN 'decimal' THEN 'Decimal' WHEN 'money' THEN 'Decimal' WHEN 'numeric' THEN 'Decimal' WHEN 'smallmoney' THEN 'Decimal' WHEN 'float' THEN 'Double' WHEN 'real' THEN 'Double' WHEN 'image' THEN 'Byte' WHEN 'varbinary' THEN 'Byte' WHEN 'binary' THEN 'Binary' WHEN 'uniqueidentifier' THEN 'Guid' ELSE 'UNKNOWN_' + typ.name END+')]'+ CHAR(13)+CHAR(10) +
					CASE WHEN ISNULL(@ResourceName ,'') !='' 
						THEN '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)
						ELSE '[Display(Name = "'+col.name+'", Prompt = "'+col.name+'"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]'+ CHAR(13)+CHAR(10)
					END
					--'[Display(Name = "'+col.name+'", Prompt = ""/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)+
					+ CHAR(13)+CHAR(10)+
					CASE WHEN ISNULL(@ResourceName ,'') !='' 
						THEN '[Required(ErrorMessageResourceName = "'+col.name+'Required"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)
						ELSE '[Required(ErrorMessage = "'+col.name+' is Required"/*, AllowEmptyStrings = false*/)]'+ CHAR(13)+CHAR(10)
					END
					--+'[Required(ErrorMessageResourceName = "'+col.name+'Required", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.'+@ResourceName+'))]'+ CHAR(13)+CHAR(10)

			END DataAttributes
        FROM sys.columns col
            join sys.types typ ON
                col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
        WHERE OBJECT_ID = OBJECT_ID(@TableName)
    ) t
    ORDER BY ColumnId

	--End of class & namespace
    SET @Result = @Result  + CHAR(13)+CHAR(10) + '}' + CHAR(13)+CHAR(10) + '}'

PRINT SUBSTRING(@Result,0,8000)
PRINT SUBSTRING(@Result,8000,8000)
PRINT SUBSTRING(@Result,16000,8000)
PRINT SUBSTRING(@Result,24000,8000)
PRINT SUBSTRING(@Result,32000,8000)
PRINT SUBSTRING(@Result,40000,8000)
PRINT SUBSTRING(@Result,48000,8000)
PRINT SUBSTRING(@Result,56000,8000)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_2CalculateAllTablesMemoryInKBs]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_2CalculateAllTablesMemoryInKBs]

AS
BEGIN
SELECT
  t.Name                                       AS TableName,
  s.Name                                       AS SchemaName,
  p.Rows                                       AS RowCounts,
  SUM(a.total_pages) * 8                       AS TotalSpaceKB,
  SUM(a.used_pages) * 8                        AS UsedSpaceKB,
  (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM
  sys.tables t
  INNER JOIN sys.indexes i ON t.object_id = i.object_id
  INNER JOIN sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id
  INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
  LEFT OUTER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE
  t.Name NOT LIKE 'dt%'
  AND t.is_ms_shipped = 0
  AND i.object_id > 255
GROUP BY
  t.Name, s.Name, p.Rows
ORDER BY
  SUM(a.total_pages) * 8 


END
GO
/****** Object:  StoredProcedure [dbo].[usp_3ResetIndentity]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_3ResetIndentity] 
(
	@tableName sysname
)
AS
BEGIN
DECLARE @query nvarchar(4000) =null
	SET @query=('DECLARE @MaxIDVal BIGINT =0; SELECT @MaxIDVal=MAX(Id) FROM ' + @tableName +'; '+
	' IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = '''+@tableName+''' AND last_value IS NOT NULL  AND last_value>=@MaxIDVal) '+
	+' BEGIN DBCC CHECKIDENT ('+@tableName+',RESEED,@MaxIDVal)  END  ELSE  DBCC CHECKIDENT ('+@tableName+',RESEED,0)')

	EXEC(@query)

END


GO
/****** Object:  StoredProcedure [dbo].[usp_CheckRecordExistsById]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		M Tayyab Iqbal Ch
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_CheckRecordExistsById] 
	-- Add the parameters for the stored procedure here
	@ColumnName nvarchar(256) = null, 
	@TableName nvarchar(256) = null, 
	@EntityTypeId bigint =0, 
	@EntityId nvarchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @count bit, @sql nvarchar(max)

	SELECT @TableName=  CASE WHEN @TableName IS NULL THEN t.TableName ELSE @TableName END, @ColumnName = CASE WHEN @ColumnName IS NULL THEN t.PrimaryKeyColumn ELSE @ColumnName END  From tblEntityTypes t Where t.Id=@EntityTypeId

	IF(ISNULL(@TableName,'') != '')
		BEGIN

			SET @sql = N'SELECT @count = COUNT(1) FROM ' + @TableName + ' Where ' + @ColumnName + '=''' + @EntityId + ''''
			Print @sql
			EXEC sp_executesql 
				@query = @sql , 
				@params = N'@count bit OUTPUT', 
				@count = @count OUTPUT 

			RETURN @count

		END
	ELSE 
		BEGIN
			RAISERROR ('No such table found',16,1)
		END

END



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteNewlyCreatedUser]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteNewlyCreatedUser]
    -- Add the parameters for the stored procedure here
    @UserId nvarchar(256) = NULL
AS
BEGIN
    

    DELETE FROM [dbo].[tblUserInformation] WHERE UserId = @UserId
    DELETE FROM [dbo].[AspNetUserRoles] WHERE UserId = @UserId
    DELETE FROM [dbo].[AspNetUsers] WHERE Id = @UserId

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteVendors]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_DeleteVendors](
	@Id BIGINT =0,
	@ContactId BIGINT =0,
	@UserId NVARCHAR(256) =null
)
AS
BEGIN
BEGIN TRAN T1;  
	SELECT @ContactId=ContactId,@UserId=UserId from tblVendors where Id=@Id
	IF(@ContactId>0)
	BEGIN
		Delete From tblVendors where Id = @Id
		Exec [dbo].[usp_3ResetIndentity] @tableName='tblVendors'
		Delete From tblAddresses where Id in ( SELECT AddressId from tblContactAddresses Where ContactId = @ContactId OR UserId = @UserId)
		Exec [dbo].[usp_3ResetIndentity] @tableName='tblAddresses'
		Delete From tblContactAddresses where Id in (@ContactId)
		Exec [dbo].[usp_3ResetIndentity] @tableName='tblContactAddresses'
		Delete From AspNetUserRoles where UserId = @UserId
		Delete From tblUserInformation where UserId = @UserId
		Exec [dbo].[usp_3ResetIndentity] @tableName='tblUserInformation'
		Delete From tblContacts where Id = @ContactId
		Exec [dbo].[usp_3ResetIndentity] @tableName='tblContacts'
		Delete from tblUserLoginAttempts where UserId = @UserId
		Delete from tblUserSessions where RecCreatedBy = @UserId OR RecUpdatedBy = @UserId
		Delete From AspNetUsers where Id = @UserId
	END 
COMMIT TRAN T1;  
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAddresses]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAddresses] 	(
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) ='SELECT',

	@Id BIGINT =NULL
	)
AS
BEGIN 



	if(ISNULL(@SearchString,'!!!')!='!!!')
		BEGIN
			SET @SearchString='%'+@SearchString+'%'
		END
   ;WITH main AS(
				SELECT Distinct t.[Id]
				,C.CountryName
				,C.ISO3
				,C.ISO2
				,AType.AddressTypeCode
				,AType.AddressTypeDescription
				,AType.AddressTypeName
				,AType.AddressTypeNameUrdu
				  FROM [dbo].[tblAddresses] t
					JOIN [dbo].[tblAddressTypes] AType ON t.AddressTypeId = AType.Id
					JOIN [dbo].[tblCountries] C ON t.CountryId = C.Id
					where (@Id IS NULL OR t.Id=@Id)
				    AND  ( @SearchString IS NULL 
							OR (C.CountryName like @SearchString) 
							OR (t.AddressLine1 like @SearchString) 
							)

		), page_data AS (
				SELECT A.*
				  ,main.CountryName
				  ,main.AddressTypeName
				  ,main.AddressTypeNameUrdu
				  ,M.TotalCount
			  FROM [dbo].[tblAddresses] A
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on A.Id=main.Id
					ORDER BY A.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAddressTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetAddressTypes](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblAddressTypes] t
				Where (@Id IS NULL OR t.Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.AddressTypeCode like @SearchString) 
							OR (t.AddressTypeName like @SearchString) 
							OR (t.AddressTypeDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,M.TotalCount
				  FROM [dbo].[tblAddressTypes] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY AddressTypeName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetApplicationAreas]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetApplicationAreas]
(
	-- Add the parameters for the stored procedure here
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id bigint=null,
	@ParentId BIGINT=NULL
)
as
BEGIN



if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
				  ,MM.ModuleCode
				  ,MM.ModuleName
				  ,PAA.ApplicationAreaCode AS ParentApplicationAreaCode
				  ,PAA.ApplicationAreaName AS ParentApplicationAreaName
			  FROM [dbo].[tblApplicationAreas] t
				LEFT JOIN [dbo].[tblApplicationAreas] PAA ON PAA.Id=t.ParentId
				JOIN [dbo].[tblMainModules] MM ON MM.Id=t.ModuleId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@ParentId IS NULL OR t.ParentId=@ParentId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTPARENTONLY' AND (ISNULL(t.ParentId,0)=0) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTPARENTONLY' THEN 1 ELSE 0 END)
				  AND  ( @SearchString IS NULL 
							OR (t.ApplicationAreaName like @SearchString) 
							OR (t.ApplicationAreaCode like @SearchString) 
							)

		), page_data AS (
			SELECT t.*
				  ,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
				  ,main.ModuleCode
				  ,main.ModuleName
				  ,main.ParentApplicationAreaCode
				  ,main.ParentApplicationAreaName
				  ,M.TotalCount
			  FROM [dbo].[tblApplicationAreas] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY ApplicationAreaName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data


END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetApplicationSupportedLanguages]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetApplicationSupportedLanguages](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id bigint =null,
	@IsNeutralCulture bit =NULL
)
AS
SET NOCOUNT ON;
BEGIN


if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
				FROM [dbo].[tblApplicationSupportedLanguages] t
				WHERE (@Id IS NULL OR Id=@Id)
				  AND (@IsNeutralCulture IS NULL OR Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.DisplayName like @SearchString) 
							OR (t.EnglishName like @SearchString) 
							OR (t.CultureName like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,M.TotalCount
				  FROM [dbo].[tblApplicationSupportedLanguages] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY EnglishName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
  			)

		Select * from page_data PD
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAspNetRoles]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAspNetRoles]
	
AS
BEGIN
		SELECT Id,Name
		  FROM [dbo].[AspNetRoles]
		WHERE Id <> '3f7f083a-f3e7-4d01-87f0-6e0565344094' and Id <> '645ccd49-bc7f-4693-af2e-a4a03b54ba1c'

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAspNetUsers]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetAspNetUsers]
(
	@Id nvarchar(256)=NULL,
	@Email nvarchar(256)=NULL,
	@UserName nvarchar(256)=NULL
)
AS

		SELECT ANU.[Id]
			  ,[Email]
			  ,[EmailConfirmed]
			  ,[PasswordHash]
			  ,[SecurityStamp]
			  ,ANU.[PhoneNumber]
			  ,[PhoneNumberConfirmed]
			  ,[TwoFactorEnabled]
			  ,[LockoutEndDateUtc]
			  ,[LockoutEnabled]
			  ,[AccessFailedCount]
			  ,[UserName]
			  ,[FirstName]
			  ,[LastName]
			  ,UI.[CompanyId]
			  ,UI.[BranchId] 
		  FROM [dbo].[AspNetUsers] ANU
		  JOIN [dbo].[tblUserInformation] UI ON UI.UserId=ANU.Id
		  join [dbo].[tblContacts] C On C.Id=UI.ContactId
		  WHERE (@Id IS NULL OR  ANU.Id=ISNULL(@Id,ANU.Id))
			AND (@Email IS NULL OR Email=ISNULL(@Email,Email))
			AND (@UserName IS NULL OR UserName=ISNULL(@UserName,UserName))


GO
/****** Object:  StoredProcedure [dbo].[usp_GetBranches]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetBranches]
  	@OffSet bigint = 0, 
  	@PageSize bigint = 10,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =null,
	@Command NVARCHAR(100)=NULL,

	@Id BIGINT =NULL,
	@BranchName NVARCHAR(256)=NULL,
	@CompanyId bigint =null
 
 AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

		;WITH main AS(
				SELECT Distinct t.Id
							,t.[CompanyId]
							,TT.CompanyCode
							,TT.CompanyName
							,C.[CountryName]
					FROM [dbo].[tblBranches] t
					JOIN [dbo].[tblCompanies] TT ON TT.Id=t.CompanyId AND (@CompanyId IS NULL OR TT.Id=@CompanyId)
					JOIN  [dbo].tblCountries C ON C.Id=t.CountryId
					Where ( @Id IS NULL OR t.Id=ISNULL(@Id,t.Id))
					AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
					AND  ( @BranchName IS NULL OR t.BranchName=ISNULL(@BranchName,t.BranchName))
					AND  ( @SearchString IS NULL 
							OR (t.BranchCode like @SearchString) 
							OR (t.BranchName like @SearchString) 
							OR (t.AddressLine1 like @SearchString) 
							OR (t.AddressLine2 like @SearchString)
							OR (t.City like @SearchString)
							OR (t.Province like @SearchString)
							OR (t.BranchContact like @SearchString)
							OR (t.BranchContact2 like @SearchString)
							OR (t.BranchEmail like @SearchString)
							OR (t.ZipCode like @SearchString)
							OR (t.BranchWebsite like @SearchString)
							OR (TT.CompanyName like @SearchString)
							)

		), page_data AS (
			SELECT t.[Id]
				  ,t.[CompanyId]
				  ,[BranchCode]
				  ,[BranchName]
				  ,[BranchLogo]
				  ,[BranchContact]
				  ,[BranchContact2]
				  ,[BranchEmail]
				  ,[BranchWebsite]
				  ,[AddressLine1]
				  ,[AddressLine2]
				  ,[City]
				  ,[ZipCode]
				  ,[Province]
				  ,[CountryId]
				  ,[AboutBranch]
				  ,[ExpiryDate]
				  ,[LicenseInfo]
				  ,t.[RecordStatus]
				  ,[CreatedBy]
				  ,[CreatedDate]
				  ,[UpdatedBy]
				  ,[UpdatedDate] 
				  ,main.CompanyCode
				  ,main.CompanyName
				  ,main.CountryName
				  ,M.TotalCount
				FROM [dbo].[tblBranches] t
  					CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id AND t.CompanyId=main.CompanyId
  				ORDER BY
  					CASE WHEN @SortOrder = 'asc' AND @SortColumn BETWEEN 0 AND 5 
						THEN
  							CASE @SortColumn
  								WHEN 0 THEN t.BranchCode
  								WHEN 1 THEN t.BranchName
  								WHEN 2 THEN t.BranchEmail
  								WHEN 3 THEN t.BranchContact
  								WHEN 4 THEN main.CompanyName
  								WHEN 5 THEN t.BranchWebsite
  							END
  					END,
  					CASE WHEN @SortOrder = 'desc' AND @SortColumn BETWEEN 0 AND 5
						THEN
  							CASE @SortColumn 
  								WHEN 0 THEN t.BranchCode
  								WHEN 1 THEN t.BranchName
  								WHEN 2 THEN t.BranchEmail
  								WHEN 3 THEN t.BranchContact
  								WHEN 4 THEN main.CompanyName
  								WHEN 5 THEN t.BranchWebsite
  							END
  					END DESC,
  					CASE WHEN @SortOrder = 'asc' AND @SortColumn = 6
  						THEN t.CreatedDate
  					END,
  					CASE WHEN @SortOrder = 'desc' AND @SortColumn = 6
  						THEN t.CreatedDate
  					END DESC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
  			)


		 Select  [Id]
				,[CompanyId]
				,[BranchCode]
				,[BranchName]
				,[BranchLogo]
				,[BranchContact]
				,[BranchContact2]
				,[BranchEmail]
				,[BranchWebsite]
				,[AddressLine1]
				,[AddressLine2]
				,[City]
				,[ZipCode]
				,[Province]
				,[CountryId]
				,[AboutBranch]
				,[ExpiryDate]
				,LicenseInfo
				,[RecordStatus]
				,[CreatedBy]
				,[CreatedDate]
				,[UpdatedBy]
				,[UpdatedDate] 
				,CompanyCode
				,CompanyName
				,CountryName
				,TotalCount
			from page_data
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCastes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetCastes](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@ParentId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
				  ,PAA.CasteCode AS ParentCasteCode
				  ,PAA.CasteName AS ParentCasteName
				  ,PAA.CasteNameUrdu AS ParentCasteNameUrdu
				  ,PAA.CasteDescription AS ParentCasteDescription
			  FROM  [dbo].[tblCastes] t
				LEFT JOIN [dbo].[tblCastes] PAA ON PAA.Id=t.ParentId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@ParentId IS NULL OR t.ParentId=@ParentId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTPARENTONLY' AND (ISNULL(t.ParentId,0)=0) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTPARENTONLY' THEN 1 ELSE 0 END)
				  AND  ( @SearchString IS NULL 
							OR (t.CasteCode like @SearchString) 
							OR (t.CasteName like @SearchString) 
							OR (t.CasteDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.[Id]
					  ,[CasteCode]
					  ,[CasteName]
					  ,[CasteNameUrdu]
					  ,[CasteDescription]
					  ,ISNULL([ParentId],0) ParentId
					  ,[RecordStatus]
					  ,main.IsParent
					  ,main.ParentCasteCode
					  ,main.ParentCasteName
					  ,main.ParentCasteNameUrdu
					  ,main.ParentCasteDescription
					  ,M.TotalCount
					  ,t.CreatedBy
					  ,t.CreatedDate
					  ,t.UpdatedBy
					  ,t.UpdatedDate
				  FROM  [dbo].[tblCastes] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY CasteName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCities]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCities] 
  	@OffSet bigint = 0, 
  	@PageSize bigint = 10,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =null,
	@Command NVARCHAR(100)=NULL,

	@Id BIGINT =NULL,
	@CityName NVARCHAR(256)=NULL,
	@StateProvinceCode NVARCHAR(256)=NULL
 
 AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
 
		;WITH main AS(
			SELECT Distinct t.Id ,SP.StateProvinceName,C.CountryName
				from  [dbo].[tblCities] t
					JOIN [dbo].[tblStateProvinces] SP ON t.StateProvinceId=SP.Id
					JOIN [dbo].[tblCountries] C ON t.CountryId=C.Id
				Where ( @Id IS NULL OR t.Id=ISNULL(@Id,t.Id))
				AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				AND  ( @CityName IS NULL OR t.[CityName]=@CityName)
				AND  ( @SearchString IS NULL 
						OR (t.[CityName] like @SearchString) 
						OR (t.StateProvinceCode like @SearchString) 
						OR (t.CountryCode like @SearchString) 
						)
			

			), page_data AS (
				SELECT t.*,main.StateProvinceName,main.CountryName , M.TotalCount
					FROM  [dbo].[tblCities] t
  						CROSS APPLY (SELECT count(*) TotalCount from main) M
						JOIN main ON main.Id=t.Id
  					WHERE EXISTS (SELECT 1 FROM main WHERE main.Id = t.Id)
  					ORDER BY
  						CASE WHEN @SortOrder = 'asc' AND @SortColumn BETWEEN 0 AND 3 
							THEN
  								CASE @SortColumn
  									WHEN 0 THEN t.[CityName]
  									WHEN 1 THEN t.StateProvinceCode
  									WHEN 2 THEN t.CountryCode
  									WHEN 3 THEN t.WikiDataId
  								END
  						END,
  						CASE WHEN @SortOrder = 'desc' AND @SortColumn BETWEEN 0 AND 3
							THEN
  								CASE @SortColumn 
  									WHEN 0 THEN t.[CityName]
  									WHEN 1 THEN t.StateProvinceCode
  									WHEN 2 THEN t.CountryCode
  									WHEN 3 THEN t.WikiDataId
  								END
  						END DESC
  						--CASE WHEN @SortOrder = 'asc' AND @SortColumn = 2
  						--	THEN C.RecCreatedDt
  						--END,
  						--CASE WHEN @SortOrder = 'desc' AND @SortColumn = 2
  						--	THEN C.RecCreatedDt
  						--END DESC
  					OFFSET @OffSet ROWS
  					FETCH NEXT @PageSize ROWS ONLY
  				)


				Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCommaSeperatedString]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCommaSeperatedString]
    @tbl sysname ,
    @ColumnName varchar(256),
    @ColumnLength nvarchar(10)='50',
    @WhereClause varchar(256)=null,
	@listStr  VARCHAR(MAX) out
AS
BEGIN
 SET NOCOUNT ON;
	
   DECLARE @SQL NVARCHAR(MAX);

  SET @SQL =  N' SELECT @listStr = COALESCE(@listStr+'','' ,'''') + Convert(nvarchar('+@ColumnLength+'),'+@ColumnName+') FROM ' 
				+@tbl
            +N' '+ Isnull(@WhereClause,'')
			print(@SQL)
			EXECUTE sp_executesql @SQL
							,N' @listStr varchar(max) OUTPUT'
							,@listStr OUTPUT
	
END 

------------------Execution way
--Declare @listStr nvarchar(max)

--EXEC [dbo].[usp_GetCommaSeperatedString] 'tblPermissionDefinitions','Id',10,'Where Id in (1,2)', @listStr OUTPUT
--Select @listStr
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCompanies]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCompanies] 
  	@OffSet bigint = 0, 
  	@PageSize bigint = 10,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =null,
	@Command NVARCHAR(100)=NULL,

	@Id BIGINT =NULL,
	@CompanyName NVARCHAR(256)=NULL
 
 AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
   
		;WITH main AS(
				SELECT Distinct t.Id
							,t.[CompanyTypeId]
							,TT.TypeCode CompanyTypeCode
							,TT.TypeDescription CompanyTypeDescription
							,C.[CountryName]
					FROM [dbo].[tblCompanies] t
					JOIN [dbo].[tblCompanyTypes] TT ON TT.Id=t.CompanyTypeId
					JOIN  [dbo].tblCountries C ON C.Id=t.CountryId
					Where ( @Id IS NULL OR t.Id=ISNULL(@Id,t.Id))
					AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
					AND  ( @CompanyName IS NULL OR t.CompanyName=ISNULL(@CompanyName,t.CompanyName))
					AND  ( @SearchString IS NULL 
							OR (t.CompanyCode like @SearchString) 
							OR (t.CompanyName like @SearchString) 
							OR (t.AddressLine1 like @SearchString) 
							OR (t.AddressLine2 like @SearchString)
							OR (t.City like @SearchString)
							OR (t.Province like @SearchString)
							OR (t.CompanyContact like @SearchString)
							OR (t.CompanyContact2 like @SearchString)
							OR (t.CompanyEmail like @SearchString)
							OR (t.ZipCode like @SearchString)
							OR (t.Website like @SearchString)
							OR (TT.TypeDescription like @SearchString)
							)

		), page_data AS (
			SELECT t.[Id]
				  ,t.[CompanyTypeId]
				  ,[CompanyCode]
				  ,[CompanyName]
				  ,[CompanyLogo]
				  ,[CompanyContact]
				  ,[CompanyContact2]
				  ,[CompanyEmail]
				  ,[Website]
				  ,[AddressLine1]
				  ,[AddressLine2]
				  ,[City]
				  ,[ZipCode]
				  ,[Province]
				  ,[AddressLine1] AS AddressLine1Urdu
				  ,[AddressLine2] AS AddressLine2Urdu
				  ,[City] AS CityUrdu
				  ,[Province] AS ProvinceUrdu
				  ,[CountryId]
				  ,[AboutCompany]
				  ,[ExpiryDate]
				  ,[LicenseInfo]
				  ,t.[RecordStatus]
				  ,[CreatedBy]
				  ,[CreatedDate]
				  ,[UpdatedBy]
				  ,[UpdatedDate] 
				  ,main.CompanyTypeCode
				  ,main.CompanyTypeDescription
				  ,main.CountryName
				  ,M.TotalCount
				FROM [dbo].[tblCompanies] t
  					CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id AND t.CompanyTypeId=main.CompanyTypeId
  				ORDER BY
  					CASE WHEN @SortOrder = 'asc' AND @SortColumn BETWEEN 0 AND 5 
						THEN
  							CASE @SortColumn
  								WHEN 0 THEN t.CompanyCode
  								WHEN 1 THEN t.CompanyName
  								WHEN 2 THEN t.CompanyEmail
  								WHEN 3 THEN t.CompanyContact
  								WHEN 4 THEN main.CompanyTypeDescription
  								WHEN 5 THEN t.Website
  							END
  					END,
  					CASE WHEN @SortOrder = 'desc' AND @SortColumn BETWEEN 0 AND 5
						THEN
  							CASE @SortColumn 
  								WHEN 0 THEN t.CompanyCode
  								WHEN 1 THEN t.CompanyName
  								WHEN 2 THEN t.CompanyEmail
  								WHEN 3 THEN t.CompanyContact
  								WHEN 4 THEN main.CompanyTypeDescription
  								WHEN 5 THEN t.Website
  							END
  					END DESC,
  					CASE WHEN @SortOrder = 'asc' AND @SortColumn = 6
  						THEN t.CreatedDate
  					END,
  					CASE WHEN @SortOrder = 'desc' AND @SortColumn = 6
  						THEN t.CreatedDate
  					END DESC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
  			)


		 Select  [Id]
				,[CompanyTypeId]
				,[CompanyCode]
				,[CompanyName]
				,[CompanyLogo]
				,[CompanyContact]
				,[CompanyContact2]
				,[CompanyEmail]
				,[Website]
				,[AddressLine1]
				,[AddressLine2]
				,[City]
				,[ZipCode]
				,[Province]
				,[CountryId]
				,[AboutCompany]
				,[ExpiryDate]
				,LicenseInfo
				,[RecordStatus]
				,[CreatedBy]
				,[CreatedDate]
				,[UpdatedBy]
				,[UpdatedDate] 
				,CompanyTypeCode
				,CompanyTypeDescription
				,CountryName
				,TotalCount
			from page_data


END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCompanyTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCompanyTypes] 
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,


	@Id BIGINT =NULL
AS
BEGIN



if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblCompanyTypes] t
					Where (@Id IS NULL OR Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.TypeDescription like @SearchString) 
							OR (t.TypeCode like @SearchString) 
							)

		), page_data AS (
			SELECT	t.*
					,M.TotalCount
			  FROM [dbo].[tblCompanyTypes] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY t.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data


END


--EXEC usp_GetCompanyTypes
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContactAddresses]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetContactAddresses] 	(
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) ='SELECT',

	@Id BIGINT =NULL,
	@UserId nvarchar(256) = NULL,
	@ContactId BIGINT = NULL,
	@IsDefault bit=null
	)
AS
BEGIN 



	if(ISNULL(@SearchString,'!!!')!='!!!')
		BEGIN
			SET @SearchString='%'+@SearchString+'%'
		END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,A.[AddressLine1]
				  ,A.[AddressLine1Urdu]
				  ,A.[AddressLine2]
				  ,A.[AddressLine2Urdu]
				  ,A.[Province]
				  ,A.[ProvinceUrdu]
				  ,A.[City]
				  ,A.[CityUrdu]
				  ,A.[ZipCode]
				  ,A.[CountryId]
				,C.CountryName
				,C.ISO3
				,C.ISO2 CountryISO2
				,Co.FirstName		 AS ContactFirstName
				,Co.LastName		 AS ContactLastName
				,Co.FirstNameUrdu	 AS ContactFirstNameUrdu
				,Co.LastNameUrdu	 AS ContactLastNameUrdu
				,ISNULL(Co.[FirstName],'') + ' ' + ISNULL(Co.[MiddleName],'') + ' ' + ISNULL(Co.[LastName],'') ContactFullName
				,ISNULL(Co.[FirstNameUrdu],'') + ' ' + ISNULL(Co.[MiddleNameUrdu],'') + ' ' + ISNULL(Co.[LastNameUrdu],'') ContactFullNameUrdu
				,AType.Id AS AddressTypeId
				,AType.AddressTypeName
				,AType.AddressTypeNameUrdu

				  FROM  [dbo].[tblContactAddresses] t
				  JOIN [dbo].[tblContacts] Co ON Co.Id=t.ContactId AND (@ContactId IS NULL OR  Co.Id = @ContactId) 
				  LEFT JOIN [dbo].[tblUserInformation] Cu ON Cu.ContactId=Co.Id AND (@UserId IS NULL OR  Cu.UserId = @UserId) 
				  JOIN [dbo].[tblAddresses] A ON A.Id=t.AddressId
				  JOIN [dbo].[tblAddressTypes] AType ON Atype.Id=A.AddressTypeId
					JOIN  [dbo].tblCountries C ON A.CountryId = C.Id
					where (@Id IS NULL OR t.Id=@Id)
					AND (@UserId IS NULL OR  t.UserId = @UserId)
					AND (@IsDefault IS NULL OR t.IsDefault=@IsDefault)
				    AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
					AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTDEFAULT' AND (ISNULL(t.IsDefault,0)=1) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTDEFAULT' THEN 1 ELSE 0 END)
				    AND  ( @SearchString IS NULL 
							OR (C.CountryName like @SearchString) 
							OR (A.AddressLine1 like @SearchString) 
							)

		), page_data AS (
				SELECT A.[Id]
				  ,A.[UserId]
				  ,A.[ContactId]
				  ,A.[AddressId]
				  ,main.[AddressLine1]
				  ,main.[AddressLine1Urdu]
				  ,main.[AddressLine2]
				  ,main.[AddressLine2Urdu]
				  ,main.[Province]
				  ,main.[ProvinceUrdu]
				  ,main.[City]
				  ,main.[CityUrdu]
				  ,main.[ZipCode]
				  ,main.[CountryId]
				  ,A.[RecordStatus]
				  ,A.[IsDefault]
				  ,A.CreatedBy
				  ,A.CreatedDate
				  ,A.updatedBy
				  ,A.UpdatedDate
				  ,main.CountryName
				  ,main.ContactFirstName
				  ,main.ContactLastName
				  ,main.ContactFirstNameUrdu
				  ,main.ContactLastNameUrdu
				  ,main.ContactFullName
				  ,main.ContactFullNameUrdu
				  ,main.[AddressTypeId]
				  ,main.AddressTypeName
				  ,main.AddressTypeNameUrdu
				  ,M.TotalCount
			  FROM  [dbo].[tblContactAddresses] A
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on A.Id=main.Id
					ORDER BY A.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContactDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetContactDocuments](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,
	@Id BIGINT =NULL,
	@ContactId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,DT.DocumentTypeName
					  
					  --,C.FirstName
					  --,C.FirstNameUrdu
					  --,C.LastName
					  --,C.LastNameUrdu
					  --,ISNULL(C.[FirstName],'') + ' ' + ISNULL(C.[MiddleName],'') + ' ' + ISNULL(C.[LastName],'') FullName
					  --,ISNULL(C.[FirstNameUrdu],'') + ' ' + ISNULL(C.[MiddleNameUrdu],'') + ' ' + ISNULL(C.[LastNameUrdu],'') FullNameUrdu
						
				  FROM [dbo].[tblContactDocuments] t
					JOIN [dbo].[tblDocuments] D ON D.Id=t.DocumentId
					JOIN [dbo].[tblDocumentTypes] DT ON DT.Id=D.DocumentTypeId
					--JOIN [dbo].[tblContacts] C ON C.Id=t.ContactId
					Where (@Id IS NULL OR t.Id=@Id)
						AND (@ContactId IS NULL OR t.ContactId=@ContactId)
						AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
						AND  ( @SearchString IS NULL 
									OR (D.DocumentPath like @SearchString) 
									OR (D.DocumentExtension like @SearchString) 
									OR (D.DocumentName like @SearchString) 
									OR (D.FileType like @SearchString) 
									)

		), page_data AS (
				SELECT t.*
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,DocumentTypeName

					  --,FirstName
					  --,FirstNameUrdu
					  --,LastName
					  --,LastNameUrdu
					  --,FullName
					  --,FullNameUrdu
					  ,ISNULL(main.DocumentPath,'')+'/'+ISNULL(main.DocumentName,'')+ISNULL(main.DocumentExtension,'') DocumentFullName
					  ,M.TotalCount
				  FROM [dbo].[tblContactDocuments] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY DocumentName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContacts]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetContacts](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@ContactTypeId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id]
					,parentCaste.CasteName
					,parentCaste.CasteNameUrdu
					,subCaste.CasteName AS SubCasteName
					,subCaste.CasteNameUrdu AS SubCasteNameUrdu
					,CT.ContactTypeName
					,CT.ContactTypeNameUrdu
					,D.DivisionName
			  FROM [dbo].[tblContacts] t
				JOIN [dbo].tblCastes parentCaste ON parentCaste.Id=t.CasteId
				Left JOIN [dbo].tblCastes subCaste ON subCaste.Id=t.SubCasteId
				LEFT JOIN [dbo].[tblContactTypes] CT ON CT.Id=t.ContactTypeId
				LEFT JOIN [dbo].[tblDivisions] D ON D.Id=t.DivisionId
				Where (@Id IS NULL OR t.Id=@Id)
				  AND (@ContactTypeId IS NULL OR t.ContactTypeId=@ContactTypeId)
				  AND  ( @SearchString IS NULL 
							OR (t.FirstName like @SearchString) 
							OR (t.LastName like @SearchString) 
							OR (t.CellNumber like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
						,main.CasteName
						,main.CasteNameUrdu
						,main.SubCasteName
						,main.SubCasteNameUrdu
						,main.ContactTypeName
						,main.ContactTypeNameUrdu
						,ISNULL(t.[FirstName],'') + ' ' + ISNULL(t.[MiddleName],'') + ' ' + ISNULL(t.[LastName],'') FullName
						,ISNULL(t.[FirstNameUrdu],'') + ' ' + ISNULL(t.[MiddleNameUrdu],'') + ' ' + ISNULL(t.[LastNameUrdu],'') FullNameUrdu
						,main.DivisionName
						,M.TotalCount
				  FROM [dbo].[tblContacts] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY t.FirstName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetContactTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetContactTypes](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblContactTypes] t
				Where (@Id IS NULL OR t.Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.ContactTypeCode like @SearchString) 
							OR (t.ContactTypeName like @SearchString) 
							OR (t.ContactTypeDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,M.TotalCount
				  FROM [dbo].[tblContactTypes] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY ContactTypeName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END


--EXEC usp_GetContactTypes
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCountries]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCountries] 
  	@OffSet bigint = 0, 
  	@PageSize bigint = 10,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =null,
	@Command NVARCHAR(100)=NULL,

	@Id BIGINT =NULL,
	@CountryName NVARCHAR(256)=NULL,
	@ISO3 NVARCHAR(256)=NULL,
	@ISO2 NVARCHAR(256)=NULL
 
 AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
 
		;WITH main AS(
			SELECT Distinct Id 
				from  [dbo].tblCountries t
				Where ( @Id IS NULL OR t.Id=ISNULL(@Id,t.Id))
				AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				AND  ( @CountryName IS NULL OR t.[CountryName]=@CountryName)
				AND  ( @SearchString IS NULL 
						OR (t.[CountryName] like @SearchString) 
						OR (t.ISO3 like @SearchString) 
						OR (t.ISO2 like @SearchString) 
						OR (t.PhoneCode like @SearchString)
						)
			

			), page_data AS (
				SELECT t.* , M.TotalCount
					FROM  [dbo].tblCountries t
  						CROSS APPLY (SELECT count(*) TotalCount from main) M
  					WHERE EXISTS (SELECT 1 FROM main WHERE main.Id = t.Id)
  					ORDER BY
  						CASE WHEN @SortOrder = 'asc' AND @SortColumn BETWEEN 0 AND 3 
							THEN
  								CASE @SortColumn
  									WHEN 0 THEN t.[CountryName]
  									WHEN 1 THEN t.ISO2
  									WHEN 2 THEN t.ISO3
  									WHEN 3 THEN t.PhoneCode
  								END
  						END,
  						CASE WHEN @SortOrder = 'desc' AND @SortColumn BETWEEN 0 AND 3
							THEN
  								CASE @SortColumn 
  									WHEN 0 THEN t.[CountryName]
  									WHEN 1 THEN t.ISO2
  									WHEN 2 THEN t.ISO3
  									WHEN 3 THEN t.PhoneCode
  								END
  						END DESC
  						--CASE WHEN @SortOrder = 'asc' AND @SortColumn = 2
  						--	THEN C.RecCreatedDt
  						--END,
  						--CASE WHEN @SortOrder = 'desc' AND @SortColumn = 2
  						--	THEN C.RecCreatedDt
  						--END DESC
  					OFFSET @OffSet ROWS
  					FETCH NEXT @PageSize ROWS ONLY
  				)


				Select * from page_data

END

--EXEC usp_GetCountries
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCustomers]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetCustomers](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@CompanyId BIGINT =NULL,
	@BranchId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] CustomerId
				,Caste.CasteName
				,Caste.CasteNameUrdu
				,subCaste.CasteName SubCasteName
				,subCaste.CasteNameUrdu SubCasteNameUrdu
				,CT.ContactTypeName
				,CT.ContactTypeNameUrdu
				,D.DivisionName
				,ANU.UserName LoginUserName
				,ANU.Email LoginEmail
				,ANR.Name RoleName
			  FROM [dbo].[tblCustomers] t
				JOIN [dbo].[tblContacts] C ON C.Id=t.ContactId
				JOIN[dbo].[tblCastes] Caste ON Caste.Id=C.CasteId
				JOIN[dbo].[tblCastes] subCaste ON subCaste.Id=C.SubCasteId
				LEFT JOIN [dbo].[tblContactTypes] CT oN CT.Id=C.ContactTypeId
				LEFT JOIN [dbo].[tblDivisions] D ON D.Id=C.DivisionId
				JOIN [dbo].[AspNetUsers] ANU ON ANU.Id=t.UserId
				JOIN [dbo].[AspNetUserRoles] ANUR ON ANUR.UserId=ANU.Id
				JOIN [dbo].[AspNetRoles] ANR ON ANR.Id=ANUR.RoleId
				Where (@Id IS NULL OR t.Id=@Id)
				  AND (@CompanyId IS NULL OR t.CompanyId=@CompanyId)
				  AND (@BranchId IS NULL OR t.BranchId=@BranchId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.CustomerCode like @SearchString) 
							OR (C.FirstName like @SearchString) 
							OR (C.LastName like @SearchString) 
							OR (C.EmailAddress like @SearchString) 
							OR (C.CellNumber like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
						,C.[NameStyle]
						,C.[NameTitle]
						,C.[NameTitleUrdu]
						,C.[FirstName]
						,C.[FirstNameUrdu]
						,C.[MiddleName]
						,C.[MiddleNameUrdu]
						,C.[LastName]
						,C.[LastNameUrdu]
						,C.[Suffix]
						,C.[SuffixUrdu]
						,C.[NationalIdNumber]
						,C.[EmailAddress]
						,C.[EmailPromotion]
						,C.[PhoneNumber]
						,C.[CellNumber]
						,C.[FaxNumber]
						,C.[BirthDate]
						,C.[BirthDay]
						,C.[BirthMonth]
						,C.[BirthYear]
						,C.[MaritalStatus]
						,C.[Gender]
						,C.[ContactImage]
						,C.[ContactTypeId]
						,C.[CasteId]
						,C.[SubCasteId]
						,C.[AboutContact]
						,C.[DivisionId]
						,main.CasteName
						,main.CasteNameUrdu
						,main.SubCasteName
						,main.SubCasteNameUrdu
						,main.ContactTypeName
						,main.ContactTypeNameUrdu
						,ISNULL(C.[FirstName],'') + ' ' + ISNULL(C.[MiddleName],'') + ' ' + ISNULL(C.[LastName],'') FullName
						,ISNULL(C.[FirstNameUrdu],'') + ' ' + ISNULL(C.[MiddleNameUrdu],'') + ' ' + ISNULL(C.[LastNameUrdu],'') FullNameUrdu
						,main.DivisionName
						,main.LoginEmail
						,main.LoginUserName
						,main.RoleName
						,M.TotalCount
				  FROM [dbo].[tblCustomers] t
						JOIN [dbo].[tblContacts] C ON C.Id=t.ContactId
						LEFT JOIN [dbo].[AspNetUsers] ANU ON ANU.Id=t.UserId
						JOIN [dbo].[AspNetUserRoles] ANUR ON ANUR.UserId=ANU.Id
						JOIN [dbo].[AspNetRoles] ANR ON ANR.Id=ANUR.RoleId
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.CustomerId
					ORDER BY t.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDivisions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_GetDivisions](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@ParentId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
				  ,PAA.DivisionCode AS ParentDivisionCode
				  ,PAA.DivisionName AS ParentDivisionName
				  ,PAA.DivisionNameUrdu AS ParentDivisionNameUrdu
				  ,PAA.DivisionDescription AS ParentDivisionDescription
			  FROM [dbo].[tblDivisions] t
				LEFT JOIN [dbo].[tblDivisions] PAA ON PAA.Id=t.ParentId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@ParentId IS NULL OR t.ParentId=@ParentId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTPARENTONLY' AND (ISNULL(t.ParentId,0)=0) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTPARENTONLY' THEN 1 ELSE 0 END)
				  AND  ( @SearchString IS NULL 
							OR (t.DivisionCode like @SearchString) 
							OR (t.DivisionName like @SearchString) 
							OR (t.DivisionDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.[Id]
					  ,[DivisionCode]
					  ,[DivisionName]
					  ,[DivisionNameUrdu]
					  ,[DivisionDescription]
					  ,ISNULL([ParentId],0) ParentId
					  ,[RecordStatus]
					  ,t.CompanyId
					  ,t.BranchId
					  ,CreatedBy
					  ,CreatedDate
					  ,UpdatedBy
					  ,UpdatedDate
					  ,main.IsParent
					  ,main.ParentDivisionCode
					  ,main.ParentDivisionName
					  ,main.ParentDivisionNameUrdu
					  ,main.ParentDivisionDescription
					  ,M.TotalCount
				  FROM [dbo].[tblDivisions] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY DivisionName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetDocuments](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@DocumentTypeId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
						,DT.DocumentTypeName
				  FROM [dbo].[tblDocuments] t
					JOIN [dbo].[tblDocumentTypes] DT ON DT.Id=t.DocumentTypeId AND (@DocumentTypeId IS NULL OR DT.Id=@DocumentTypeId)
					Where (@Id IS NULL OR t.Id=@Id)
						AND (@Id IS NULL OR t.Id=@Id)
						AND (@DocumentTypeId IS NULL OR t.DocumentTypeId=@DocumentTypeId)
						AND  ( @SearchString IS NULL 
								OR (t.DocumentExtension like @SearchString) 
								OR (t.DocumentName like @SearchString) 
								OR (t.FileType like @SearchString) 
								)

		), page_data AS (
				SELECT t.*
					  ,DocumentTypeName
					  ,M.TotalCount
				  FROM [dbo].[tblDocuments] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY DocumentName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDocumentTypes]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetDocumentTypes] 
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,


	@Id BIGINT =NULL
AS
BEGIN



if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblDocumentTypes] t
					Where (@Id IS NULL OR Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.DocumentTypeName like @SearchString) 
							OR (t.DocumentTypeCode like @SearchString) 
							)

		), page_data AS (
			SELECT	t.*
					,M.TotalCount
			  FROM [dbo].[tblDocumentTypes] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY t.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data


END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmailByUserID]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================


CREATE PROCEDURE [dbo].[usp_GetEmailByUserID] 
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(256) 
	AS
BEGIN

	Select Email, id as UserId from [dbo].[AspNetUsers] where id = @UserId

    -- Insert statements for procedure here
	IF @@ERROR <> 0
		BEGIN
			RETURN
		END	
END




GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployees]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetEmployees](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@CompanyId BIGINT =NULL,
	@BranchId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] EmployeeId
				,Caste.CasteName
				,Caste.CasteNameUrdu
				,subCaste.CasteName SubCasteName
				,subCaste.CasteNameUrdu SubCasteNameUrdu
				,CT.ContactTypeName
				,CT.ContactTypeNameUrdu
				,D.DivisionName
				,ANU.UserName LoginUserName
				,ANU.Email LoginEmail
				,ANR.Name RoleName
			  FROM [dbo].[tblEmployees] t
				JOIN [dbo].[tblContacts] C ON C.Id=t.ContactId
				JOIN[dbo].[tblCastes] Caste ON Caste.Id=C.CasteId
				JOIN[dbo].[tblCastes] subCaste ON subCaste.Id=C.SubCasteId
				LEFT JOIN [dbo].[tblContactTypes] CT oN CT.Id=C.ContactTypeId
				LEFT JOIN [dbo].[tblDivisions] D ON D.Id=C.DivisionId
				JOIN [dbo].[AspNetUsers] ANU ON ANU.Id=t.UserId
				JOIN [dbo].[AspNetUserRoles] ANUR ON ANUR.UserId=ANU.Id
				JOIN [dbo].[AspNetRoles] ANR ON ANR.Id=ANUR.RoleId
				Where (@Id IS NULL OR t.Id=@Id)
				  AND (@CompanyId IS NULL OR t.CompanyId=@CompanyId)
				  AND (@BranchId IS NULL OR t.BranchId=@BranchId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.EmployeeCode like @SearchString) 
							OR (C.FirstName like @SearchString) 
							OR (C.LastName like @SearchString) 
							OR (C.EmailAddress like @SearchString) 
							OR (C.CellNumber like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
						,C.[NameStyle]
						,C.[NameTitle]
						,C.[NameTitleUrdu]
						,C.[FirstName]
						,C.[FirstNameUrdu]
						,C.[MiddleName]
						,C.[MiddleNameUrdu]
						,C.[LastName]
						,C.[LastNameUrdu]
						,C.[Suffix]
						,C.[SuffixUrdu]
						,C.[NationalIdNumber]
						,C.[EmailAddress]
						,C.[EmailPromotion]
						,C.[PhoneNumber]
						,C.[CellNumber]
						,C.[FaxNumber]
						,C.[BirthDate]
						,C.[BirthDay]
						,C.[BirthMonth]
						,C.[BirthYear]
						,C.[MaritalStatus]
						,C.[Gender]
						,C.[ContactImage]
						,C.[ContactTypeId]
						,C.[CasteId]
						,C.[SubCasteId]
						,C.[AboutContact]
						,C.[DivisionId]
						,main.CasteName
						,main.CasteNameUrdu
						,main.SubCasteName
						,main.SubCasteNameUrdu
						,main.ContactTypeName
						,main.ContactTypeNameUrdu
						,ISNULL(C.[FirstName],'') + ' ' + ISNULL(C.[MiddleName],'') + ' ' + ISNULL(C.[LastName],'') FullName
						,ISNULL(C.[FirstNameUrdu],'') + ' ' + ISNULL(C.[MiddleNameUrdu],'') + ' ' + ISNULL(C.[LastNameUrdu],'') FullNameUrdu
						,main.DivisionName
						,main.LoginEmail
						,main.LoginUserName
						,main.RoleName
						,M.TotalCount
				  FROM [dbo].[tblEmployees] t
						JOIN [dbo].[tblContacts] C ON C.Id=t.ContactId
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.EmployeeId
					ORDER BY t.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEntityAddresses]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetEntityAddresses] 	(
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) ='SELECT',
	
	@Id BIGINT =NULL,
	@EntityTypeId BIGINT,
	@EntityId BIGINT =NULL,

	@UserId nvarchar(256) = NULL,
	@IsDefault bit=null
	)
AS
BEGIN 



	if(ISNULL(@SearchString,'!!!')!='!!!')
		BEGIN
			SET @SearchString='%'+@SearchString+'%'
		END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,t.[AddressLine1]
				  ,t.[AddressLine2]
				  ,t.[Province]
				  ,t.[City]
				  ,t.[ZipCode]
				  ,t.[CountryId]
				  ,t.CountryName
				  ,t.AddressTypeId
				  ,t.AddressTypeName
				  ,t.FormattedAddress

				  FROM  [dbo].[v_EntityAddress] t
				 
					where t.EntityTypeId=@EntityTypeId
						AND (@Id IS NULL OR t.Id=@Id)
						AND (@EntityId IS NULL OR t.EntityId=@EntityId)
					AND (@IsDefault IS NULL OR t.IsDefault=@IsDefault)
				    AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
					AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTDEFAULT' AND (ISNULL(t.IsDefault,0)=1) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTDEFAULT' THEN 1 ELSE 0 END)
				    AND  ( @SearchString IS NULL 
							OR (t.CountryName like @SearchString) 
							OR (t.AddressLine1 like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
				  ,main.[AddressLine1]
				  ,main.[AddressLine2]
				  ,main.[Province]
				  ,main.[City]
				  ,main.[ZipCode]
				  ,main.[CountryId]
				  ,main.CountryName
				  ,main.[AddressTypeId]
				  ,main.AddressTypeName
				  ,M.TotalCount
				  ,main.FormattedAddress
			  FROM  [dbo].[tblEntityAddresses] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY t.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEntityAddresses_Old]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
create PROCEDURE [dbo].[usp_GetEntityAddresses_Old] 	(
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) ='SELECT',
	
	@EntityTypeId BIGINT,
	@Id BIGINT =NULL,
	@UserId nvarchar(256) = NULL,
	@EntityId BIGINT = NULL,
	@IsDefault bit=null
	)
AS
BEGIN 



	if(ISNULL(@SearchString,'!!!')!='!!!')
		BEGIN
			SET @SearchString='%'+@SearchString+'%'
		END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,A.[AddressLine1]
				  ,A.[AddressLine1Urdu]
				  ,A.[AddressLine2]
				  ,A.[AddressLine2Urdu]
				  ,A.[Province]
				  ,A.[ProvinceUrdu]
				  ,A.[City]
				  ,A.[CityUrdu]
				  ,A.[ZipCode]
				  ,A.[CountryId]
				,C.CountryName
				,C.ISO3
				,C.ISO2 CountryISO2
				,Co.FirstName		 AS ContactFirstName
				,Co.LastName		 AS ContactLastName
				,Co.FirstNameUrdu	 AS ContactFirstNameUrdu
				,Co.LastNameUrdu	 AS ContactLastNameUrdu
				,ISNULL(Co.[FirstName],'') + ' ' + ISNULL(Co.[MiddleName],'') + ' ' + ISNULL(Co.[LastName],'') ContactFullName
				,ISNULL(Co.[FirstNameUrdu],'') + ' ' + ISNULL(Co.[MiddleNameUrdu],'') + ' ' + ISNULL(Co.[LastNameUrdu],'') ContactFullNameUrdu
				,AType.Id AS AddressTypeId
				,AType.AddressTypeName
				,AType.AddressTypeNameUrdu

				  FROM  [dbo].[tblEntityAddresses] t
				  JOIN [dbo].[tblCompanies] Com ON (Com.Id=t.EntityId AND (@EntityId IS NULL OR  Com.Id = @EntityId)  AND t.EntityTypeId=1)
				  JOIN [dbo].[tblContacts] Co ON (Co.Id=t.EntityId AND (@EntityId IS NULL OR  Co.Id = @EntityId)  AND t.EntityTypeId=3)
				  JOIN [dbo].[tblAddresses] A ON A.Id=t.AddressId
				  JOIN [dbo].[tblAddressTypes] AType ON Atype.Id=A.AddressTypeId
					JOIN  [dbo].tblCountries C ON A.CountryId = C.Id
					where t.EntityTypeId=@EntityTypeId
						AND (@Id IS NULL OR t.Id=@Id)
						AND (@EntityId IS NULL OR t.EntityId=@EntityId)
					AND (@UserId IS NULL OR  t.UserId = @UserId)
					AND (@IsDefault IS NULL OR t.IsDefault=@IsDefault)
				    AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
					AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTDEFAULT' AND (ISNULL(t.IsDefault,0)=1) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTDEFAULT' THEN 1 ELSE 0 END)
				    AND  ( @SearchString IS NULL 
							OR (C.CountryName like @SearchString) 
							OR (A.AddressLine1 like @SearchString) 
							)

		), page_data AS (
				SELECT A.[Id]
				  ,A.[UserId]
				  ,A.[EntityTypeId]
				  ,A.[EntityId]
				  ,A.[AddressId]
				  ,main.[AddressLine1]
				  ,main.[AddressLine1Urdu]
				  ,main.[AddressLine2]
				  ,main.[AddressLine2Urdu]
				  ,main.[Province]
				  ,main.[ProvinceUrdu]
				  ,main.[City]
				  ,main.[CityUrdu]
				  ,main.[ZipCode]
				  ,main.[CountryId]
				  ,A.[RecordStatus]
				  ,A.[IsDefault]
				  ,A.CreatedBy
				  ,A.CreatedDate
				  ,A.updatedBy
				  ,A.UpdatedDate
				  ,main.CountryName
				  ,main.ContactFirstName
				  ,main.ContactLastName
				  ,main.ContactFirstNameUrdu
				  ,main.ContactLastNameUrdu
				  ,main.ContactFullName
				  ,main.ContactFullNameUrdu
				  ,main.[AddressTypeId]
				  ,main.AddressTypeName
				  ,main.AddressTypeNameUrdu
				  ,M.TotalCount
			  FROM  [dbo].[tblEntityAddresses] A
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on A.Id=main.Id
					ORDER BY A.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEntityDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetEntityDocuments](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,
	@Id BIGINT =NULL,
	@EntityTypeId BIGINT,
	@EntityId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,t.DocumentTypeName
					  ,t.DocumentFullPath
					  
					  --,C.FirstName
					  --,C.FirstNameUrdu
					  --,C.LastName
					  --,C.LastNameUrdu
					  --,ISNULL(C.[FirstName],'') + ' ' + ISNULL(C.[MiddleName],'') + ' ' + ISNULL(C.[LastName],'') FullName
					  --,ISNULL(C.[FirstNameUrdu],'') + ' ' + ISNULL(C.[MiddleNameUrdu],'') + ' ' + ISNULL(C.[LastNameUrdu],'') FullNameUrdu
						
				  FROM [dbo].[v_EntityDocuments] t
					--JOIN [dbo].[tblDocuments] D ON D.Id=t.DocumentId
					--JOIN [dbo].[tblDocumentTypes] DT ON DT.Id=D.DocumentTypeId
					--JOIN [dbo].[tblEntitys] C ON C.Id=t.EntityId
					Where t.EntityTypeId=@EntityTypeId
						AND (@Id IS NULL OR t.Id=@Id)
						AND (@EntityId IS NULL OR t.EntityId=@EntityId)
						AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
						AND  ( @SearchString IS NULL 
									OR (t.DocumentFullPath like @SearchString)
									OR (t.FileType like @SearchString) 
									)

		), page_data AS (
				SELECT t.*
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,DocumentTypeName

					  --,FirstName
					  --,FirstNameUrdu
					  --,LastName
					  --,LastNameUrdu
					  --,FullName
					  --,FullNameUrdu
					  --,ISNULL(main.DocumentPath,'')+'/'+ISNULL(main.DocumentName,'')+ISNULL(main.DocumentExtension,'') DocumentFullName
					  ,DocumentFullPath
					  ,M.TotalCount
				  FROM [dbo].[tblEntityDocuments] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY DocumentName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelCategories]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetHotelCategories](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@ParentId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
				  ,PAA.CategoryCode AS ParentCategoryCode
				  ,PAA.CategoryName AS ParentCategoryName
				  ,PAA.CategoryNameUrdu AS ParentCategoryNameUrdu
				  ,PAA.CategoryDescription AS ParentCategoryDescription
			  FROM [dbo].[tblHotelCategories] t
				LEFT JOIN [tblHotelCategories] PAA ON PAA.Id=t.ParentId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@ParentId IS NULL OR t.ParentId=@ParentId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTPARENTONLY' AND (ISNULL(t.ParentId,0)=0) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTPARENTONLY' THEN 1 ELSE 0 END)
				  AND  ( @SearchString IS NULL 
							OR (t.CategoryCode like @SearchString) 
							OR (t.CategoryName like @SearchString) 
							OR (t.CategoryDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.[Id]
					  ,[CategoryCode]
					  ,[CategoryName]
					  ,[CategoryNameUrdu]
					  ,[CategoryDescription]
					  ,ISNULL([ParentId],0) ParentId
					  ,t.CompanyId
					  ,t.BranchId
					  ,[RecordStatus]
					  ,CreatedBy
					  ,CreatedDate
					  ,UpdatedBy
					  ,UpdatedDate
					  ,main.IsParent
					  ,main.ParentCategoryCode
					  ,main.ParentCategoryName
					  ,main.ParentCategoryNameUrdu
					  ,main.ParentCategoryDescription
					  ,M.TotalCount
				  FROM [dbo].[tblHotelCategories] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY CategoryName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetHotelDocuments](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,
	@Id BIGINT =NULL,
	@HotelId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,DT.DocumentTypeName
					  
					  --,C.FirstName
					  --,C.FirstNameUrdu
					  --,C.LastName
					  --,C.LastNameUrdu
					  --,ISNULL(C.[FirstName],'') + ' ' + ISNULL(C.[MiddleName],'') + ' ' + ISNULL(C.[LastName],'') FullName
					  --,ISNULL(C.[FirstNameUrdu],'') + ' ' + ISNULL(C.[MiddleNameUrdu],'') + ' ' + ISNULL(C.[LastNameUrdu],'') FullNameUrdu
						
				  FROM [dbo].[tblHotelDocuments] t
					JOIN [dbo].[tblDocuments] D ON D.Id=t.DocumentId
					JOIN [dbo].[tblDocumentTypes] DT ON DT.Id=D.DocumentTypeId
					--JOIN [dbo].[tblHotels] C ON C.Id=t.HotelId
					Where (@Id IS NULL OR t.Id=@Id)
						AND (@HotelId IS NULL OR t.HotelId=@HotelId)
						AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
						AND  ( @SearchString IS NULL 
									OR (D.DocumentPath like @SearchString) 
									OR (D.DocumentExtension like @SearchString) 
									OR (D.DocumentName like @SearchString) 
									OR (D.FileType like @SearchString) 
									)

		), page_data AS (
				SELECT t.*
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,DocumentTypeName

					  --,FirstName
					  --,FirstNameUrdu
					  --,LastName
					  --,LastNameUrdu
					  --,FullName
					  --,FullNameUrdu
					  ,ISNULL(main.DocumentPath,'')+'/'+ISNULL(main.DocumentName,'')+ISNULL(main.DocumentExtension,'') DocumentFullName
					  ,M.TotalCount
				  FROM [dbo].[tblHotelDocuments] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY DocumentName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelPolicies]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_GetHotelPolicies](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@HotelId bigint = 0,
	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblHotelPolicies] t
				Where (@Id IS NULL OR t.Id=@Id)
				AND (@HotelId IS NULL OR t.HotelId=@HotelId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.PolicyTypeName like @SearchString) 
							OR (t.PolicyDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,M.TotalCount
				  FROM [dbo].[tblHotelPolicies] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelReservations]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_GetHotelReservations](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@CustomerId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,tCO.FirstName AS CustomerFirstName
				  ,tCO.LastName AS CustomerLastName
				  ,tCO.EmailAddress AS CustomerEmailAddress
				  ,tCO.CellNumber AS CustomerCellNumber
				  ,tH.HotelName
				  ,[dbo].[GetEntityAddress]('tblHotels',tH.Id,3)  AS HotelFullAddress
				  ,[dbo].[GetCommonStatusAndTypes](6,null,null,null)  AS ReservationStatusJson
				  ,[dbo].[GetCommonStatusAndTypes](6,null,t.ReservationStatusId,null)  AS ReservationStatusDescription
				  ,[dbo].[GetCommonStatusAndTypes](8,null,null,null)  AS ReservationMadeByJson
				  ,[dbo].[GetCommonStatusAndTypes](8,null,t.ReservationMadeByStatusId,null)  AS ReservationMadeByDescription
				  ,[dbo].[GetCommonStatusAndTypes](7,null,null,null)  AS PaymentMethodJson
				  ,[dbo].[GetCommonStatusAndTypes](8,null,t.PaymentMethodId,null)  AS PaymentMethodDescription
			  FROM [dbo].[tblHotelReservations] t
				JOIN tblCustomers tC ON tC.Id=t.CustomerId
				JOIN tblContacts tCO ON tCO.Id=tc.ContactId
				JOIN tblHotels tH ON tH.Id=t.HotelId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@CustomerId IS NULL OR t.CustomerId=@CustomerId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (tCO.FirstName like @SearchString) 
							OR (tCO.LastName like @SearchString) 
							OR (tCO.EmailAddress like @SearchString) 
							OR (tCO.CellNumber like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,main.CustomerFirstName
					  ,main.CustomerLastName
					  ,main.CustomerEmailAddress
					  ,main.CustomerCellNumber
					  ,main.HotelName
					  ,main.HotelFullAddress
					  ,main.ReservationStatusDescription
					  ,main.ReservationStatusJson
					  ,main.ReservationMadeByDescription
					  ,main.ReservationMadeByJson
					  ,main.PaymentMethodDescription
					  ,main.PaymentMethodJson
					  ,M.TotalCount
				  FROM [dbo].[tblHotelReservations] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY BookingDateTime DESC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelRooms]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetHotelRooms](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@HotelId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,tH.HotelName
				  ,thd.DocumentFullPath
				  ,fa.FormattedAddress HotelFullAddress
			  FROM [dbo].[tblHotelRooms] t
				LEFT JOIN [tblHotels] tH ON tH.Id=t.HotelId
				LEFT JOIN v_EntityDocuments thd ON th.Id=thd.EntityId AND thd.EntityTypeId=[dbo].[GetEntityTypeId]('tblHotelRooms') AND thd.IsPrimary=1
				LEFT JOIN v_FormattedAddress fa ON fa.EntityId = th.Id AND fa.EntityTypeId=[dbo].[GetEntityTypeId]('tblHotels')
				
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@HotelId IS NULL OR t.HotelId=@HotelId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (tH.HotelName like @SearchString) 
							OR (t.RoomName like @SearchString) 
							OR (t.RoomDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,main.HotelName
					  ,main.HotelFullAddress
					  ,main.DocumentFullPath AS ImagePath
					  ,M.TotalCount
				  FROM [dbo].[tblHotelRooms] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY RoomName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelRoomServices]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetHotelRoomServices](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@HotelId bigint = NULL,
	@RoomId bigint = NULL,
	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblHotelRoomServices] t
				Where (@Id IS NULL OR t.Id=@Id)
				AND (@HotelId IS NULL OR t.HotelId=@HotelId)
				AND (@RoomId IS NULL OR t.RoomId=@RoomId)
				  --AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.RoomServiceName like @SearchString) 
							OR (t.RoomServiceDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,M.TotalCount
				  FROM [dbo].[tblHotelRoomServices] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotels]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetHotels](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				,thd.DocumentFullPath
				,fa.FormattedAddress HotelFullAddress
			  FROM [dbo].[tblHotels] t
			  LEFT JOIN v_EntityDocuments thd ON t.Id=thd.EntityId AND thd.EntityTypeId=[dbo].[GetEntityTypeId]('tblHotels') AND thd.IsPrimary=1
			  LEFT JOIN v_FormattedAddress fa ON fa.EntityId = t.Id AND fa.EntityTypeId=[dbo].[GetEntityTypeId]('tblHotels')
				Where (@Id IS NULL OR t.Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (CONCAT(t.HotelName,t.HotelCode,t.HotelDescription) like @SearchString) 
							OR (fa.FormattedAddress like @SearchString) 
							--OR (t.HotelCode like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,main.DocumentFullPath AS ImagePath
					  ,main.HotelFullAddress
					  ,M.TotalCount
					  ,dbo.GetHotelAverageRating(t.Id) AverageRating
					  ,thr.RoomPrice
					  ,thr.FirstSlotRate
					  ,thr.FirstSlotTime
					  ,thr.SecondSlotRate
					  ,thr.SecondSlotTime
					  ,thr.ThirdSlotRate
					  ,thr.ThirdSlotTime
					  ,thr.ForthSlotRate
					  ,thr.ForthSlotTime
				  FROM [dbo].[tblHotels] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					JOIN tblHotelRooms thr ON t.Id = thr.HotelId
					JOIN (SELECT  HotelId, MIN(FirstSlotRate) AS FirstSlotRate FROM tblHotelRooms GROUP BY HotelId) minPrices ON thr.HotelId = minPrices.HotelId AND thr.FirstSlotRate = minPrices.FirstSlotRate


					ORDER BY HotelName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelWithDependents]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetHotelWithDependents](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				,thd.DocumentFullPath
				,fa.FormattedAddress HotelFullAddress
			  FROM [dbo].[tblHotels] t
			  LEFT JOIN v_EntityDocuments thd ON t.Id=thd.EntityId AND thd.EntityTypeId=[dbo].[GetEntityTypeId]('tblHotels') AND thd.IsPrimary=1
			  LEFT JOIN v_FormattedAddress fa ON fa.EntityId = t.Id AND fa.EntityTypeId=[dbo].[GetEntityTypeId]('tblHotels')
				Where (@Id IS NULL OR t.Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (CONCAT(t.HotelName,t.HotelCode,t.HotelDescription) like @SearchString) 
							OR (fa.FormattedAddress like @SearchString) 
							--OR (t.HotelCode like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,main.DocumentFullPath AS ImagePath
					  ,main.HotelFullAddress
					  ,M.TotalCount
					  ,dbo.GetHotelAverageRating(t.Id) AverageRating
					  ,hrs.Id HotelRoomServiceId
					  ,hrs.RoomServiceName
					  ,hrs.RoomServiceIcon
				  FROM [dbo].[tblHotels] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					Left JOIN tblHotelRoomServices hrs on hrs.HotelId=t.Id
					ORDER BY HotelName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetLoginUser]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetLoginUser] 
	-- Add the parameters for the stored procedure here
	@LoginAttemptId nvarchar(64) = NULL,
	@UserId nvarchar(256)=null,
	@Email nvarchar(256) = NULL, 
	@PasswordHash nvarchar(256) = NULL, 
	@RememberMe bit = NULL,
	@UserIPAddress nvarchar(64) =NULL,
	@ReturnUrl nvarchar(max) = NULL, 
	@RequestObject text = NULL,
	@AcceptTypes  nvarchar(max) = NULL, 
	@AnonymousID nvarchar(256) = NULL, 
	@AppRelativeCurrentExecutionFilePath nvarchar(max) = NULL, 
	@ApplicationPath nvarchar(max) = NULL, 
	@Browser nvarchar(max) = NULL, 
	@ClientCertificate nvarchar(max) = NULL, 
	@ContentEncoding nvarchar(max) = NULL, 
	@ContentLength int = NULL, 
	@ContentType nvarchar(256) = NULL, 
	@Cookies nvarchar(max) = NULL, 
	@CurrentExecutionFilePath nvarchar(max) = NULL, 
	@CurrentExecutionFilePathExtension nvarchar(max) = NULL, 
	@FilePath nvarchar(max) = NULL, 
	@Files nvarchar(max) = NULL, 
	@Form nvarchar(max) = NULL, 
	@Headers nvarchar(max) = NULL, 
	@HttpChannelBinding nvarchar(max) = NULL, 
	@HttpMethod nvarchar(max) = NULL, 
	@IsAuthenticated bit = NULL, 
	@IsLocal bit = NULL, 
	@IsSecureConnection bit = NULL, 
	@LogonUserIdentity nvarchar(max) = NULL, 
	@Params nvarchar(max) = NULL, 
	@Path nvarchar(max) = NULL, 
	@PathInfo nvarchar(max) = NULL, 
	@PhysicalApplicationPath nvarchar(max) = NULL, 
	@PhysicalPath nvarchar(max) = NULL, 
	@QueryString nvarchar(max) = NULL, 
	@RawUrl nvarchar(max) = NULL, 
	@ReadEntityBodyMode nvarchar(256) = NULL, 
	@RequestType nvarchar(max) = NULL, 
	@ServerVariables nvarchar(max) = NULL, 
	@TimedOutToken nvarchar(max) = NULL, 
	@TlsTokenBindingInfo nvarchar(max) = NULL, 
	@TotalBytes int = NULL, 
	@Unvalidated nvarchar(max) = NULL, 
	@Url nvarchar(max) = NULL, 
	@UrlReferrer nvarchar(max) = NULL, 
	@UserAgent nvarchar(max) = NULL, 
	@UserHostAddress nvarchar(256) = NULL, 
	@UserHostName nvarchar(256) = NULL, 
	@UserLanguages nvarchar(max) = NULL, 
	@Command nvarchar(64) = 'SELECT'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SET @Command = LTRIM(RTRIM(ISNULL(@Command, '')))

	IF @Command = 'INSERT' OR @Command = 'INSERTONLY'
		BEGIN
			DECLARE @ValueToDecrypt varbinary(256) = NULL
	

			--OPEN SYMMETRIC KEY LoginAttemptKey
			--DECRYPTION BY CERTIFICATE LoginAttemptCertificate


			--SET @ValueToDecrypt = EncryptByKey(KEY_GUID('LoginAttemptKey'), @PasswordHash)
			SET @ValueToDecrypt = EncryptByKey(KEY_GUID('71b2f209-f8ad-4c40-a38a-c0c0555801ca'), @PasswordHash)

			WHILE 1=1
				BEGIN
					SELECT @LoginAttemptId = LOWER(NEWID())

					INSERT INTO [dbo].[tblUserLoginAttempts]
							   ([Id]
							   ,[UserId]
							   ,[Email]
							   ,[PasswordHash]
							   ,[RememberMe]
							   ,[IsLoginSucceed]
							   ,[UserIPAddress]
							   ,[ReturnUrl]
							   ,[RequestObject]
							   ,[AcceptTypes]
								,[AnonymousID]
								,[AppRelativeCurrentExecutionFilePath]
								,[ApplicationPath]
								,[Browser]
								,[ClientCertificate]
								,[ContentEncoding]
								,[ContentLength]
								,[ContentType]
								,[Cookies]
								,[CurrentExecutionFilePath]
								,[CurrentExecutionFilePathExtension]
								,[FilePath]
								,[Files]
								,[Form]
								,[Headers]
								,[HttpChannelBinding]
								,[HttpMethod]
								,[IsAuthenticated]
								,[IsLocal]
								,[IsSecureConnection]
								,[LogonUserIdentity]
								,[Params]
								,[Path]
								,[PathInfo]
								,[PhysicalApplicationPath]
								,[PhysicalPath]
								,[QueryString]
								,[RawUrl]
								,[ReadEntityBodyMode]
								,[RequestType]
								,[ServerVariables]
								,[TimedOutToken]
								,[TlsTokenBindingInfo]
								,[TotalBytes]
								,[Unvalidated]
								,[Url]
								,[UrlReferrer]
								,[UserAgent]
								,[UserHostAddress]
								,[UserHostName]
								,[UserLanguages]
							   ,[RecCreatedDt])

							   SELECT @LoginAttemptId
								   ,@UserId
								   , @Email
								   , @ValueToDecrypt
								   , @RememberMe
								   , 0
								   , @UserIPAddress
								   , @ReturnUrl
								   , @RequestObject
								   , @AcceptTypes 
									, @AnonymousID
									, @AppRelativeCurrentExecutionFilePath
									, @ApplicationPath
									, @Browser
									, @ClientCertificate
									, @ContentEncoding
									, @ContentLength
									, @ContentType
									, @Cookies
									, @CurrentExecutionFilePath
									, @CurrentExecutionFilePathExtension
									, @FilePath
									, @Files
									, @Form
									, @Headers
									, @HttpChannelBinding
									, @HttpMethod
									, @IsAuthenticated
									, @IsLocal
									, @IsSecureConnection
									, @LogonUserIdentity
									, @Params
									, @Path
									, @PathInfo
									, @PhysicalApplicationPath
									, @PhysicalPath
									, @QueryString
									, @RawUrl
									, @ReadEntityBodyMode
									, @RequestType
									, @ServerVariables
									, @TimedOutToken
									, @TlsTokenBindingInfo
									, @TotalBytes
									, @Unvalidated
									, @Url
									, @UrlReferrer
									, @UserAgent
									, @UserHostAddress
									, @UserHostName
									, @UserLanguages
								   , SYSDATETIMEOFFSET()
							   FROM [dbo].[AspNetUsers] ANU WHERE ANU.Email = @Email
			
					IF @@ERROR <> 2627
 						BREAK;
				END
			IF @Command <> 'INSERTONLY'
				BEGIN
					SET @Command = 'SELECT'
				END
		END

	IF @Command = 'SELECT'
		BEGIN
			SELECT
				TOP 1
				ANU.Id,
				ANU.Email,
				ANU.EmailConfirmed,
				ANU.PasswordHash,
				ANU.SecurityStamp,
				ANU.PhoneNumber, 
				ANU.PhoneNumberConfirmed,
				ANU.TwoFactorEnabled,
				ANU.LockoutEndDateUtc,
				ANU.LockoutEnabled,
				ANU.AccessFailedCount,
				ANU.UserName,
				LA.Id							AS LoginAttemptId,
				LA.UserID,
				CONVERT(nvarchar(256), DecryptByKey(LA.PasswordHash))	AS LoginAttemptPassword,
				LA.RememberMe					AS RememberMe,
				LA.IsLoginSucceed				AS IsLoginSucceed,
				LA.UserIPAddress				AS UserIPAddress,
				LA.ReturnUrl					AS ReturnURL,
				LA.RequestObject				AS RequestObject,
				LA.AcceptTypes  AS AcceptTypes,
				LA.AnonymousID AS AnonymousID,
				LA.AppRelativeCurrentExecutionFilePath AS AppRelativeCurrentExecutionFilePath,
				LA.ApplicationPath AS ApplicationPath,
				LA.Browser AS Browser,
				LA.ClientCertificate AS ClientCertificate,
				LA.ContentEncoding AS ContentEncoding,
				LA.ContentLength AS ContentLength,
				LA.ContentType AS ContentType,
				LA.Cookies AS Cookies,
				LA.CurrentExecutionFilePath AS CurrentExecutionFilePath,
				LA.CurrentExecutionFilePathExtension AS CurrentExecutionFilePathExtension,
				LA.FilePath AS FilePath,
				LA.Files AS Files,
				LA.Form AS Form,
				LA.Headers AS Headers,
				LA.HttpChannelBinding AS HttpChannelBinding,
				LA.HttpMethod AS HttpMethod,
				LA.IsAuthenticated AS IsAuthenticated,
				LA.IsLocal AS IsLocal,
				LA.IsSecureConnection AS IsSecureConnection,
				LA.LogonUserIdentity AS LogonUserIdentity,
				LA.Params AS Params,
				LA.Path AS Path,
				LA.PathInfo AS PathInfo,
				LA.PhysicalApplicationPath AS PhysicalApplicationPath,
				LA.PhysicalPath AS PhysicalPath,
				LA.QueryString AS QueryString,
				LA.RawUrl			AS RawUrl,
				LA.ReadEntityBodyMode	AS ReadEntityBodyMode,
				LA.RequestType		AS RequestType,
				LA.ServerVariables	AS ServerVariables,
				LA.TimedOutToken	AS TimedOutToken,
				LA.TlsTokenBindingInfo	AS TlsTokenBindingInfo,
				LA.TotalBytes		AS TotalBytes,
				LA.Unvalidated		AS Unvalidated,
				LA.Url				AS Url,
				LA.UrlReferrer		AS UrlReferrer,
				LA.UserAgent		AS UserAgent,
				LA.UserHostAddress	AS UserHostAddress,
				LA.UserHostName		AS UserHostName,
				LA.UserLanguages	AS UserLanguages,
				LA.RecCreatedDt		AS RecCreatedDt,
				C.[FirstName]		AS FirstName,
				C.[LastName]		AS LastName,
				C.[FirstNameUrdu]		AS FirstNameUrdu,
				C.[LastNameUrdu]		AS LastNameUrdu,
				C.[AboutContact]	AS AboutContact,
				ISNULL(C.FirstName,'')+' '+ISNULL(C.LastName,'') AS FullName,
				ISNULL(C.FirstNameUrdu,'')+' '+ISNULL(C.LastNameUrdu,'') AS FullNameUrdu,
				C.[ContactImage]	AS ContactImage,
				ANR.Name			AS UserRoleName
				,UI.ContactId
			  ,UI.[CompanyId]
			  ,UI.[BranchId] 
			FROM [dbo].[AspNetUsers] ANU
				LEFT JOIN [dbo].[tblUserLoginAttempts] LA ON ANU.Email = LA.Email AND LA.Id = @LoginAttemptId
				LEFT JOIN [dbo].[tblUserInformation] UI ON ANU.Id = UI.UserId
				LEFT JOIN [dbo].[tblContacts] C ON C.Id=UI.ContactId
				LEFT JOIN [dbo].[AspNetUserRoles] ANUR ON ANU.Id = ANUR.UserId
				LEFT JOIN [dbo].[AspNetRoles] ANR ON ANUR.RoleId = ANR.Id
			WHERE ANU.Email = ISNULL(@Email, ANU.Email) AND ISNULL(LA.Id, '') = ISNULL(@LoginAttemptId, ISNULL(LA.Id, ''))
		END

	
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetMainModules]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetMainModules] 
	-- Add the parameters for the stored procedure here
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL
AS
BEGIN



if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
				FROM [dbo].[tblMainModules] t
				Where (@Id IS NULL OR Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.ModuleName like @SearchString) 
							OR (t.ModuleCode like @SearchString) 
							)

		), page_data AS (
			SELECT	t.*
					,M.TotalCount
					FROM [dbo].[tblMainModules] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY ModuleName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetMax]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		M Tayyab Iqbal Ch
-- Create date: 
-- Description:	
-- =============================================
Create PROCEDURE [dbo].[usp_GetMax] 
	-- Add the parameters for the stored procedure here
	@ColumnName nvarchar(max) = NULL, 
	@TableName nvarchar(max) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @max bigint, @sql nvarchar(max)
	SET @sql = N'SELECT @max = MAX(' + @ColumnName + ') FROM ' + @TableName

	EXEC sp_executesql 
		@query = @sql, 
		@params = N'@max bigint OUTPUT', 
		@max = @max OUTPUT 

	SELECT @max AS MaxVal

END



GO
/****** Object:  StoredProcedure [dbo].[usp_GetNavigationBreadCrumbs]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[usp_GetNavigationBreadCrumbs](
@Id bigint =null
)

AS 
SET Nocount on;
BEGIN

with NavTree as (
SELECT Id,-1 ParentId, MenuTitle, ApplicationArea, Area, Controller, Action FROM tblNavigations where DisplayOrder=1 and ParentId is null
UNION ALL
   select Id, ParentId, MenuTitle,ApplicationArea,Area, Controller,Action
   from tblNavigations
   where Id = @Id -- this is the starting point you want in your recursion
   union all
   select N.Id,N.ParentId, N.MenuTitle,N.ApplicationArea,N.Area, N.Controller,N.Action
   from tblNavigations N
     join NavTree PN on PN.ParentId = N.id  -- this is the recursion
) 
select Id, MenuTitle,ApplicationArea,Area, Controller,Action, Case WHEN Id=@Id then 1 else 0 end as IsActive 
, Case WHEN ParentId IS NULL then 0 else 1 end as IsLink 
from NavTree
Order by Id 
END
----------SP to create a generic BAL Class
GO
/****** Object:  StoredProcedure [dbo].[usp_GetNavigations]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		M Tayyab Iqbal Ch
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetNavigations] (
-- Add the parameters for the stored procedure here
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@ParentId BIGINT =NULL
 )
AS
BEGIN


if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

   ;WITH main AS(
				SELECT Distinct t.[Id]
				,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
					  ,PN.MenuTitle AS ParentMenuTitle
					  ,PN.DisplayOrder AS ParentDisplayOrder
					  ,PN.[ApplicationArea] AS ParentApplicationArea 
					  ,PN.[Area] AS  ParentArea
					  ,PN.[Controller] AS  ParentController
					  ,PN.[Action] AS  ParentAction
					  ,PN.[MenuIcon] AS  ParentMenuIcon
				FROM [dbo].[tblNavigations] t
				LEFT JOIN [dbo].[tblNavigations] PN ON PN.Id=t.ParentId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@ParentId IS NULL OR t.ParentId=@ParentId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTPARENTONLY' AND (ISNULL(t.ParentId,0)=0) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTPARENTONLY' THEN 1 ELSE 0 END)
				  AND  ( @SearchString IS NULL 
							OR (t.MenuTitle like @SearchString) 
							OR (t.MenuTitleUrdu like @SearchString) 
							OR (t.MenuTitleHindi like @SearchString) 
							OR (t.MenuTitleArabic like @SearchString) 
							OR (t.MenuTitlePersian like @SearchString) 
							OR (t.MenuTitleTurkish like @SearchString) 
							OR (t.MenuTitleRussian like @SearchString) 
							OR (t.MenuTitleSpanish like @SearchString) 
							OR (t.MenuTitleFrench like @SearchString) 
							OR (t.MenuTitleFilipino like @SearchString) 
							OR (t.MenuTitleChinese like @SearchString) 
							)

		), page_data AS (
				SELECT N.*
					  ,main.ParentMenuTitle
					  ,main.ParentDisplayOrder
					  ,main.ParentApplicationArea 
					  ,main.ParentArea
					  ,main.ParentController
					  ,main.ParentAction
					  ,main.ParentMenuIcon
					  ,CASE WHEN ISNULL(N.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
					  ,M.TotalCount
					  , SUBSTRING((
                            SELECT ',' + CONVERT(NVARCHAR(MAX),AR.PermissionDefinitionId)
                            FROM [dbo].[tblAreaRules] AR
                            WHERE N.Id = AR.MainNavigationId
                            FOR XML PATH('')

                        ), 2, 1000000) AS [Permissions]
						,(SELECT TOP 1 ApplicationAreaId FROM [dbo].[tblAreaRules] AR WHERE N.Id = AR.MainNavigationId) ApplicationAreaId
				  FROM [dbo].[tblNavigations] N
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on N.Id=main.Id
					
					ORDER BY DisplayOrder ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)

		Select * from page_data

END



GO
/****** Object:  StoredProcedure [dbo].[usp_GetPermissionDefinitions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetPermissionDefinitions](
	-- Add the parameters for the stored procedure here
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL
)
AS
BEGIN



if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
   ;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblPermissionDefinitions] t
					Where (@Id IS NULL OR Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.PermissionTitle like @SearchString) 
							OR (t.PermissionDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
				  ,M.TotalCount
			  FROM [dbo].[tblPermissionDefinitions] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY PermissionTitle ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
  			)

		Select * from page_data PD


END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductCategories]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetProductCategories](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@ParentId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
				  ,PAA.CategoryCode AS ParentCategoryCode
				  ,PAA.CategoryName AS ParentCategoryName
				  ,PAA.CategoryNameUrdu AS ParentCategoryNameUrdu
				  ,PAA.CategoryDescription AS ParentCategoryDescription
			  FROM [dbo].[tblProductCategories] t
				LEFT JOIN [tblProductCategories] PAA ON PAA.Id=t.ParentId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@ParentId IS NULL OR t.ParentId=@ParentId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTPARENTONLY' AND (ISNULL(t.ParentId,0)=0) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTPARENTONLY' THEN 1 ELSE 0 END)
				  AND  ( @SearchString IS NULL 
							OR (t.CategoryCode like @SearchString) 
							OR (t.CategoryName like @SearchString) 
							OR (t.CategoryDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.[Id]
					  ,[CategoryCode]
					  ,[CategoryName]
					  ,[CategoryNameUrdu]
					  ,[CategoryDescription]
					  ,ISNULL([ParentId],0) ParentId
					  ,[RecordStatus]
					  ,CreatedBy
					  ,CreatedDate
					  ,UpdatedBy
					  ,UpdatedDate
					  ,main.IsParent
					  ,main.ParentCategoryCode
					  ,main.ParentCategoryName
					  ,main.ParentCategoryNameUrdu
					  ,main.ParentCategoryDescription
					  ,M.TotalCount
				  FROM [dbo].[tblProductCategories] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY CategoryName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductDocuments]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetProductDocuments](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,
	@Id BIGINT =NULL,
	@ProductId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,DT.DocumentTypeName
					  
					  --,C.FirstName
					  --,C.FirstNameUrdu
					  --,C.LastName
					  --,C.LastNameUrdu
					  --,ISNULL(C.[FirstName],'') + ' ' + ISNULL(C.[MiddleName],'') + ' ' + ISNULL(C.[LastName],'') FullName
					  --,ISNULL(C.[FirstNameUrdu],'') + ' ' + ISNULL(C.[MiddleNameUrdu],'') + ' ' + ISNULL(C.[LastNameUrdu],'') FullNameUrdu
						
				  FROM [dbo].[tblProductDocuments] t
					JOIN [dbo].[tblDocuments] D ON D.Id=t.DocumentId
					JOIN [dbo].[tblDocumentTypes] DT ON DT.Id=D.DocumentTypeId
					--JOIN [Product].[tblProducts] C ON C.Id=t.ProductId
					Where (@Id IS NULL OR t.Id=@Id)
						AND (@ProductId IS NULL OR t.ProductId=@ProductId)
						AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
						AND  ( @SearchString IS NULL 
									OR (D.DocumentPath like @SearchString) 
									OR (D.DocumentExtension like @SearchString) 
									OR (D.DocumentName like @SearchString) 
									OR (D.FileType like @SearchString) 
									)

		), page_data AS (
				SELECT t.*
					  ,[DocumentTitle]
					  ,[DocumentName]
					  ,[DocumentPath]
					  ,[DocumentExtension]
					  ,[DocumentRevision]
					  ,[ChangeNumber]
					  ,[FileType]
					  ,[DocumentTypeId]
					  ,DocumentTypeName

					  --,FirstName
					  --,FirstNameUrdu
					  --,LastName
					  --,LastNameUrdu
					  --,FullName
					  --,FullNameUrdu
					  ,ISNULL(main.DocumentPath,'')+'/'+ISNULL(main.DocumentName,'')+ISNULL(main.DocumentExtension,'') DocumentFullName
					  ,M.TotalCount
				  FROM [dbo].[tblProductDocuments] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY DocumentName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProducts]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetProducts](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@ParentId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,CASE WHEN ISNULL(t.ParentId,0)=0 THEN 1 ELSE 0 END IsParent
				  ,PAA.ProductCode AS ParentProductCode
				  ,PAA.ProductName AS ParentProductName
				  ,PAA.ProductNameUrdu AS ParentProductNameUrdu
				  ,PAA.ProductDescription AS ParentProductDescription
				  ,PC.CategoryName
				  ,UOM.UnitName UnitOfMeasurementName
			  FROM [dbo].[tblProducts] t
				JOIN tblProductCategories PC ON PC.Id=t.ProductCategoryId
				JOIN tblUnitofMeasurements UOM ON UOM.Id=t.UnitOfMeasurementId
				LEFT JOIN [tblProducts] PAA ON PAA.Id=t.ParentId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@ParentId IS NULL OR t.ParentId=@ParentId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND (1=CASE WHEN Isnull(@Command,'!!!')='SELECTPARENTONLY' AND (ISNULL(t.ParentId,0)=0) THEN 1 WHEN Isnull(@Command,'!!!')!='SELECTPARENTONLY' THEN 1 ELSE 0 END)
				  AND  ( @SearchString IS NULL 
							OR (t.ProductCode like @SearchString) 
							OR (t.ProductName like @SearchString) 
							OR (t.ProductDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,main.IsParent
					  ,main.ParentProductCode
					  ,main.ParentProductName
					  ,main.ParentProductNameUrdu
					  ,main.ParentProductDescription
					  ,main.CategoryName
					  ,M.TotalCount
					  ,main.UnitOfMeasurementName
				  FROM [dbo].[tblProducts] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY ProductName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRolesDefaultPermissions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[usp_GetRolesDefaultPermissions]
	@RoleId nvarchar(256)=NULL
AS
BEGIN
	SELECT RDP.Id,ANP.Id AS RoleId,ANP.Name AS RoleName,RDP.ModulesPermissions AS ModulesAssigned,
	RDP.ApplicationAreasPermissions AS RightsAssigned
	FROM [dbo].[AspNetRoles] ANP
		LEFT OUTER JOIN [dbo].[tblRolesDefaultPermissions] RDP on ANP.Id=RDP.RoleId
	WHERE ANP.Id=@RoleId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetRolesList]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetRolesList] 
	-- Add the parameters for the stored procedure here
	@Id nvarchar(128) = NULL, 
	@Name varchar(256) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ANR.Id, ANR.Name FROM [dbo].[AspNetRoles] ANR
	WHERE (@Id is null OR Id=@Id)
	AND (@Name is null OR Name=@Name)
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetStateProvinces]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetStateProvinces] 
  	@OffSet bigint = 0, 
  	@PageSize bigint = 10,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =null,
	@Command NVARCHAR(100)=NULL,

	@Id BIGINT =NULL,
	@StateProvinceName NVARCHAR(256)=NULL,
	@ISO3 NVARCHAR(256)=NULL,
	@ISO2 NVARCHAR(256)=NULL
 
 AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END
 
		;WITH main AS(
			SELECT Distinct t.Id, C.CountryName
				from  [dbo].[tblStateProvinces] t
					JOIN [dbo].[tblCountries] C ON t.CountryId=C.Id
				Where ( @Id IS NULL OR t.Id=ISNULL(@Id,t.Id))
				AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				AND  ( @StateProvinceName IS NULL OR t.[StateProvinceName]=@StateProvinceName)
				AND  ( @SearchString IS NULL 
						OR (t.[StateProvinceName] like @SearchString) 
						OR (t.ISO2 like @SearchString) 
						OR (t.CountryCode like @SearchString) 
						OR (t.FIPSCode like @SearchString)
						)
			

			), page_data AS (
				SELECT t.*, main.CountryName , M.TotalCount
					FROM  [dbo].[tblStateProvinces] t
  						CROSS APPLY (SELECT count(*) TotalCount from main) M
						JOIN main ON main.Id=t.Id
  					--WHERE EXISTS (SELECT 1 FROM main WHERE main.Id = t.Id)
  					ORDER BY
  						CASE WHEN @SortOrder = 'asc' AND @SortColumn BETWEEN 0 AND 3 
							THEN
  								CASE @SortColumn
  									WHEN 0 THEN t.[StateProvinceName]
  									WHEN 1 THEN t.ISO2
  									WHEN 2 THEN t.CountryCode
  									WHEN 3 THEN t.FIPSCode
  								END
  						END,
  						CASE WHEN @SortOrder = 'desc' AND @SortColumn BETWEEN 0 AND 3
							THEN
  								CASE @SortColumn 
  									WHEN 0 THEN t.[StateProvinceName]
  									WHEN 1 THEN t.ISO2
  									WHEN 2 THEN t.CountryCode
  									WHEN 3 THEN t.FIPSCode
  								END
  						END DESC
  						--CASE WHEN @SortOrder = 'asc' AND @SortColumn = 2
  						--	THEN C.RecCreatedDt
  						--END,
  						--CASE WHEN @SortOrder = 'desc' AND @SortColumn = 2
  						--	THEN C.RecCreatedDt
  						--END DESC
  					OFFSET @OffSet ROWS
  					FETCH NEXT @PageSize ROWS ONLY
  				)


				Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUnitofMeasurements]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_GetUnitofMeasurements](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,
	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblUnitofMeasurements] t
				Where (@Id IS NULL OR t.Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.UnitName like @SearchString) 
							OR (t.UnitCode like @SearchString) 
							OR (t.UnitDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.[Id]
					  ,[UnitCode]
					  ,[UnitName]
					  ,[UnitNameUrdu]
					  ,[UnitDescription]
					  ,[RecordStatus]
					  ,CreatedBy
					  ,CreatedDate
					  ,UpdatedBy
					  ,UpdatedDate
					  ,M.TotalCount
				  FROM [dbo].[tblUnitofMeasurements] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY UnitName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserApplicationAreasList]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserApplicationAreasList] 
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(128) = NULL, 
	@MainUserId nvarchar(128) = NULL,
	@RoleId nvarchar(128) = NULL,
	@ModuleId int = NULL,
	@ParentId int = NULL,
	@CheckAreaPermissions int = NULL
AS
BEGIN

	IF @RoleId IS NULL AND @MainUserId IS NULL
		BEGIN
			SELECT top(1) @RoleId = RoleId FROM [dbo].[AspNetUserRoles] WHERE UserId = @UserId
		END

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT DISTINCT AA.[Id], AA.[ApplicationAreaName], AA.[ApplicationAreaCode], AA.[ModuleId], AA.[ParentId] 
	FROM [dbo].[tblAreaRules] AR
	JOIN [dbo].[tblApplicationAreas] AA ON AR.[ApplicationAreaId] = AA.[Id]
	JOIN [dbo].[tblMainModules] MM ON AA.[ModuleId] = MM.[Id]
	--JOIN [dbo].[AspNetRoles] ANR ON ANR.Name = @pRoleName
		CROSS APPLY (
		SELECT ((CASE WHEN @CheckAreaPermissions > 0 THEN CONVERT(int, SUBSTRING(UP.[RightsAssigned], AR.[Id], 1)) ELSE 1 END)
		* CONVERT(int, SUBSTRING(UP.[ModulesAssigned], MM.[Id], 1)))RightsAssigned FROM [dbo].[tblUserPermissions] UP
		WHERE @UserId = (CASE @UserId WHEN '__ALL__' THEN @UserId ELSE UP.[UserId] END) AND ISNULL(UP.[MainUserId], '') = ISNULL(@MainUserId, '') AND UP.[RoleId] = ISNULL(@RoleId, '')) UR
	WHERE (UR.RightsAssigned > 0 OR @UserId = '__ALL__') AND ISNULL(@ParentId, 0) = (CASE WHEN ISNULL(@ParentId, 0) < 0 THEN ISNULL(@ParentId, 0) ELSE ISNULL(AA.[ParentId], 0) END)
	AND ISNULL(@ModuleId, 0) = (CASE WHEN ISNULL(@ModuleId, 0) < 0 THEN ISNULL(@ModuleId, 0) ELSE MM.[Id] END);
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserAreaRulesList]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserAreaRulesList] 
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(128) = NULL, 
	@MainUserId nvarchar(128) = NULL,
	@RoleId nvarchar(128) = NULL,
	@ModuleId int = NULL,
	@ApplicationAreaId int = NULL,
	@CheckAreaPermissions int = NULL,
	@Command varchar(64) =NULL
AS
BEGIN

	IF @RoleId IS NULL AND @MainUserId IS NULL
		BEGIN
			SELECT @RoleId = Id FROM [dbo].[AspNetRoles] WHERE Name = 'User'
		END
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @SuperAdminUserId nvarchar(256) = NULL
 
 	SELECT TOP 1 @SuperAdminUserId = ANUR.UserId FROM [dbo].[AspNetRoles] ANR
 		JOIN [dbo].[AspNetUserRoles] ANUR ON ANR.Id = ANUR.RoleId
 	WHERE ANUR.UserId = @UserId AND ANR.Name IN ('SuperAdmin')

	SELECT DISTINCT AR.[Id], AR.[ApplicationAreaId], AR.[AreaRuleName]
	, AR.[AreaRuleCode], AR.[AreaDetails], AR.[NavigationId] ,AR.MainNavigationId
	,ISNULL(AR.IsLineBreak,0) AS IsLineBreak
	,N.MenuTitle
	FROM [dbo].[tblAreaRules] AR
	JOIN [dbo].[tblApplicationAreas] AA ON AR.[ApplicationAreaId] = AA.[Id]
	JOIN [dbo].[tblMainModules] MM ON AA.[ModuleId] = MM.[Id]
	JOIN [dbo].[tblNavigations] N ON N.Id=AR.MainNavigationId
	--JOIN [dbo].[AspNetRoles] ANR ON ANR.Name = @pRoleName
		CROSS APPLY (SELECT ((CASE WHEN @CheckAreaPermissions > 0 THEN CONVERT(int, SUBSTRING(UP.[RightsAssigned], AR.[Id], 1)) ELSE 1 END) * CONVERT(int, SUBSTRING(UP.[ModulesAssigned], MM.[Id], 1)))RightsAssigned
		 FROM [dbo].[tblUserPermissions] UP
		WHERE @UserId = (CASE @UserId WHEN '__ALL__' THEN @UserId ELSE UP.[UserId] END) AND ISNULL(UP.[MainUserId], '') = ISNULL(@MainUserId, '') AND UP.[RoleId] = ISNULL(@RoleId, '')) UR
	WHERE (UR.RightsAssigned > 0 OR @UserId = '__ALL__') AND ISNULL(@ApplicationAreaId, 0) = (CASE WHEN ISNULL(@ApplicationAreaId, 0) < 0 THEN ISNULL(@ApplicationAreaId, 0) ELSE ISNULL(AA.[Id], 0) END)
	AND ISNULL(@ModuleId, 0) = (CASE WHEN ISNULL(@ModuleId, 0) < 0 THEN ISNULL(@ModuleId, 0) ELSE MM.[Id] END)
	AND (AR.Id >0 OR @Command <> 'SubUser' OR @UserId = @SuperAdminUserId);	-- Sub suer rights excluded here
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserInfo]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_GetUserInfo] 
 	-- Add the parameters for the stored procedure here
 	@UserId nvarchar(256) = NULL, 
 	@UserEmail nvarchar(256) = NULL,
 	@MainUserId nvarchar(256) = NULL,
 	@RoleName nvarchar(256) = NULL,
	@SessionID nvarchar(256) = NULL,
	@WebsiteID nvarchar(64) = NULL,
	@AddSession bit = NULL,
	@LoginAttemptId nvarchar(64) = NULL
 AS
 BEGIN
 	-- SET NOCOUNT ON added to prevent extra result sets from
 	-- interfering with SELECT statements.
 	SET NOCOUNT ON;

	SET @AddSession = ISNULL(@AddSession, 0)

	IF @AddSession = 1
		BEGIN
			
			UPDATE [dbo].[tblUserSessions] SET SessionID = @SessionID, RecUpdatedBy = @UserId, RecUpdatedDt = SYSDATETIMEOFFSET() WHERE Id = @UserId AND WebsiteID = @WebsiteID
			
			IF NOT EXISTS (SELECT 1 FROM [dbo].[tblUserSessions] US WHERE US.Id = @UserId AND US.WebsiteID = @WebsiteID)
				BEGIN
					INSERT INTO [dbo].[tblUserSessions] (Id, SessionID, WebsiteID, RecCreatedBy, RecCreatedDt) VALUES (@UserId, @SessionID, @WebsiteID, @UserId, SYSDATETIMEOFFSET())
				END

			IF @LoginAttemptId IS NOT NULL
				BEGIN
					UPDATE  [dbo].[tblUserLoginAttempts] SET IsLoginSucceed = 1 WHERE Id = @LoginAttemptId
				END
		END
 

			 -- Insert statements for procedure here
 			SELECT UI.Id
				,ISNULL(MUI.Id, UI.Id) UserInfomationId
				,ISNULL(MUI.UserId, UI.UserId) SessionUserId
				,ISNULL(ANU.Id, '') AS UserId
				,ISNULL(ANUR.RoleId, '') AS RoleId
 				,ISNULL(ANR.Name, '') AS RoleName
				,ISNULL(ANU.Email, '') AS UserEmail
				,ANU.EmailConfirmed
 				,ISNULL(UP.ModulesAssigned, '') AS ModulesAssigned
				,ISNULL(UP.RightsAssigned, '') AS RightsAssigned
				,C.FirstName
				,C.LastName
				,C.FirstName+' '+C.LastName AS FullName
				,C.FirstNameUrdu+' '+C.LastNameUrdu AS FullNameUrdu
				,C.FirstNameUrdu
				,C.LastNameUrdu
			    ,UI.[CompanyId]
			    ,UI.[BranchId] 
				,UI.ContactId
				,C.BirthDate
				,C.CellNumber
				,C.ContactImage
				,C.ContactTypeId
				,C.AboutContact
				,C.PhoneNumber ContactPhoneNumber
				,ANU.PhoneNumber
				,CT.ContactTypeCode
				,CT.ContactTypeName
				, ISNULL(MUI.UserId, '') AS MainUserId
				,MUI.ContactId MainUserContactId
			    ,MUI.[CompanyId] MainUserCompanyId
			    ,MUI.[BranchId]  MainUserBranchId
			    ,C.[DivisionId]
 			FROM [dbo].[AspNetUsers] ANU
				JOIN [dbo].[tblUserInformation] UI ON UI.UserId=ANU.Id
 				JOIN [dbo].[AspNetUserRoles] ANUR ON ANU.Id = ANUR.UserId
 				JOIN [dbo].[AspNetRoles] ANR ON ANUR.RoleId = ANR.Id AND (@RoleName IS NULL OR ANR.Name=ISNULL(@RoleName, ''))
 				JOIN [dbo].[tblContacts] C ON C.Id=UI.ContactId 
				JOIN [dbo].[tblContactTypes] CT ON CT.Id=C.ContactTypeId 
 				LEFT OUTER JOIN [dbo].[tblUserPermissions] UP ON ANU.Id = UP.UserId AND ANUR.RoleId = UP.RoleId AND (@MainUserId IS NULL OR ISNULL(UP.MainUserId, '')=ISNULL(@MainUserId, ''))    
 				LEFT OUTER JOIN [dbo].[tblUserInformation] MUI ON ISNULL(UP.MainUserId, '') = ISNULL(MUI.Id, '')
				
 			WHERE 
			--ANU.Id = ISNULL(@UserId, '') 
			--AND ANU.Email = ISNULL(@UserEmail, '')
			(@UserId IS NULL OR ANU.Id=@UserId)
				AND (@UserEmail IS NULL OR ANU.Email=@UserEmail)
	
	
 END




GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserList]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		MTIC
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserList] 
	-- Add the parameters for the stored procedure here
	@Id nvarchar(256) = NULL, 
	@Email nvarchar(256) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ANU.Id, ANU.Email, ANU.EmailConfirmed, ANU.PasswordHash, ANU.SecurityStamp, ANU.PhoneNumber, 
		ANU.PhoneNumberConfirmed, ANU.TwoFactorEnabled, ANU.LockoutEndDateUtc, ANU.LockoutEnabled, ANU.AccessFailedCount,
		ANU.UserName FROM [dbo].[AspNetUsers] ANU
	WHERE ISNULL(@Id, '') = (CASE WHEN ISNULL(@Id, '') = '' THEN ISNULL(@Id, '') ELSE ANU.Id END)
	AND ISNULL(@Email, '') = (CASE WHEN ISNULL(@Email, '') = '' THEN ISNULL(@Email, '') ELSE ANU.Email END)
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserModulesList]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserModulesList] 
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(128) = NULL, 
	@MainUserId nvarchar(128) = NULL,
	@RoleId nvarchar(128) = NULL,
	@CheckAreaPermissions int = NULL
AS
BEGIN

	IF @RoleId IS NULL AND @MainUserId IS NULL
		BEGIN
			SELECT top(1) @RoleId = RoleId FROM [dbo].[AspNetUserRoles] WHERE UserId = @UserId
		END

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT DISTINCT MM.Id, MM.[ModuleName], MM.[ModuleCode] FROM [dbo].[tblAreaRules] AR
	JOIN [dbo].[tblApplicationAreas] AA ON AR.[ApplicationAreaId] = AA.Id
	RIGHT OUTER JOIN [dbo].[tblMainModules] MM ON AA.[ModuleId] = MM.Id
	--JOIN [dbo].[AspNetRoles] ANR ON ANR.Name = @pRoleName
		CROSS APPLY (SELECT ((CASE WHEN ISNULL(@CheckAreaPermissions, 0) > 0 THEN CONVERT(int, SUBSTRING(UP.[RightsAssigned], AR.Id, 1)) ELSE 1 END) * CONVERT(int, SUBSTRING(UP.[ModulesAssigned], MM.Id, 1)))RightsAssigned FROM [dbo].[tblUserPermissions] UP
		WHERE @UserId = (CASE @UserId WHEN '__ALL__' THEN @UserId ELSE UP.[UserId] END) AND ISNULL(UP.[MainUserId], '') = ISNULL(@MainUserId, '') AND UP.[RoleId] = ISNULL(@RoleId, '')) UR
	WHERE UR.RightsAssigned > 0 OR @UserId = '__ALL__';
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserNavigationList]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		M Tayyab Iqbal Ch
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserNavigationList] 
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(128) = NULL, 
	@MainUserId nvarchar(128) = NULL,
	@RoleId nvarchar(128) = NULL,
	@ApplicationArea nvarchar(128) = NULL,
	@ParentId nvarchar(128) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT DISTINCT N.Id
				,N.MenuTitle
				,N.MenuTitleUrdu
				,N.[MenuTitleHindi]
				,N.[MenuTitleArabic]
				,N.[MenuTitlePersian]
				,N.[MenuTitleTurkish]
				,N.[MenuTitleRussian]
				,N.[MenuTitleSpanish]
				,N.[MenuTitleFrench]
				,N.[MenuTitleFilipino]
				,N.[MenuTitleChinese]
				,N.MenuIcon
				,N.DisplayOrder
				,ISNULL(N.ParentId, 0) AS ParentId
				,N.ApplicationArea
				,N.Area, N.Controller
				,N.Action,N.[RecordStatus]
				,A.NavigationId 
				,CASE WHEN ISNULL(CM.ChildMenus, 0) > 0 THEN 1 ELSE 0 END IsParent			
	FROM [dbo].[tblNavigations] N
		CROSS APPLY (SELECT COUNT(*) AS Total FROM [dbo].[tblAreaRules] AN WHERE AN.NavigationId = N.Id) NA
 		OUTER APPLY (SELECT COUNT(CM.Id) AS ChildMenus FROM [dbo].[tblNavigations] CM WHERE ISNULL(CM.ParentId, -1) = N.Id 
			--AND CM.ApplicationArea=@ApplicationArea
			AND ISNULL(@ApplicationArea, '') = (CASE WHEN ISNULL(@ApplicationArea, '') = '__ALL__' THEN ISNULL(@ApplicationArea, '') ELSE ISNULL(N.ApplicationArea, 0) END)

		) CM
		LEFT OUTER JOIN (
			SELECT AR.NavigationId As NavigationId FROM [dbo].[tblAreaRules] AR
				JOIN [dbo].[tblApplicationAreas] AA ON AR.[ApplicationAreaId] = AA.Id
				JOIN [dbo].[tblMainModules] MM ON AA.[ModuleId] = MM.Id
				--JOIN [dbo].[AspNetRoles] ANR ON ANR.Name = @pRoleName
				CROSS APPLY (SELECT CONVERT(int, SUBSTRING(UP.[RightsAssigned], AR.Id, 1)) * CONVERT(int, SUBSTRING(UP.[ModulesAssigned], MM.Id, 1)) RightsAssigned 
				FROM [dbo].[tblUserPermissions] UP
				WHERE UP.[UserId] = @UserId -- CASE WHEN @RoleID ='10553325-1b66-4020-9656-a546a6b77200' THEN UP.[UserId] ELSE @UserId END
				AND ISNULL(UP.[MainUserId], '') = ISNULL(@MainUserId, '') 
				AND UP.[RoleId] = ISNULL(@RoleId, '') -- CASE WHEN @RoleID ='10553325-1b66-4020-9656-a546a6b77200' THEN  UP.[RoleId] ELSE ISNULL(@RoleId, '') END
				) UR
			WHERE UR.RightsAssigned = CASE WHEN @RoleID ='10553325-1b66-4020-9656-a546a6b77200' THEN  UR.RightsAssigned ELSE 1 END 
		) A ON N.Id = A.NavigationId
	WHERE N.Id = (CASE WHEN NA.Total <= 0 THEN N.Id ELSE A.NavigationId END) 
	AND N.[RecordStatus]=1
	AND ISNULL(@ParentId, 0) = (CASE WHEN ISNULL(@ParentId, 0) < 0 THEN ISNULL(@ParentId, 0) ELSE ISNULL(N.ParentId, 0) END)
	AND ISNULL(@ApplicationArea, '') = (CASE WHEN ISNULL(@ApplicationArea, '') = '__ALL__' THEN ISNULL(@ApplicationArea, '') ELSE ISNULL(N.ApplicationArea, 0) END)
	ORDER BY ISNULL(N.ParentId, 0), N.DisplayOrder 
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserPermissionsList]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[usp_GetUserPermissionsList] 
  	-- Add the parameters for the stored procedure here
  	@UserId nvarchar(256) = NULL,
  	--@MainUserId nvarchar(256) = NULL,
 	@Command nvarchar(32) = NULL
  AS
  BEGIN
 
 	SET @Command = ISNULL(@Command, 'MENULIST')
  
 	IF ISNULL(@Command, 'MENULIST') = 'MENULIST' 
 		BEGIN
  			SELECT UP.Id, UP.UserId, UP.MainUserId, UP.RoleId, UP.ModulesAssigned, UP.RightsAssigned, ANU.Email,
			 ANU.UserName, ANR.Name RoleName ,'' FullName --UI.EmpName  FullName 
			  FROM [dbo].[tblUserPermissions] UP
  				LEFT OUTER JOIN [dbo].[AspNetUsers] ANU ON ISNULL(ANU.Id, '') = (CASE WHEN ISNULL(UP.MainUserId, '') = '' THEN ISNULL(UP.UserId, '') ELSE ISNULL(UP.MainUserId, '') END)
  				JOIN [dbo].[AspNetRoles] ANR ON UP.RoleId = ANR.Id
 				--Join EmployeeInfo UI On UI.[LoginID] = UP.UserId
  			WHERE --ISNULL(UP.MainUserId, '') != ISNULL(@MainUserId, '') AND
			 UP.UserId = @UserId;
 		END
 	
 	IF ISNULL(@Command, 'MENULIST') = 'SUBUSERSLIST' 
 		BEGIN
  			SELECT UP.Id, UP.UserId, UP.MainUserId, UP.RoleId, UP.ModulesAssigned, UP.RightsAssigned, ANU.Email,
			 ANU.UserName, ANR.Name RoleName , ''  FullName--UI.FirstName +' '+UI.LastName FullName
 			FROM [dbo].[tblUserPermissions] UP
  				LEFT OUTER JOIN [dbo].[AspNetUsers] ANU ON ISNULL(ANU.Id, '') = UP.UserId
  				JOIN [dbo].[AspNetRoles] ANR ON UP.RoleId = ANR.Id
 				--Join UserProfiles UI On UI.UserId = UP.UserId
  			WHERE --ISNULL(UP.MainUserId, '') = (CASE WHEN ISNULL(@MainUserId, '') = '' THEN ISNULL(@UserId, '') ELSE ISNULL(@MainUserId, '') END) AND 
				UP.UserId != @UserId;
 		END
 
 	IF ISNULL(@Command, 'MENULIST') = 'VERIFYUSER' 
 		BEGIN
  			SELECT UP.Id, UP.UserId, UP.MainUserId, UP.RoleId, UP.ModulesAssigned, UP.RightsAssigned,
			 ANU.Email, ANU.UserName, ANR.Name RoleName , '' FullName--UI.FirstName +' '+UI.LastName FullName
 			FROM [dbo].[tblUserPermissions] UP
  				LEFT OUTER JOIN [dbo].[AspNetUsers] ANU ON ISNULL(ANU.Id, '') = UP.UserId
  				JOIN [dbo].[AspNetRoles] ANR ON UP.RoleId = ANR.Id
 				--Join UserProfiles UI On UI.UserId = UP.UserId
  			WHERE --ISNULL(UP.MainUserId, '') = ISNULL(@MainUserId, '') AND 
			UP.UserId = @UserId;
 		END
 
 	IF ISNULL(@Command, 'MENULIST') = 'REMOVESUBUSER'
 		BEGIN
 			DELETE FROM [dbo].[tblUserPermissions] WHERE UserId = @UserId --AND MainUserId = @MainUserId
 		END
  
      -- Insert statements for procedure here
  	IF @@ERROR <> 0
  		BEGIN
  			SELECT 0
  			RETURN
  		END
  	
  END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserUpdateActivities]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetUserUpdateActivities](
@ActionPerformedBy  NVARCHAR(256) = NULL,
@UpdatedUserId NVARCHAR(128) = NULL,
@UpdatedDate Datetimeoffset(7) = NULL,
@ActionPerformed NVARCHAR(256) = NULL,
@Command  NVARCHAR(256) ='SELECT',
@StartDate DATETIMEOFFSET(7)=NULL,
@EndDate DATETIMEOFFSET(7)=NULL,
@OffSet bigint =0,
@PageSize BIGINT =10,
@SortColumn INT =1,
@SortOrder NVARCHAR(20) ='asc' 
)
As
BEGIN
	BEGIN TRY
		IF (Isnull(@Command,'SELECT')='Insert')
			BEGIN
			
					INSERT INTO [dbo].[tblUserUpdateActivities] (ActionPerformedBy,UpdatedUserId,UpdatedDate,ActionPerformed)
						SELECT @ActionPerformedBy,@UpdatedUserId,ISNULL(@UpdatedDate, GETUTCDATE()),@ActionPerformed


				--Select @@IDENTITY Id
			
			END

		IF (Isnull(@Command,'SELECT')='SELECT')
			BEGIN
				;WITH main AS(
					Select UUA.Id,UUA.UpdatedUserId,UUA.UpdatedDate
						FROM [dbo].[tblUserUpdateActivities] UUA
							WHERE (@UpdatedUserId IS NULL OR  UUA.UpdatedUserId=@UpdatedUserId)
								AND (@ActionPerformedBy IS NULL OR ActionPerformedBy like '%'+@ActionPerformedBy+'%')
								--AND (@StartDate IS NULL OR UpdatedDate BETWEEN @StartDate AND @EndDate)
				), page_data AS (
							SELECT fm.Id,fm.UpdatedUserId,M.TotalCount
								FROM main fm
									CROSS APPLY (SELECT count(*) TotalCount from main) M
								WHERE EXISTS (SELECT 1 FROM main WHERE main.Id = fm.Id)
								ORDER BY
								fm.UpdatedDate DESC
								OFFSET @OffSet ROWS
								FETCH NEXT @PageSize ROWS ONLY
							)

					Select UUA.Id
					,UUA.ActionPerformedBy
					,UUA.UpdatedDate
					,UUA.ActionPerformed
					,UUA.UpdatedUserId
					,ANU.Email
					,C.FirstName
					,C.LastName
					,C.FirstName+' '+C.LastName AS FullName
					,C.FirstNameUrdu+' '+C.LastNameUrdu AS FullNameUrdu
					,C.FirstNameUrdu
					,C.LastNameUrdu
					,UI.IsManulaCreatedUser
					,UI.CreatedBy
					,UI.CreatedDate
					,UI.UpdatedBy
					,UI.UpdatedDate 
					,pd.TotalCount
			  ,UI.[CompanyId]
			  ,UI.[BranchId] 
					FROM [dbo].[tblUserUpdateActivities] UUA
						JOIN page_data PD ON PD.Id = UUA.Id
						JOIN [dbo].[AspNetUsers] ANU ON ANU.Id=UUA.UpdatedUserId
						JOIN [dbo].[tblUserInformation] UI ON UI.UserId=ANU.Id
						JOIN [dbo].[tblContacts] C ON C.Id=UI.ContactId
						
			END
	END TRY
	BEGIN CATCH
		SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage;  
		
	END CATCH
END



--EXEC [dbo].[usp_GetUserUpdateActivities] 'dsdsd','sd',NULL,'CanSpam Logo OFF','AddUserActivityPerformed'

--exec [dbo].[usp_GetUserUpdateActivities] @OffSet=0,@PageSize=100,@SortColumn=N'1',@SortOrder=N'desc',@UpdatedUserId=N'09f15652-e29b-4d21-85eb-b839ef9f1f82',@ActionPerformedBy=N'support2',@Command=N'SELECT'





GO
/****** Object:  StoredProcedure [dbo].[usp_GetVendors]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetVendors](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@CompanyId BIGINT =NULL,
	@BranchId BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] VendorId
				,Caste.CasteName
				,Caste.CasteNameUrdu
				,subCaste.CasteName SubCasteName
				,subCaste.CasteNameUrdu SubCasteNameUrdu
				,CT.ContactTypeName
				,CT.ContactTypeNameUrdu
				,D.DivisionName
				,ANU.UserName LoginUserName
				,ANU.Email LoginEmail
				,ANR.Name RoleName
			  FROM [dbo].[tblVendors] t
				JOIN [dbo].[tblContacts] C ON C.Id=t.ContactId
				LEFT JOIN [dbo].[tblCastes] Caste ON Caste.Id=C.CasteId
				LEFT JOIN [dbo].[tblCastes] subCaste ON subCaste.Id=C.SubCasteId
				LEFT JOIN [dbo].[tblContactTypes] CT oN CT.Id=C.ContactTypeId
				LEFT JOIN [dbo].[tblDivisions] D ON D.Id=C.DivisionId
				JOIN [dbo].[AspNetUsers] ANU ON ANU.Id=t.UserId
				JOIN [dbo].[AspNetUserRoles] ANUR ON ANUR.UserId=ANU.Id
				LEFT JOIN [dbo].[AspNetRoles] ANR ON ANR.Id=ANUR.RoleId
				Where (@Id IS NULL OR t.Id=@Id)
				  AND (@CompanyId IS NULL OR t.CompanyId=@CompanyId)
				  AND (@BranchId IS NULL OR t.BranchId=@BranchId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.VendorCode like @SearchString) 
							OR (C.FirstName like @SearchString) 
							OR (C.LastName like @SearchString) 
							OR (C.EmailAddress like @SearchString) 
							OR (C.CellNumber like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
						,C.[NameStyle]
						,C.[NameTitle]
						,C.[NameTitleUrdu]
						,C.[FirstName]
						,C.[FirstNameUrdu]
						,C.[MiddleName]
						,C.[MiddleNameUrdu]
						,C.[LastName]
						,C.[LastNameUrdu]
						,C.[Suffix]
						,C.[SuffixUrdu]
						,C.[NationalIdNumber]
						,C.[EmailAddress]
						,C.[EmailPromotion]
						,C.[PhoneNumber]
						,C.[CellNumber]
						,C.[FaxNumber]
						,C.[BirthDate]
						,C.[BirthDay]
						,C.[BirthMonth]
						,C.[BirthYear]
						,C.[MaritalStatus]
						,C.[Gender]
						,C.[ContactImage]
						,C.[ContactTypeId]
						,C.[CasteId]
						,C.[SubCasteId]
						,C.[AboutContact]
						,C.[DivisionId]
						,main.CasteName
						,main.CasteNameUrdu
						,main.SubCasteName
						,main.SubCasteNameUrdu
						,main.ContactTypeName
						,main.ContactTypeNameUrdu
						,ISNULL(C.[FirstName],'') + ' ' + ISNULL(C.[MiddleName],'') + ' ' + ISNULL(C.[LastName],'') FullName
						,ISNULL(C.[FirstNameUrdu],'') + ' ' + ISNULL(C.[MiddleNameUrdu],'') + ' ' + ISNULL(C.[LastNameUrdu],'') FullNameUrdu
						,main.DivisionName
						,main.LoginEmail
						,main.LoginUserName
						,main.RoleName
						,M.TotalCount
				  FROM [dbo].[tblVendors] t
						JOIN [dbo].[tblContacts] C ON C.Id=t.ContactId
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.VendorId
					ORDER BY t.Id ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
GO
/****** Object:  StoredProcedure [dbo].[usp_HasPermissions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		M Tayyab Iqbal Ch
-- Create date: 
-- Description:	
-- =============================================
Create PROCEDURE [dbo].[usp_HasPermissions]
	-- Add the parameters for the function here
	@UserId nvarchar(128) = NULL,
	@MainUserId nvarchar(128) = NULL,
	@RoleId nvarchar(128) = NULL,
	@AreaRuleCode nvarchar(768) = NULL
AS
BEGIN

	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 UR.[HasAreaPermissions], UR.[ModulesAssigned], UR.[RightsAssigned] FROM [dbo].[tblAreaRules] AR
	JOIN [dbo].[tblApplicationAreas] AA ON AR.[ApplicationAreaId] = AA.Id
	JOIN [dbo].[tblMainModules] MM ON AA.[ModuleId] = MM.Id
	--JOIN [dbo].[AspNetRoles] ANR ON ANR.Name = @pRoleName
	CROSS APPLY (SELECT CONVERT(int, SUBSTRING(UP.[RightsAssigned], AR.Id, 1)) * CONVERT(int, SUBSTRING(UP.[ModulesAssigned], MM.Id, 1)) HasAreaPermissions, UP.[ModulesAssigned], UP.[RightsAssigned] FROM [dbo].[tblUserPermissions] UP
	WHERE UP.[UserId] = @UserId AND ISNULL(UP.[MainUserId], '') = ISNULL(@MainUserId, '') AND UP.[RoleId] = ISNULL(@RoleId, '')) UR
	WHERE AR.[AreaRuleCode] = ISNULL(@AreaRuleCode, AR.[AreaRuleCode]);

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertAreaNavigationAndRights]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_InsertAreaNavigationAndRights]
(
	@ApplicationAreaName NVARCHAR(256)=NULL,
	@ApplicationAreaCode NVARCHAR(256)=NULL,
	@ModuleId BIGINT =NULL
)
AS
BEGIN

Declare @AreaId BIGINT=1+(SELECT TOP(1) Id FROM [dbo].[tblApplicationAreas] Order By Id DESC);

Declare @NavigationParentId BIGINT=NULL;
Declare @NavigationId BIGINT=1+(SELECT TOP(1) Id FROM [dbo].[tblNavigations] Order By Id DESC);

IF NOT EXISTS (SELECT 1 FROM [dbo].[tblApplicationAreas] AR WHERE ApplicationAreaCode = 'ManageMatrimonials')
	BEGIN
		INSERT INTO [dbo].[tblApplicationAreas] (Id,ApplicationAreaName, ApplicationAreaCode, ModuleId, ParentId,RecordStatus) 
			VALUES(@AreaId,'Manage Matrimonials', 'ManageMatrimonials',2,NULL,1)
	END
	
IF NOT EXISTS(SELECT 1 FROM [dbo].[tblNavigations] N WHERE N.MenuTitle = 'Matrimonial')
	BEGIN
		INSERT INTO [dbo].[tblNavigations] (Id,[MenuTitle],[DisplayOrder],[ParentId],[ApplicationArea],[Area],[Controller],[Action],RecordStatus)
			 VALUES (@NavigationId,'Matrimonial',1,NULL,'Users',NULL,NULL,Null,1)
	END

	SET @NavigationParentId=@NavigationId
	SET @NavigationId =1+(SELECT TOP(1) Id FROM [dbo].[tblNavigations] Order By Id DESC);

IF NOT EXISTS(SELECT 1 FROM [dbo].[tblNavigations] N WHERE N.MenuTitle = 'Casts')
	BEGIN
		INSERT INTO [dbo].[tblNavigations] (Id,[MenuTitle],[DisplayOrder],[ParentId],[ApplicationArea],[Area],[Controller],[Action],RecordStatus)
			 VALUES (@NavigationId,'Casts',1,@NavigationParentId,'Users',NULL,'Casts','Index',1)
	END

	IF NOT EXISTS (SELECT 1 FROM [dbo].[tblAreaRules] AR WHERE AreaRuleCode = 'ViewCasts')
	BEGIN
		INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleName] ,[AreaRuleCode] ,[AreaDetails] ,[NavigationId])
			VALUES ( @AreaId,'View Casts' , 'ViewCasts', 'View Casts', @NavigationId )
			
		--1 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '1' ELSE ApplicationAreasPermissions END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '1' ELSE RightsAssigned END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203' 

		--0 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '0' ELSE ApplicationAreasPermissions END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '0' ELSE RightsAssigned END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203' 

	END

IF NOT EXISTS (SELECT 1 FROM [dbo].[tblAreaRules] AR WHERE AreaRuleCode = 'AddEditCast')
	BEGIN
		INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleName] ,[AreaRuleCode] ,[AreaDetails] ,[NavigationId])
			VALUES ( @AreaId,'Add / Edit Cast' , 'AddEditCast', 'Add / Edit Cast', NULL )
		
		--1 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '1' ELSE ApplicationAreasPermissions END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '1' ELSE RightsAssigned END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
	
		--0 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '0' ELSE ApplicationAreasPermissions END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '0' ELSE RightsAssigned END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203' 

	END

IF NOT EXISTS (SELECT 1 FROM [dbo].[tblAreaRules] AR WHERE AreaRuleCode = 'AddCast')
	BEGIN
		INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleName] ,[AreaRuleCode] ,[AreaDetails] ,[NavigationId])
			VALUES ( @AreaId,'Add Cast' , 'AddCast', 'Add Cast', NULL )
		
		--1 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '1' ELSE ApplicationAreasPermissions END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '1' ELSE RightsAssigned END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
	
		--0 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '0' ELSE ApplicationAreasPermissions END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '0' ELSE RightsAssigned END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203' 

	END

IF NOT EXISTS (SELECT 1 FROM [dbo].[tblAreaRules] AR WHERE AreaRuleCode = 'EditCast')
	BEGIN
		INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleName] ,[AreaRuleCode] ,[AreaDetails] ,[NavigationId])
			VALUES ( @AreaId,'Edit Cast' , 'EditCast', 'Edit Cast', NULL )
		
		--1 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '1' ELSE ApplicationAreasPermissions END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '1' ELSE RightsAssigned END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
	
		--0 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '0' ELSE ApplicationAreasPermissions END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '0' ELSE RightsAssigned END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203' 

	END

IF NOT EXISTS (SELECT 1 FROM [dbo].[tblAreaRules] AR WHERE AreaRuleCode = 'DeleteCast')
	BEGIN
		INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleName] ,[AreaRuleCode] ,[AreaDetails] ,[NavigationId])
			VALUES ( @AreaId,'Delete Cast' , 'DeleteCast', 'Delete Cast', NULL )
		
		--1 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '1' ELSE ApplicationAreasPermissions END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '1' ELSE RightsAssigned END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
	
		--0 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '0' ELSE ApplicationAreasPermissions END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '0' ELSE RightsAssigned END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203' 

	END

IF NOT EXISTS (SELECT 1 FROM [dbo].[tblAreaRules] AR WHERE AreaRuleCode = 'MarkActiveCast')
	BEGIN
		INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleName] ,[AreaRuleCode] ,[AreaDetails] ,[NavigationId])
			VALUES ( @AreaId,'Mark Active Cast' , 'MarkActiveCast', 'Mark Active Cast', NULL )
		
		--1 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '1' ELSE ApplicationAreasPermissions END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '1' ELSE RightsAssigned END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
	
		--0 for non admin users
		UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '0' ELSE ApplicationAreasPermissions END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203'
		UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '0' ELSE RightsAssigned END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203' 

	END


END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateAddress]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_InsertUpdateAddress](
			@Id bigint					   =NULL
		   ,@AddressTypeId bigint		   =NULL
           ,@AddressLine1 nvarchar(256)	   =NULL
           ,@AddressLine1Urdu nvarchar(256)=NULL
           ,@AddressLine2 nvarchar(256)	   =NULL
           ,@AddressLine2Urdu nvarchar(256)=NULL
           ,@CountryId bigint			   =NULL
           ,@Province nvarchar(50)		   =NULL
           ,@ProvinceUrdu nvarchar(50)	   =NULL
           ,@City nvarchar(50)			   =NULL
           ,@CityUrdu nvarchar(50)		   =NULL
           ,@ZipCode nvarchar(50)		   =NULL
		   ,@Command nvarchar(50)		   ='INSERT'
		   -----Contact Address Params
		   --,@UserId nvarchar(128) 		  =NULL
     --      ,@ContactId bigint 			  =NULL
     --      ,@AddressId bigint 			  =NULL
     --      ,@RecordStatus tinyint 		  =NULL
     --      ,@IsDefault bit 				  =NULL
     --      ,@CreatedDate datetimeoffset(7)=NULL
     --      ,@CreatedBy nvarchar(128) 	  =NULL
     --      ,@UpdatedDate datetimeoffset(7)=NULL
     --      ,@updatedBy nvarchar(128)	  =NULL

)

AS
SET NOCOUNT ON;
BEGIN

	IF((Isnull(@Command,'INSERT')='INSERT' AND @AddressTypeId IS NOT NULL) OR ISNULL(@Id,0)<=0)
		BEGIN

			INSERT INTO [dbo].[tblAddresses]
					   ([AddressTypeId]
					   ,[AddressLine1]
					   ,[AddressLine1Urdu]
					   ,[AddressLine2]
					   ,[AddressLine2Urdu]
					   ,[CountryId]
					   ,[Province]
					   ,[ProvinceUrdu]
					   ,[City]
					   ,[CityUrdu]
					   ,[ZipCode])
				 VALUES
					   (
						@AddressTypeId 
					   ,@AddressLine1 
					   ,@AddressLine1Urdu 
					   ,@AddressLine2 
					   ,@AddressLine2Urdu 
					   ,@CountryId
					   ,@Province
					   ,@ProvinceUrdu 
					   ,@City
					   ,@CityUrdu
					   ,@ZipCode
					   )

			SET @Id=@@IDENTITY
		END
	ELSE IF(@Id IS NOT NULL)
		BEGIN
			UPDATE [dbo].[tblAddresses]
			   SET [AddressTypeId] = ISNULL(@AddressTypeId,[AddressTypeId])
				  ,[AddressLine1] = ISNULL(@AddressLine1,[AddressLine1])
				  ,[AddressLine1Urdu] = ISNULL(@AddressLine1Urdu,[AddressLine1Urdu])
				  ,[AddressLine2] = ISNULL(@AddressLine2,[AddressLine2])
				  ,[AddressLine2Urdu] = ISNULL(@AddressLine2Urdu,[AddressLine2Urdu])
				  ,[CountryId] = ISNULL(@CountryId,[CountryId])
				  ,[Province] = ISNULL(@Province,[Province])
				  ,[ProvinceUrdu] = ISNULL(@ProvinceUrdu,[ProvinceUrdu])
				  ,[City] = ISNULL(@City,[City])
				  ,[CityUrdu] = ISNULL(@CityUrdu,[CityUrdu])
				  ,[ZipCode] = ISNULL(@ZipCode,[ZipCode])
			 WHERE Id=@Id

		END

		
			--EXEC [dbo].[usp_InsertUpdateContactAddress]
			--		@Id 			=@Id
			--	   ,@UserId 		=@UserId
			--	   ,@ContactId  	=@ContactId
			--	   ,@AddressId  	=@AddressId
			--	   ,@RecordStatus	=@RecordStatus
			--	   ,@IsDefault  	=@IsDefault
			--	   ,@CreatedDate	=@CreatedDate
			--	   ,@CreatedBy  	=@CreatedBy
			--	   ,@UpdatedDate	=@UpdatedDate
			--	   ,@updatedBy 		=@updatedBy
			--	   ,@Command 		=@Command
END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateCompanyType]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_InsertUpdateCompanyType]
(
	 @Id bigint =null
	,@TypeDescription nvarchar(100) =null
    ,@RecordStatus tinyint =null
	,@Command nvarchar(100) =null

)
AS 

BEGIN

	IF(ISNULL(@Command,'Insert')='Insert' OR ISNULL(@Id,0)<=0)
	BEGIN
		INSERT INTO [dbo].[tblCompanyTypes]
				   ([TypeDescription]
				   ,[RecordStatus])
			 VALUES
				   (@TypeDescription
				   ,@RecordStatus)
	END
	ELSE IF(ISNULL(@Command,'Insert')='Update' OR ISNULL(@Id,0)>0)
	BEGIN
		UPDATE [dbo].[tblCompanyTypes]
		   SET [TypeDescription] = @TypeDescription
			  ,[RecordStatus] = @RecordStatus
		 WHERE Id=@Id

	END

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateContact]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_InsertUpdateContact]
(
			@Id bigint 					   =NULL
		   ,@ContactTypeId bigint 		   =NULL
           ,@NameStyle bit 				   =NULL
           ,@NameTitle nchar(20) 		   =NULL
           ,@NameTitleUrdu nchar(20) 	   =NULL
           ,@FirstName nvarchar(50) 	   =NULL
           ,@FirstNameUrdu nvarchar(100)   =NULL
           ,@MiddleName nvarchar(50) 	   =NULL
           ,@MiddleNameUrdu nvarchar(50)   =NULL
           ,@LastName nvarchar(50) 		   =NULL
           ,@LastNameUrdu nvarchar(100)    =NULL
           ,@Suffix nchar(20) 			   =NULL
           ,@SuffixUrdu nchar(20) 		   =NULL
           ,@NationalIdNumber nvarchar(200)=NULL
           ,@EmailAddress nvarchar(50) 	   =NULL
           ,@EmailPromotion bit 		   =NULL
           ,@PhoneNumber nvarchar(50) 	   =NULL
           ,@CellNumber nvarchar(50) 	   =NULL
           ,@FaxNumber nvarchar(50) 	   =NULL
           ,@BirthDate datetime 		   =NULL
           ,@BirthDay int 				   =NULL
           ,@BirthMonth int 			   =NULL
           ,@BirthYear int 				   =NULL
           ,@MaritalStatus nvarchar(50)    =NULL
           ,@Gender nvarchar(20) 		   =NULL
           ,@CasteId bigint 			   =NULL
           ,@SubCasteId bigint 			   =NULL
           ,@AboutContact nvarchar(500)    =NULL
           ,@ContactImage nvarchar(256)	   =NULL
           ,@DivisionId bigint 			  =NULL
		   ,@Command nvarchar(50)		   ='INSERT'

)

AS 
SET NOCOUNT ON;

	BEGIN
	IF(ISNULL(@Command,'INSERT')='INSERT' AND @FirstName IS NOT NULL)
		BEGIN
			INSERT INTO [dbo].[tblContacts]
					   ([ContactTypeId]
					   ,[NameStyle]
					   ,[NameTitle]
					   ,[NameTitleUrdu]
					   ,[FirstName]
					   ,[FirstNameUrdu]
					   ,[MiddleName]
					   ,[MiddleNameUrdu]
					   ,[LastName]
					   ,[LastNameUrdu]
					   ,[Suffix]
					   ,[SuffixUrdu]
					   ,[NationalIdNumber]
					   ,[EmailAddress]
					   ,[EmailPromotion]
					   ,[PhoneNumber]
					   ,[CellNumber]
					   ,[FaxNumber]
					   ,[BirthDate]
					   ,[BirthDay]
					   ,[BirthMonth]
					   ,[BirthYear]
					   ,[MaritalStatus]
					   ,[Gender]
					   ,[CasteId]
					   ,[SubCasteId]
					   ,[AboutContact]
					   ,[ContactImage]
					   ,[DivisionId])
				 VALUES
					   (@ContactTypeId    
					   ,@NameStyle   
					   ,@NameTitle  
					   ,@NameTitleUrdu  
					   ,@FirstName  
					   ,@FirstNameUrdu  
					   ,@MiddleName  
					   ,@MiddleNameUrdu  
					   ,@LastName  
					   ,@LastNameUrdu  
					   ,@Suffix  
					   ,@SuffixUrdu  
					   ,@NationalIdNumber  
					   ,@EmailAddress  
					   ,@EmailPromotion   
					   ,@PhoneNumber  
					   ,@CellNumber  
					   ,@FaxNumber  
					   ,@BirthDate  
					   ,@BirthDay   
					   ,@BirthMonth   
					   ,@BirthYear   
					   ,@MaritalStatus  
					   ,@Gender 
					   ,@CasteId    
					   ,@SubCasteId    
					   ,@AboutContact  
					   ,@ContactImage
					   ,@DivisionId)
		END
	ELSE  IF(@Id IS NOT NULL)
		BEGIN
		
			UPDATE [dbo].[tblContacts]
			   SET [ContactTypeId] = ISNULL(@ContactTypeId,  [ContactTypeId])
				  ,[NameStyle] = ISNULL(@NameStyle, [NameStyle] )
				  ,[NameTitle] = ISNULL(@NameTitle, [NameTitle] )
				  ,[NameTitleUrdu] = ISNULL(@NameTitleUrdu, [NameTitleUrdu] )
				  ,[FirstName] = ISNULL(@FirstName, [FirstName] )
				  ,[FirstNameUrdu] = ISNULL(@FirstNameUrdu,  [FirstNameUrdu])
				  ,[MiddleName] = ISNULL(@MiddleName, [MiddleName] )
				  ,[MiddleNameUrdu] = ISNULL(@MiddleNameUrdu,[MiddleNameUrdu]  )
				  ,[LastName] = ISNULL(@LastName, [LastName] )
				  ,[LastNameUrdu] = ISNULL(@LastNameUrdu, [LastNameUrdu] )
				  ,[Suffix] = ISNULL(@Suffix,[Suffix])
				  ,[SuffixUrdu] = ISNULL(@SuffixUrdu, [SuffixUrdu] )
				  ,[NationalIdNumber] = ISNULL(@NationalIdNumber, [NationalIdNumber] )
				  ,[EmailAddress] = ISNULL(@EmailAddress, [EmailAddress] )
				  ,[EmailPromotion] = ISNULL(@EmailPromotion, [EmailPromotion] )
				  ,[PhoneNumber] = ISNULL(@PhoneNumber,  [PhoneNumber])
				  ,[CellNumber] = ISNULL(@CellNumber,  [CellNumber])
				  ,[FaxNumber] = ISNULL(@FaxNumber,  [FaxNumber])
				  ,[BirthDate] = ISNULL(@BirthDate, [BirthDate] )
				  ,[BirthDay] = ISNULL(@BirthDay, [BirthDay] )
				  ,[BirthMonth] = ISNULL(@BirthMonth,[BirthMonth]  )
				  ,[BirthYear] = ISNULL(@BirthYear, [BirthYear] )
				  ,[MaritalStatus] = ISNULL(@MaritalStatus, [MaritalStatus] )
				  ,[Gender] = ISNULL(@Gender, [Gender] )
				  ,[CasteId] = ISNULL(@CasteId, [CasteId] )
				  ,[SubCasteId] = ISNULL(@SubCasteId,[SubCasteId]  )
				  ,[AboutContact] = ISNULL(@AboutContact, [AboutContact] )
				  ,[ContactImage] = ISNULL(@ContactImage, [ContactImage] )
				  ,[DivisionId] = ISNULL(@DivisionId, [DivisionId] )
			 WHERE Id=@Id

		END

	END

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateContactAddress]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_InsertUpdateContactAddress](
			@Id bigint					  =NULL
		   ,@UserId nvarchar(128) 		  =NULL
           ,@ContactId bigint 			  =NULL
           ,@AddressId bigint 			  =NULL
           ,@RecordStatus tinyint 		  =NULL
           ,@IsDefault bit 				  =NULL
           ,@CreatedDate datetimeoffset(7)=NULL
           ,@CreatedBy nvarchar(128) 	  =NULL
           ,@UpdatedDate datetimeoffset(7)=NULL
           ,@updatedBy nvarchar(128)	  =NULL
		   ,@Command nvarchar(50)		  ='INSERT'
		   ----Address
		   ,@AddressTypeId bigint		   =NULL
           ,@AddressLine1 nvarchar(256)	   =NULL
           ,@AddressLine1Urdu nvarchar(256)=NULL
           ,@AddressLine2 nvarchar(256)	   =NULL
           ,@AddressLine2Urdu nvarchar(256)=NULL
           ,@CountryId bigint			   =NULL
           ,@Province nvarchar(50)		   =NULL
           ,@ProvinceUrdu nvarchar(50)	   =NULL
           ,@City nvarchar(50)			   =NULL
           ,@CityUrdu nvarchar(50)		   =NULL
           ,@ZipCode nvarchar(50)		   =NULL

)

AS
SET NOCOUNT ON;
BEGIN

	----Insert/Update Address 
	IF(ISNULL(@ContactId,0)>0)
		BEGIN
				EXEC [dbo].[usp_InsertUpdateAddress]
						@Id = @AddressId,
						@AddressTypeId = @AddressTypeId,
						@AddressLine1 = @AddressLine1,
						@AddressLine1Urdu = @AddressLine1Urdu,
						@AddressLine2 = @AddressLine2,
						@AddressLine2Urdu = @AddressLine2Urdu,
						@CountryId = @CountryId,
						@Province = @Province,
						@ProvinceUrdu = @ProvinceUrdu,
						@City = @City,
						@CityUrdu = @CityUrdu,
						@ZipCode = @ZipCode,
						@Command = @Command

			IF(ISNULL(@Command,'INSERT')='INSERT' OR ISNULL(@AddressId,0)<=0)
				BEGIN
					SET @AddressId = @@IDENTITY
				END
		END

	IF((Isnull(@Command,'INSERT')='INSERT' AND ISNULL(@ContactId,0)>0) OR ISNULL(@Id,0)<=0)
		BEGIN

			INSERT INTO  [dbo].[tblContactAddresses]
					   ([UserId]
					   ,[ContactId]
					   ,[AddressId]
					   ,[RecordStatus]
					   ,[IsDefault]
					   ,[CreatedDate]
					   ,[CreatedBy]
					   ,[UpdatedDate]
					   ,[UpdatedBy])
				 VALUES
					   (@UserId
					   ,@ContactId  
					   ,@AddressId  
					   ,@RecordStatus  
					   ,@IsDefault  
					   ,GETUTCDATE() 
					   ,@CreatedBy 
					   ,@UpdatedDate 
					   ,@UpdatedBy  )
			
		END
	ELSE IF(ISNULL(@Id,0)>0)
		BEGIN
			
			UPDATE  [dbo].[tblContactAddresses]
			   SET [UserId] = ISNULL(@UserId, [UserId])
				  ,[ContactId] = ISNULL(@ContactId, [ContactId])
				  ,[AddressId] = ISNULL(@AddressId, [AddressId])
				  ,[RecordStatus] = ISNULL(@RecordStatus, [RecordStatus])
				  ,[IsDefault] = ISNULL(@IsDefault, [IsDefault])
				  ,[UpdatedDate] = GETUTCDATE()
				  ,[UpdatedBy] = ISNULL(@UpdatedBy, [UpdatedBy])
			 WHERE Id=@Id
		
		END
END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateCustomer]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_InsertUpdateCustomer]
(
			@Id BIGINT						=NULL
           ,@MainUserId nvarchar(128) 		=NULL
           ,@UserId nvarchar(128) 			=NULL
           ,@CompanyId bigint 				=NULL
           ,@BranchId bigint 				=NULL
           ,@ContactId bigint 				=NULL
           ,@TerritoryID bigint 			=NULL
           ,@CustomerType nchar(20) 		=NULL
           ,@RecordStatus int 				=NULL
           ,@CreatedBy nvarchar(128) 		=NULL
           ,@CreatedDate datetimeoffset(7) 	=NULL
           ,@UpdatedBy nvarchar(128) 		=NULL
           ,@UpdatedDate datetimeoffset(7) 	=NULL
		   ,@Command NVARCHAR(100)			='INSERT'
		   --Contact Params
		   ,@ContactTypeId bigint 		   =NULL
           ,@NameStyle bit 				   =NULL
           ,@NameTitle nchar(20) 		   =NULL
           ,@NameTitleUrdu nchar(20) 	   =NULL
           ,@FirstName nvarchar(50) 	   =NULL
           ,@FirstNameUrdu nvarchar(100)   =NULL
           ,@MiddleName nvarchar(50) 	   =NULL
           ,@MiddleNameUrdu nvarchar(50)   =NULL
           ,@LastName nvarchar(50) 		   =NULL
           ,@LastNameUrdu nvarchar(100)    =NULL
           ,@Suffix nchar(20) 			   =NULL
           ,@SuffixUrdu nchar(20) 		   =NULL
           ,@NationalIdNumber nvarchar(200)=NULL
           ,@EmailAddress nvarchar(50) 	   =NULL
           ,@EmailPromotion bit 		   =NULL
           ,@PhoneNumber nvarchar(50) 	   =NULL
           ,@CellNumber nvarchar(50) 	   =NULL
           ,@FaxNumber nvarchar(50) 	   =NULL
           ,@BirthDate datetime 		   =NULL
           ,@BirthDay int 				   =NULL
           ,@BirthMonth int 			   =NULL
           ,@BirthYear int 				   =NULL
           ,@MaritalStatus nvarchar(50)    =NULL
           ,@Gender nvarchar(20) 		   =NULL
           ,@CasteId bigint 			   =NULL
           ,@SubCasteId bigint 			   =NULL
           ,@AboutContact nvarchar(500)    =NULL
           ,@ContactImage nvarchar(256)	   =NULL
		   --Address Params
		   ,@AddressTypeId bigint		   =NULL
           ,@AddressLine1 nvarchar(256)	   =NULL
           ,@AddressLine1Urdu nvarchar(256)=NULL
           ,@AddressLine2 nvarchar(256)	   =NULL
           ,@AddressLine2Urdu nvarchar(256)=NULL
           ,@CountryId bigint			   =NULL
           ,@Province nvarchar(50)		   =NULL
           ,@ProvinceUrdu nvarchar(50)	   =NULL
           ,@City nvarchar(50)			   =NULL
           ,@CityUrdu nvarchar(50)		   =NULL
           ,@ZipCode nvarchar(50)		   =NULL
		   ,@IsAllowtoCreateUser bit	   =NULL
		   ---Contact Address Params
           ,@AddressId bigint 			  =NULL
           ,@ContactAddressId bigint 	  =NULL
           ,@IsDefault bit 				  =NULL
           ,@DivisionId bigint 			  =NULL
)

AS

SET NOCOUNT ON;

BEGIN

	
	
			--Insert/Update Contact
			
				EXEC [dbo].[usp_InsertUpdateContact]
						@Id = @ContactId,
						@ContactTypeId = @ContactTypeId,
						@NameStyle = @NameStyle,
						@NameTitle = @NameTitle,
						@NameTitleUrdu = @NameTitleUrdu,
						@FirstName = @FirstName,
						@FirstNameUrdu = @FirstNameUrdu,
						@MiddleName = @MiddleName,
						@MiddleNameUrdu = @MiddleNameUrdu,
						@LastName = @LastName,
						@LastNameUrdu = @LastNameUrdu,
						@Suffix = @Suffix,
						@SuffixUrdu = @SuffixUrdu,
						@NationalIdNumber = @NationalIdNumber,
						@EmailAddress = @EmailAddress,
						@EmailPromotion = @EmailPromotion,
						@PhoneNumber = @PhoneNumber,
						@CellNumber = @CellNumber,
						@FaxNumber = @FaxNumber,
						@BirthDate = @BirthDate,
						@BirthDay = @BirthDay,
						@BirthMonth = @BirthMonth,
						@BirthYear = @BirthYear,
						@MaritalStatus = @MaritalStatus,
						@Gender = @Gender,
						@CasteId = @CasteId,
						@SubCasteId = @SubCasteId,
						@AboutContact = @AboutContact,
						@ContactImage = @ContactImage,
						@DivisionId = @DivisionId,
						@Command = @Command
						
						IF(ISNULL(@Command,'INSERT')='INSERT' AND ISNULL(@ContactId,0)<=0)
							BEGIN
								SET @ContactId=IDENT_CURRENT('tblContacts')
							END
						
						----Insert/Update Contact Address and Address

							EXEC [dbo].[usp_InsertUpdateContactAddress]
									@Id = @ContactAddressId,
									@UserId = @UserId,
									@ContactId = @ContactId,
									@AddressId = @AddressId,
									@RecordStatus = @RecordStatus,
									@IsDefault = @IsDefault,
									@CreatedDate = @CreatedDate,
									@CreatedBy = @CreatedBy,
									@UpdatedDate = @UpdatedDate,
									@updatedBy = @updatedBy,
									@Command = @Command,
									----Address
									@AddressTypeId = @AddressTypeId,
									@AddressLine1 = @AddressLine1,
									@AddressLine1Urdu = @AddressLine1Urdu,
									@AddressLine2 = @AddressLine2,
									@AddressLine2Urdu = @AddressLine2Urdu,
									@CountryId = @CountryId,
									@Province = @Province,
									@ProvinceUrdu = @ProvinceUrdu,
									@City = @City,
									@CityUrdu = @CityUrdu,
									@ZipCode = @ZipCode


					IF(ISNULL(@Command,'INSERT')='INSERT')
						BEGIN
							SET @AddressId = IDENT_CURRENT('tblAddresses')
							SET @ContactAddressId = IDENT_CURRENT('tblContactAddresses')
						END

	IF(ISNULL(@Command,'INSERT')='INSERT' OR ISNULL(@Id,0)<=0)
		BEGIN
			
			INSERT INTO [dbo].[tblCustomers]
					   ([MainUserId]
					   ,[UserId]
					   ,[CompanyId]
					   ,[BranchId]
					   ,[ContactId]
					   ,[TerritoryID]
					   ,[CustomerType]
					   ,[RecordStatus]
					   ,[CreatedBy]
					   ,[CreatedDate]
					   ,[UpdatedBy]
					   ,[UpdatedDate])
				 VALUES
					   (@MainUserId  
					   ,@UserId  
					   ,@CompanyId  
					   ,@BranchId  
					   ,@ContactId  
					   ,@TerritoryID  
					   ,@CustomerType 
					   ,@RecordStatus 
					   ,@CreatedBy  
					   ,GETUTCDATE() 
					   ,@UpdatedBy  
					   ,@UpdatedDate )

			SET @Id=@@IDENTITY
		END
	ELSE IF(ISNULL(@Id,0)>0)
		BEGIN
			UPDATE [dbo].[tblCustomers]
			   SET [MainUserId] = ISNULL(@MainUserId, [MainUserId] )
				  ,[UserId] = ISNULL(@UserId,  [UserId])
				  ,[CompanyId] = ISNULL(@CompanyId, [CompanyId] )
				  ,[BranchId] = ISNULL(@BranchId,  [BranchId])
				  ,[ContactId] = ISNULL(@ContactId, [ContactId] )
				  ,[TerritoryID] = ISNULL(@TerritoryID, [TerritoryID] )
				  ,[CustomerType] = ISNULL(@CustomerType, [CustomerType] )
				  ,[RecordStatus] = ISNULL(@RecordStatus, [RecordStatus] )
				  ,[UpdatedBy] = ISNULL(@UpdatedBy,  [UpdatedBy])
				  ,[UpdatedDate] = GETUTCDATE()
			 WHERE Id=@Id

		END

		
		IF(@IsAllowtoCreateUser=1)
			BEGIN
				EXEC [dbo].[usp_InsertUpdateUserInformation]
						@UserId = @UserId,
						@ContactId = @ContactId,
						@CompanyId = @CompanyId,
						@BranchId = @BranchId,
						@RecordStatus = @RecordStatus,
						@CreatedBy = @CreatedBy,
						@Command = @Command,
						@IsManulaCreatedUser = 1,
						@ActionPerformedBy = @CreatedBy,
						@ActionPerformed = 'User Created'

			END

		EXEC [dbo].[usp_GetContacts] @Id=@ContactId

	--SELECT @Id AS Id, @ContactId AS ContactId, @ContactAddressId AS ContactAddressId, @AddressId AS AddressId

END
----UPDATE 
--exec [dbo].[usp_InsertUpdateCustomer] @Id=N'4',@MainUserId=N'320c5299-8947-4295-9471-dde57aeed3f0',@UserId=N'92ba3c01-6387-4d39-9dd7-7943c9ddc896',@CompanyId=1,@BranchId=1,@ContactId=9,@TerritoryID=0,@CustomerType=N'INDIVIDUAL',@RecordStatus=1,@CreatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@CreatedDate='2020-09-03 10:00:46 +00:00',@UpdatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@UpdatedDate='0001-01-01 00:00:00 +00:00',@Command=N'UPDATE',@ContactTypeId=2,@NameStyle=N'False',@NameTitle=N'Mr.',@NameTitleUrdu=N'مسٹر',@FirstName=N'Test',@FirstNameUrdu=N'ٹیسٹ',@MiddleName=default,@MiddleNameUrdu=default,@LastName=N'Customer',@LastNameUrdu=N'کسٹمر',@Suffix=default,@SuffixUrdu=default,@NationalIdNumber=N'023326',@EmailAddress=N'customer4@iiki.com',@EmailPromotion=0,@PhoneNumber=default,@CellNumber=N'62622',@FaxNumber=default,@BirthDate='2020-09-03 00:00:00',@BirthDay=3,@BirthMonth=9,@BirthYear=2020,@MaritalStatus=N'SINGLE',@Gender=N'MALE',@CasteId=1,@SubCasteId=2,@AboutContact=default,@ContactImage=default,@IsAllowtoCreateUser=1,@AddressTypeId=3,@AddressLine1=N'Lahore',@AddressLine1Urdu=N'لاہور',@AddressLine2=default,@AddressLine2Urdu=default,@CountryId=160,@Province=N'Punjab',@ProvinceUrdu=N'پنجاب',@City=N'Lahore',@CityUrdu=N'لاہور',@ZipCode=N'54000',@AddressId=9,@ContactAddressId=9,@IsDefault=1
----INSERT 
--exec [dbo].[usp_InsertUpdateCustomer] @Id=N'0',@MainUserId=N'320c5299-8947-4295-9471-dde57aeed3f0',@UserId=N'2e23db42-661b-453c-81ee-7738e66e1def',@CompanyId=1,@BranchId=1,@ContactId=0,@TerritoryID=0,@CustomerType=N'INDIVIDUAL',@RecordStatus=1,@CreatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@CreatedDate='0001-01-01 00:00:00 +00:00',@UpdatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@UpdatedDate='0001-01-01 00:00:00 +00:00',@Command=N'INSERT',@ContactTypeId=0,@NameStyle=N'False',@NameTitle=N'Ms.',@NameTitleUrdu=N'مس',@FirstName=N'Test ',@FirstNameUrdu=N'ٹیسٹ',@MiddleName=default,@MiddleNameUrdu=default,@LastName=N'Customer',@LastNameUrdu=N'کسٹمر',@Suffix=default,@SuffixUrdu=default,@NationalIdNumber=N'212121212',@EmailAddress=N'customer7@iiki.com',@EmailPromotion=0,@PhoneNumber=default,@CellNumber=N'2121212',@FaxNumber=default,@BirthDate='2020-09-15 00:00:00',@BirthDay=15,@BirthMonth=9,@BirthYear=2020,@MaritalStatus=N'SINGLE',@Gender=N'FEMALE',@CasteId=1,@SubCasteId=2,@AboutContact=default,@ContactImage=default,@IsAllowtoCreateUser=1,@AddressTypeId=3,@AddressLine1=N'Lahore ',@AddressLine1Urdu=N'لاہور',@AddressLine2=default,@AddressLine2Urdu=default,@CountryId=160,@Province=N'Punjab',@ProvinceUrdu=N'پنجاب',@City=N'Lahore ',@CityUrdu=N'لاہور',@ZipCode=N'54000',@AddressId=0,@ContactAddressId=0,@IsDefault=1
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateEmployee]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_InsertUpdateEmployee]
(
			@Id BIGINT						=NULL
           ,@MainUserId nvarchar(128) 		=NULL
           ,@UserId nvarchar(128) 			=NULL
           ,@CompanyId bigint 				=NULL
           ,@BranchId bigint 				=NULL
           ,@ContactId bigint 				=NULL
           ,@ManagerId bigint 			=NULL
           ,@EmployeeType nchar(20) 		=NULL
           ,@JobTitle nvarchar(128) 		=NULL
           ,@HiringDate datetimeoffset(7) 	=NULL
           ,@SalaryType tinyint 			=NULL
           ,@VacationHours smallint 		=NULL
           ,@SickLeaveHours smallint 		=NULL
           ,@TotalAllowedVacations smallint	=NULL
           ,@RecordStatus int 				=NULL
           ,@CreatedBy nvarchar(128) 		=NULL
           ,@CreatedDate datetimeoffset(7) 	=NULL
           ,@UpdatedBy nvarchar(128) 		=NULL
           ,@UpdatedDate datetimeoffset(7) 	=NULL
		   ,@Command NVARCHAR(100)			='INSERT'
		   --Contact Params
		   ,@ContactTypeId bigint 		   =NULL
           ,@NameStyle bit 				   =NULL
           ,@NameTitle nchar(20) 		   =NULL
           ,@NameTitleUrdu nchar(20) 	   =NULL
           ,@FirstName nvarchar(50) 	   =NULL
           ,@FirstNameUrdu nvarchar(100)   =NULL
           ,@MiddleName nvarchar(50) 	   =NULL
           ,@MiddleNameUrdu nvarchar(50)   =NULL
           ,@LastName nvarchar(50) 		   =NULL
           ,@LastNameUrdu nvarchar(100)    =NULL
           ,@Suffix nchar(20) 			   =NULL
           ,@SuffixUrdu nchar(20) 		   =NULL
           ,@NationalIdNumber nvarchar(200)=NULL
           ,@EmailAddress nvarchar(50) 	   =NULL
           ,@EmailPromotion bit 		   =NULL
           ,@PhoneNumber nvarchar(50) 	   =NULL
           ,@CellNumber nvarchar(50) 	   =NULL
           ,@FaxNumber nvarchar(50) 	   =NULL
           ,@BirthDate datetime 		   =NULL
           ,@BirthDay int 				   =NULL
           ,@BirthMonth int 			   =NULL
           ,@BirthYear int 				   =NULL
           ,@MaritalStatus nvarchar(50)    =NULL
           ,@Gender nvarchar(20) 		   =NULL
           ,@CasteId bigint 			   =NULL
           ,@SubCasteId bigint 			   =NULL
           ,@AboutContact nvarchar(500)    =NULL
           ,@ContactImage nvarchar(256)	   =NULL
		   --Address Params
		   ,@AddressTypeId bigint		   =NULL
           ,@AddressLine1 nvarchar(256)	   =NULL
           ,@AddressLine1Urdu nvarchar(256)=NULL
           ,@AddressLine2 nvarchar(256)	   =NULL
           ,@AddressLine2Urdu nvarchar(256)=NULL
           ,@CountryId bigint			   =NULL
           ,@Province nvarchar(50)		   =NULL
           ,@ProvinceUrdu nvarchar(50)	   =NULL
           ,@City nvarchar(50)			   =NULL
           ,@CityUrdu nvarchar(50)		   =NULL
           ,@ZipCode nvarchar(50)		   =NULL
		   ,@IsAllowtoCreateUser bit	   =NULL
		   ---Contact Address Params
           ,@AddressId bigint 			  =NULL
           ,@ContactAddressId bigint 	  =NULL
           ,@IsDefault bit 				  =NULL
           ,@DivisionId bigint 			  =NULL
)

AS

SET NOCOUNT ON;

BEGIN

	
	
			--Insert/Update Contact
			
				EXEC [dbo].[usp_InsertUpdateContact]
						@Id = @ContactId,
						@ContactTypeId = @ContactTypeId,
						@NameStyle = @NameStyle,
						@NameTitle = @NameTitle,
						@NameTitleUrdu = @NameTitleUrdu,
						@FirstName = @FirstName,
						@FirstNameUrdu = @FirstNameUrdu,
						@MiddleName = @MiddleName,
						@MiddleNameUrdu = @MiddleNameUrdu,
						@LastName = @LastName,
						@LastNameUrdu = @LastNameUrdu,
						@Suffix = @Suffix,
						@SuffixUrdu = @SuffixUrdu,
						@NationalIdNumber = @NationalIdNumber,
						@EmailAddress = @EmailAddress,
						@EmailPromotion = @EmailPromotion,
						@PhoneNumber = @PhoneNumber,
						@CellNumber = @CellNumber,
						@FaxNumber = @FaxNumber,
						@BirthDate = @BirthDate,
						@BirthDay = @BirthDay,
						@BirthMonth = @BirthMonth,
						@BirthYear = @BirthYear,
						@MaritalStatus = @MaritalStatus,
						@Gender = @Gender,
						@CasteId = @CasteId,
						@SubCasteId = @SubCasteId,
						@AboutContact = @AboutContact,
						@ContactImage = @ContactImage,
						@DivisionId = @DivisionId,
						@Command = @Command
						
						IF(ISNULL(@Command,'INSERT')='INSERT' AND ISNULL(@ContactId,0)<=0)
							BEGIN
								SET @ContactId=IDENT_CURRENT('tblContacts')
							END
						

						----Insert/Update Contact Address and Address

							EXEC [dbo].[usp_InsertUpdateContactAddress]
									@Id = @ContactAddressId,
									@UserId = @UserId,
									@ContactId = @ContactId,
									@AddressId = @AddressId,
									@RecordStatus = @RecordStatus,
									@IsDefault = @IsDefault,
									@CreatedDate = @CreatedDate,
									@CreatedBy = @CreatedBy,
									@UpdatedDate = @UpdatedDate,
									@updatedBy = @updatedBy,
									@Command = @Command,
									----Address
									@AddressTypeId = @AddressTypeId,
									@AddressLine1 = @AddressLine1,
									@AddressLine1Urdu = @AddressLine1Urdu,
									@AddressLine2 = @AddressLine2,
									@AddressLine2Urdu = @AddressLine2Urdu,
									@CountryId = @CountryId,
									@Province = @Province,
									@ProvinceUrdu = @ProvinceUrdu,
									@City = @City,
									@CityUrdu = @CityUrdu,
									@ZipCode = @ZipCode


					IF(ISNULL(@Command,'INSERT')='INSERT')
						BEGIN
							SET @AddressId = IDENT_CURRENT('tblAddresses')
							SET @ContactAddressId = IDENT_CURRENT('tblContactAddresses')
						END

	IF(ISNULL(@Command,'INSERT')='INSERT' OR ISNULL(@Id,0)<=0)
		BEGIN
			
			INSERT INTO [dbo].[tblEmployees]
					   ([MainUserId]
					   ,[UserId]
					   ,[CompanyId]
					   ,[BranchId]
					   ,[ContactId]
					   ,[ManagerId]
					   ,[EmployeeType]
					   ,[JobTitle]
					   ,[HiringDate]
					   ,[SalaryType]
					   ,[VacationHours]
					   ,[SickLeaveHours]
					   ,[TotalAllowedVacations]
					   ,[RecordStatus]
					   ,[CreatedBy]
					   ,[CreatedDate]
					   ,[UpdatedBy]
					   ,[UpdatedDate])
				 VALUES
					   (@MainUserId  
					   ,@UserId  
					   ,@CompanyId  
					   ,@BranchId  
					   ,@ContactId  
					   ,@ManagerId  
					   ,@EmployeeType 
					   ,@JobTitle 
					   ,@HiringDate
					   ,@SalaryType
					   ,@VacationHours 
					   ,@SickLeaveHours 
					   ,@TotalAllowedVacations 
					   ,@RecordStatus 
					   ,@CreatedBy  
					   ,GETUTCDATE() 
					   ,@UpdatedBy  
					   ,@UpdatedDate )

			SET @Id=@@IDENTITY
		END
	ELSE IF(ISNULL(@Id,0)>0)
		BEGIN
			UPDATE [dbo].[tblEmployees]
			   SET [MainUserId] = ISNULL(@MainUserId, [MainUserId] )
				  ,[UserId] = ISNULL(@UserId,  [UserId])
				  ,[CompanyId] = ISNULL(@CompanyId, [CompanyId] )
				  ,[BranchId] = ISNULL(@BranchId,  [BranchId])
				  ,[ContactId] = ISNULL(@ContactId, [ContactId] )
				  ,[ManagerId] = ISNULL(@ManagerId, [ManagerId] )
				  ,[EmployeeType] = ISNULL(@EmployeeType, [EmployeeType] )
				  ,[JobTitle] = ISNULL(@JobTitle, [JobTitle] )
				  ,[HiringDate] = ISNULL(@HiringDate, [HiringDate] )
				  ,[SalaryType] = ISNULL(@SalaryType, [SalaryType] )
				  ,[VacationHours] = ISNULL(@VacationHours, [VacationHours] )
				  ,[SickLeaveHours] = ISNULL(@SickLeaveHours, [SickLeaveHours] )
				  ,[TotalAllowedVacations] = ISNULL(@TotalAllowedVacations, [TotalAllowedVacations] )
				  ,[RecordStatus] = ISNULL(@RecordStatus, [RecordStatus] )
				  ,[UpdatedBy] = ISNULL(@UpdatedBy,  [UpdatedBy])
				  ,[UpdatedDate] = GETUTCDATE()
			 WHERE Id=@Id

		END

		
		IF(@IsAllowtoCreateUser=1)
			BEGIN
				EXEC [dbo].[usp_InsertUpdateUserInformation]
						@UserId = @UserId,
						@ContactId = @ContactId,
						@CompanyId = @CompanyId,
						@BranchId = @BranchId,
						@RecordStatus = @RecordStatus,
						@CreatedBy = @CreatedBy,
						@Command = @Command,
						@IsManulaCreatedUser = 1,
						@ActionPerformedBy = @CreatedBy,
						@ActionPerformed = 'User Created'

			END

		EXEC [dbo].[usp_GetContacts] @Id=@ContactId

	--SELECT @Id AS Id, @ContactId AS ContactId, @ContactAddressId AS ContactAddressId, @AddressId AS AddressId

END
----UPDATE 
--exec [dbo].[usp_InsertUpdateEmployee] @Id=N'4',@MainUserId=N'320c5299-8947-4295-9471-dde57aeed3f0',@UserId=N'92ba3c01-6387-4d39-9dd7-7943c9ddc896',@CompanyId=1,@BranchId=1,@ContactId=9,@ManagerId=0,@EmployeeType=N'INDIVIDUAL',@RecordStatus=1,@CreatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@CreatedDate='2020-09-03 10:00:46 +00:00',@UpdatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@UpdatedDate='0001-01-01 00:00:00 +00:00',@Command=N'UPDATE',@ContactTypeId=2,@NameStyle=N'False',@NameTitle=N'Mr.',@NameTitleUrdu=N'مسٹر',@FirstName=N'Test',@FirstNameUrdu=N'ٹیسٹ',@MiddleName=default,@MiddleNameUrdu=default,@LastName=N'Employee',@LastNameUrdu=N'کسٹمر',@Suffix=default,@SuffixUrdu=default,@NationalIdNumber=N'023326',@EmailAddress=N'Employee4@iiki.com',@EmailPromotion=0,@PhoneNumber=default,@CellNumber=N'62622',@FaxNumber=default,@BirthDate='2020-09-03 00:00:00',@BirthDay=3,@BirthMonth=9,@BirthYear=2020,@MaritalStatus=N'SINGLE',@Gender=N'MALE',@CasteId=1,@SubCasteId=2,@AboutContact=default,@ContactImage=default,@IsAllowtoCreateUser=1,@AddressTypeId=3,@AddressLine1=N'Lahore',@AddressLine1Urdu=N'لاہور',@AddressLine2=default,@AddressLine2Urdu=default,@CountryId=160,@Province=N'Punjab',@ProvinceUrdu=N'پنجاب',@City=N'Lahore',@CityUrdu=N'لاہور',@ZipCode=N'54000',@AddressId=9,@ContactAddressId=9,@IsDefault=1
----INSERT 
--exec [dbo].[usp_InsertUpdateEmployee] @Id=N'0',@MainUserId=N'320c5299-8947-4295-9471-dde57aeed3f0',@UserId=N'2e23db42-661b-453c-81ee-7738e66e1def',@CompanyId=1,@BranchId=1,@ContactId=0,@ManagerId=0,@EmployeeType=N'INDIVIDUAL',@RecordStatus=1,@CreatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@CreatedDate='0001-01-01 00:00:00 +00:00',@UpdatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@UpdatedDate='0001-01-01 00:00:00 +00:00',@Command=N'INSERT',@ContactTypeId=0,@NameStyle=N'False',@NameTitle=N'Ms.',@NameTitleUrdu=N'مس',@FirstName=N'Test ',@FirstNameUrdu=N'ٹیسٹ',@MiddleName=default,@MiddleNameUrdu=default,@LastName=N'Employee',@LastNameUrdu=N'کسٹمر',@Suffix=default,@SuffixUrdu=default,@NationalIdNumber=N'212121212',@EmailAddress=N'Employee7@iiki.com',@EmailPromotion=0,@PhoneNumber=default,@CellNumber=N'2121212',@FaxNumber=default,@BirthDate='2020-09-15 00:00:00',@BirthDay=15,@BirthMonth=9,@BirthYear=2020,@MaritalStatus=N'SINGLE',@Gender=N'FEMALE',@CasteId=1,@SubCasteId=2,@AboutContact=default,@ContactImage=default,@IsAllowtoCreateUser=1,@AddressTypeId=3,@AddressLine1=N'Lahore ',@AddressLine1Urdu=N'لاہور',@AddressLine2=default,@AddressLine2Urdu=default,@CountryId=160,@Province=N'Punjab',@ProvinceUrdu=N'پنجاب',@City=N'Lahore ',@CityUrdu=N'لاہور',@ZipCode=N'54000',@AddressId=0,@ContactAddressId=0,@IsDefault=1
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateNavigation]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_InsertUpdateNavigation](
			@Id bigint
           ,@DisplayOrder bigint = NULL
           ,@ParentId bigint = NULL
           ,@MenuTitle nvarchar(256) = NULL
           ,@MenuTitleArabic nvarchar(512) = NULL
           ,@MenuTitleChinese nvarchar(512) = NULL
           ,@MenuTitleFilipino nvarchar(512) = NULL
           ,@MenuTitleFrench nvarchar(512) = NULL
           ,@MenuTitleHindi nvarchar(512) = NULL
           ,@MenuTitlePersian nvarchar(512) = NULL
           ,@MenuTitleRussian nvarchar(512) = NULL
           ,@MenuTitleSpanish nvarchar(512) = NULL
           ,@MenuTitleTurkish nvarchar(512) = NULL
           ,@MenuTitleUrdu nvarchar(512) = NULL
           ,@ApplicationArea nvarchar(128) = NULL
           ,@Area nvarchar(128) = NULL
           ,@Controller nvarchar(128) = NULL
           ,@Action nvarchar(128) = NULL
           ,@MenuIcon nvarchar(256) = NULL
           ,@RecordStatus tinyint = NULL
		   ,@ApplicationAreaId bigint =NULL
		   ,@Permissions nvarchar(256) =NULL
		   ,@RoleId nvarchar(128) =NULL
		   ,@Command nvarchar(100)='INSERT'

)
AS 
BEGIN
	IF(ISNULL(@Command,'INSERT')='INSERT')
		BEGIN
		SET @Id=(SELECT MAX(Id)+1 FROM Rights.tblNavigations)
			INSERT INTO [dbo].[tblNavigations]
					   ([Id],[DisplayOrder],[ParentId],[MenuTitle],[MenuTitleArabic],[MenuTitleChinese],[MenuTitleFilipino],[MenuTitleFrench],[MenuTitleHindi],[MenuTitlePersian],[MenuTitleRussian],[MenuTitleSpanish],[MenuTitleTurkish],[MenuTitleUrdu],[ApplicationArea],[Area],[Controller],[Action],[MenuIcon],[RecordStatus])
				 VALUES(@Id,@DisplayOrder,@ParentId,@MenuTitle,@MenuTitleArabic,@MenuTitleChinese,@MenuTitleFilipino,@MenuTitleFrench,@MenuTitleHindi,@MenuTitlePersian,@MenuTitleRussian,@MenuTitleSpanish,@MenuTitleTurkish,@MenuTitleUrdu,@ApplicationArea,@Area,@Controller,@Action,@MenuIcon,@RecordStatus)
			--SET @Id =@@IDENTITY
		END
	ELSE IF(ISNULL(@Id,0)!=0)
		BEGIN

			UPDATE [dbo].[tblNavigations]
			   SET [DisplayOrder] = ISNULL(@DisplayOrder, [DisplayOrder])
				  ,[ParentId] = ISNULL(@ParentId, [ParentId])
				  ,[MenuTitle] = ISNULL(@MenuTitle, [MenuTitle])
				  ,[MenuTitleArabic] = ISNULL(@MenuTitleArabic, [MenuTitleArabic])
				  ,[MenuTitleChinese] = ISNULL(@MenuTitleChinese, [MenuTitleChinese])
				  ,[MenuTitleFilipino] = ISNULL(@MenuTitleFilipino, [MenuTitleFilipino])
				  ,[MenuTitleFrench] = ISNULL(@MenuTitleFrench, [MenuTitleFrench])
				  ,[MenuTitleHindi] = ISNULL(@MenuTitleHindi, [MenuTitleHindi])
				  ,[MenuTitlePersian] = ISNULL(@MenuTitlePersian, [MenuTitlePersian])
				  ,[MenuTitleRussian] = ISNULL(@MenuTitleRussian, [MenuTitleRussian])
				  ,[MenuTitleSpanish] = ISNULL(@MenuTitleSpanish, [MenuTitleSpanish])
				  ,[MenuTitleTurkish] = ISNULL(@MenuTitleTurkish, [MenuTitleTurkish])
				  ,[MenuTitleUrdu] = ISNULL(@MenuTitleUrdu, [MenuTitleUrdu])
				  ,[ApplicationArea] = @ApplicationArea
				  ,[Area] = @Area
				  ,[Controller] = @Controller
				  ,[Action] = @Action
				  ,[MenuIcon] = @MenuIcon
				  ,[RecordStatus] = ISNULL(@RecordStatus, [RecordStatus])
			 WHERE Id=@Id

		END


			----INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleName] ,[AreaRuleCode] ,[AreaDetails] ,[NavigationId])
			----	SELECT @ApplicationAreaId,PD.PermissionTitle+' '+@MenuTitle,PD.PermissionCode,PD.PermissionDescription+' '+@MenuTitle,@Id FROM [dbo].[tblPermissionDefinitions] PD WHERE Id in (Select Id from dbo.Split(@Permissions,','))
			----UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN ApplicationAreasPermissions + '1' ELSE ApplicationAreasPermissions END
			----UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RightsAssigned + '1' ELSE RightsAssigned END WHERE RoleId=@RoleId
		--IF NOT EXISTS (SELECT 1 FROM [dbo].[tblAreaRules] AR JOIN [dbo].[tblPermissionDefinitions] PD ON AR.AreaRuleName = PD.PermissionTitle+' '+@MenuTitle)
		IF(isnull(@Permissions,'!!!') !='!!!')
			BEGIN

			
				DELETE AR FROM [dbo].[tblAreaRules] AR 
					LEFT JOIN [dbo].[tblPermissionDefinitions] PD ON AR.AreaRuleCode=PD.PermissionCode and AR.MainNavigationId=@Id
										WHERE PD.Id not  in (Select Id from dbo.Split(@Permissions,',')) AND AR.Id is not null
				DECLARE @MaxAreaRuleId bigint =(SELECT MAX(Id) FROM [dbo].[tblAreaRules])
				IF(ISNULL(@MaxAreaRuleId,0)>0)
					BEGIN
						DBCC CHECKIDENT ('[dbo].[tblAreaRules]', RESEED, @MaxAreaRuleId);
					END

				INSERT INTO [dbo].[tblAreaRules] ([ApplicationAreaId] ,[AreaRuleCode] ,[AreaRuleName] ,[AreaDetails] ,[NavigationId] ,[MainNavigationId],[PermissionDefinitionId],[IsLineBreak])
					SELECT @ApplicationAreaId,PD.PermissionCode,PD.PermissionTitle+' '+@MenuTitle,PD.PermissionDescription+' '+@MenuTitle,(CASE WHEN PD.PermissionCode='View' THEN @Id ELSE NULL END),@Id,PD.Id,(CASE WHEN PD.PermissionCode='View' THEN 1 ELSE 0 END) 
						FROM [dbo].[tblPermissionDefinitions] PD 
							LEFT JOIN [dbo].[tblAreaRules] AR ON AR.AreaRuleCode=PD.PermissionCode and AR.MainNavigationId=@Id
						WHERE PD.Id in (Select Id from dbo.Split(@Permissions,','))
							AND AR.Id is null

				----1 for non admin users
				--UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN  RIGHT('11111111111111111111111111111111111111111'+ApplicationAreasPermissions,( (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) - LEN(ApplicationAreasPermissions))) ELSE ApplicationAreasPermissions END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
				--UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RIGHT('11111111111111111111111111111111111111111'+RightsAssigned,( (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) - LEN(RightsAssigned))) ELSE RightsAssigned END WHERE RoleId='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId='10553325-1b66-4020-9656-a546a6b77203'
	
				----0 for non admin users
				--UPDATE [dbo].[tblRolesDefaultPermissions] SET ApplicationAreasPermissions = CASE WHEN LEN(ApplicationAreasPermissions) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RIGHT('00000000000000000000000000000000000000000'+ApplicationAreasPermissions,( (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) - LEN(ApplicationAreasPermissions))) ELSE ApplicationAreasPermissions END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203'
				--UPDATE [dbo].[tblUserPermissions] SET RightsAssigned= CASE WHEN LEN(RightsAssigned) < (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) THEN RIGHT('00000000000000000000000000000000000000000'+RightsAssigned,( (SELECT MAX(Id) FROM [dbo].[tblAreaRules]) - LEN(RightsAssigned))) ELSE RightsAssigned END WHERE RoleId!='10553325-1b66-4020-9656-a546a6b77200' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77201' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77202' OR  RoleId!='10553325-1b66-4020-9656-a546a6b77203' 
				EXEC [dbo].[usp_GetNavigations] @Id=@Id
			END
		ELSE IF EXISTS (SELECT COUNT(Id) FROM [dbo].[tblAreaRules] AR WHERE AR.MainNavigationId=@Id)
			BEGIN
				DELETE FROM [dbo].[tblAreaRules] WHERE MainNavigationId=@Id
			END
END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateUserInformation]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertUpdateUserInformation]
     -- Add the parameters for the stored procedure here
     @UserId nvarchar(256) = NULL,
     @ContactId bigint = NULL,
     @CompanyId bigint = NULL,
     @BranchId bigint = NULL,
	 @RecordStatus NVARCHAR(255)=1,
	 @CreatedBy  nvarchar(256) = NULL,
	 @UpdatedBy  nvarchar(256) = NULL,
     @Command nvarchar(256) = 'INSERT',
	 @IsManulaCreatedUser bit =NULL,
	 @ActionPerformedBy  nvarchar(256) = NULL,
	 @ActionPerformed  nvarchar(256) = NULL
 AS
 BEGIN
     
    -- SET NOCOUNT ON added to prevent extra result sets from
     -- interfering with SELECT statements.
     SET NOCOUNT ON;

    DECLARE @CustomUserId varchar(7);

	if((SELECT COUNT(*) FROM [dbo].[tblUserInformation] WHERE UserId=@UserId)>0)
		BEGIN
			SET @Command='UPDATE'
		END


    -- Insert statements for procedure here
	IF (Isnull(@Command,'INSERT')='INSERT' AND @UserId IS NOT NULL)
		BEGIN
             WHILE (1=1)
                 BEGIN
                     SELECT @CustomUserId = FORMAT(SYSDATETIMEOFFSET(), 'yy') + LEFT(REPLACE((RAND() * 10000000), '.', ''), 5)
                    
					INSERT INTO [dbo].[tblUserInformation] ([UserId], [CustomUserId], [CreatedBy], [CreatedDate],[RecordStatus],[IsManulaCreatedUser],[ContactId],[CompanyId],[BranchId])
                     SELECT @UserId, @CustomUserId, ISNULL(@CreatedBy,ANU.Email), GETUtCDATE(),@RecordStatus,ISNULL(@IsManulaCreatedUser,0),@ContactId,@CompanyId,@BranchId FROM [dbo].[AspNetUsers] ANU
                     WHERE ANU.Id = @UserId AND NOT EXISTS (SELECT 1 FROM [dbo].[tblUserInformation] UI WHERE UI.UserId = ANU.Id)
					 
					 /*Add User activity info*/
					 IF(ISNULL(@ActionPerformedBy,'')!='')
					 BEGIN
						EXEC [dbo].[usp_GetUserUpdateActivities] @ActionPerformedBy,@UserId,NULL,'User Created','AddUserActivityPerformed'
						
					END
				
					 /*END User activity info*/


                    IF @@ERROR <> 2601
                         BREAK;
                 END

            IF @@ERROR <> 0
                 BEGIN
                     SELECT -1 AS Id
                     RETURN
                 END

            --SELECT SCOPE_IDENTITY() AS Id
       END
	ELSE  IF (Isnull(@Command,'INSERT')='MarkActiveInactive')
		BEGIN
				Update [dbo].[tblUserInformation] set [RecordStatus]=@RecordStatus, [UpdatedBy]=ISNULL(@UpdatedBy,[UpdatedBy]),[UpdatedDate]=GetUTCDATE() WHERE UserId=@UserId
				
				IF(@RecordStatus=1)
					BEGIN
						SET @ActionPerformed='User Activated'
					END
				ELSE
					BEGIN
						SET @ActionPerformed='User In-Activated'
					END

				/*Add User activity info*/
				EXEC [dbo].[usp_GetUserUpdateActivities] @ActionPerformedBy,@UserId,NULL,@ActionPerformed,'AddUserActivityPerformed'
				--INSERT INTO [dbo].[tblUserUpdateActivities] (ActionPerformedBy,UpdatedUserId,UpdatedDate,ActionPerformed)
				--	SELECT @ActionPerformedBy,@UserId,GETUTCDATE(),@ActionPerformed

			--Select Id FROM [dbo].[tblUserInformation] Where UserId=@UserId
			
		END
		ELSE
			BEGIN
				RAISERROR ('UserId cannot be null',-1,-1, 'sp_AddUserInformation');  
			END

		


 END

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateVendor]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[usp_InsertUpdateVendor]
(
			@Id BIGINT						=NULL
           ,@MainUserId nvarchar(128) 		=NULL
           ,@UserId nvarchar(128) 			=NULL
           ,@CompanyId bigint 				=NULL
           ,@BranchId bigint 				=NULL
           ,@ContactId bigint 				=NULL
           ,@VendorType nchar(20) 		=NULL
           ,@AccountNumber nvarchar(25) 		=NULL
           ,@CompanyName nvarchar(128) 		=NULL
           ,@CreditRating tinyint 			=NULL
           ,@PreferredVendorStatus tinyint 		=NULL
           ,@PurchasingWebServiceURL nvarchar(1024) 		=NULL
           ,@RecordStatus int 				=NULL
           ,@CreatedBy nvarchar(128) 		=NULL
           ,@CreatedDate datetimeoffset(7) 	=NULL
           ,@UpdatedBy nvarchar(128) 		=NULL
           ,@UpdatedDate datetimeoffset(7) 	=NULL
		   ,@Command NVARCHAR(100)			='INSERT'
		   --Contact Params
		   ,@ContactTypeId bigint 		   =NULL
           ,@NameStyle bit 				   =NULL
           ,@NameTitle nchar(20) 		   =NULL
           ,@NameTitleUrdu nchar(20) 	   =NULL
           ,@FirstName nvarchar(50) 	   =NULL
           ,@FirstNameUrdu nvarchar(100)   =NULL
           ,@MiddleName nvarchar(50) 	   =NULL
           ,@MiddleNameUrdu nvarchar(50)   =NULL
           ,@LastName nvarchar(50) 		   =NULL
           ,@LastNameUrdu nvarchar(100)    =NULL
           ,@Suffix nchar(20) 			   =NULL
           ,@SuffixUrdu nchar(20) 		   =NULL
           ,@NationalIdNumber nvarchar(200)=NULL
           ,@EmailAddress nvarchar(50) 	   =NULL
           ,@EmailPromotion bit 		   =NULL
           ,@PhoneNumber nvarchar(50) 	   =NULL
           ,@CellNumber nvarchar(50) 	   =NULL
           ,@FaxNumber nvarchar(50) 	   =NULL
           ,@BirthDate datetime 		   =NULL
           ,@BirthDay int 				   =NULL
           ,@BirthMonth int 			   =NULL
           ,@BirthYear int 				   =NULL
           ,@MaritalStatus nvarchar(50)    =NULL
           ,@Gender nvarchar(20) 		   =NULL
           ,@CasteId bigint 			   =NULL
           ,@SubCasteId bigint 			   =NULL
           ,@AboutContact nvarchar(500)    =NULL
           ,@ContactImage nvarchar(256)	   =NULL
		   --Address Params
		   ,@AddressTypeId bigint		   =NULL
           ,@AddressLine1 nvarchar(256)	   =NULL
           ,@AddressLine1Urdu nvarchar(256)=NULL
           ,@AddressLine2 nvarchar(256)	   =NULL
           ,@AddressLine2Urdu nvarchar(256)=NULL
           ,@CountryId bigint			   =NULL
           ,@Province nvarchar(50)		   =NULL
           ,@ProvinceUrdu nvarchar(50)	   =NULL
           ,@City nvarchar(50)			   =NULL
           ,@CityUrdu nvarchar(50)		   =NULL
           ,@ZipCode nvarchar(50)		   =NULL
		   ,@IsAllowtoCreateUser bit	   =NULL
		   ---Contact Address Params
           ,@AddressId bigint 			  =NULL
           ,@ContactAddressId bigint 	  =NULL
           ,@IsDefault bit 				  =NULL
           ,@DivisionId bigint 			  =NULL
		   ,@UniqueNumber nvarchar(50)	  =NULL
)

AS

SET NOCOUNT ON;

BEGIN

	
	
				--Insert/Update Contact
			
				EXEC [dbo].[usp_InsertUpdateContact]
						@Id = @ContactId,
						@ContactTypeId = @ContactTypeId,
						@NameStyle = @NameStyle,
						@NameTitle = @NameTitle,
						@NameTitleUrdu = @NameTitleUrdu,
						@FirstName = @FirstName,
						@FirstNameUrdu = @FirstNameUrdu,
						@MiddleName = @MiddleName,
						@MiddleNameUrdu = @MiddleNameUrdu,
						@LastName = @LastName,
						@LastNameUrdu = @LastNameUrdu,
						@Suffix = @Suffix,
						@SuffixUrdu = @SuffixUrdu,
						@NationalIdNumber = @NationalIdNumber,
						@EmailAddress = @EmailAddress,
						@EmailPromotion = @EmailPromotion,
						@PhoneNumber = @PhoneNumber,
						@CellNumber = @CellNumber,
						@FaxNumber = @FaxNumber,
						@BirthDate = @BirthDate,
						@BirthDay = @BirthDay,
						@BirthMonth = @BirthMonth,
						@BirthYear = @BirthYear,
						@MaritalStatus = @MaritalStatus,
						@Gender = @Gender,
						@CasteId = @CasteId,
						@SubCasteId = @SubCasteId,
						@AboutContact = @AboutContact,
						@ContactImage = @ContactImage,
						@DivisionId = @DivisionId,
						@Command = @Command
						
				IF(ISNULL(@Command,'INSERT')='INSERT' AND ISNULL(@ContactId,0)<=0)
							BEGIN
								SET @ContactId=IDENT_CURRENT('tblContacts')
							END
						

				--Insert/Update Contact Address and Address

				EXEC [dbo].[usp_InsertUpdateContactAddress]
									@Id = @ContactAddressId,
									@UserId = @UserId,
									@ContactId = @ContactId,
									@AddressId = @AddressId,
									@RecordStatus = @RecordStatus,
									@IsDefault = @IsDefault,
									@CreatedDate = @CreatedDate,
									@CreatedBy = @CreatedBy,
									@UpdatedDate = @UpdatedDate,
									@updatedBy = @updatedBy,
									@Command = @Command,
									----Address
									@AddressTypeId = @AddressTypeId,
									@AddressLine1 = @AddressLine1,
									@AddressLine1Urdu = @AddressLine1Urdu,
									@AddressLine2 = @AddressLine2,
									@AddressLine2Urdu = @AddressLine2Urdu,
									@CountryId = @CountryId,
									@Province = @Province,
									@ProvinceUrdu = @ProvinceUrdu,
									@City = @City,
									@CityUrdu = @CityUrdu,
									@ZipCode = @ZipCode


				IF(ISNULL(@Command,'INSERT')='INSERT')
						BEGIN
							SET @AddressId = IDENT_CURRENT('tblAddresses')
							SET @ContactAddressId = IDENT_CURRENT('tblContactAddresses')
						END

	IF(ISNULL(@Command,'INSERT')='INSERT' OR ISNULL(@Id,0)<=0)
		BEGIN

		SET @UniqueNumber = [dbo].[GetVendorUniqueNumber] (NewID())

			INSERT INTO [dbo].[tblVendors]
					   ([MainUserId]
					   ,[UserId]
					   ,[CompanyId]
					   ,[BranchId]
					   ,[ContactId]
					   ,[VendorType]
					   ,[AccountNumber]
					   ,[CompanyName]
					   ,[CreditRating]
					   ,[PreferredVendorStatus]
					   ,[PurchasingWebServiceURL]
					   ,[UniqueNumber]
					   ,[RecordStatus]
					   ,[CreatedBy]
					   ,[CreatedDate]
					   ,[UpdatedBy]
					   ,[UpdatedDate])
				 VALUES
					   (@MainUserId  
					   ,@UserId  
					   ,@CompanyId  
					   ,@BranchId  
					   ,@ContactId  
					   ,@VendorType 
					   ,@AccountNumber 
					   ,@CompanyName 
					   ,@CreditRating
					   ,@PreferredVendorStatus 
					   ,@PurchasingWebServiceURL 
					   ,@UniqueNumber
					   ,@RecordStatus 
					   ,@CreatedBy  
					   ,GETUTCDATE() 
					   ,@UpdatedBy  
					   ,@UpdatedDate )

			SET @Id=@@IDENTITY
		END
	ELSE IF(ISNULL(@Id,0)>0)
		BEGIN
			UPDATE [dbo].[tblVendors]
			   SET [MainUserId] = ISNULL(@MainUserId, [MainUserId] )
				  ,[UserId] = ISNULL(@UserId,  [UserId])
				  ,[CompanyId] = ISNULL(@CompanyId, [CompanyId] )
				  ,[BranchId] = ISNULL(@BranchId,  [BranchId])
				  ,[ContactId] = ISNULL(@ContactId, [ContactId] )
				  ,[AccountNumber] = ISNULL(@AccountNumber, [AccountNumber] )
				  ,[VendorType] = ISNULL(@VendorType, [VendorType] )
				  ,[CompanyName] = ISNULL(@CompanyName, [CompanyName] )
				  ,[CreditRating] = ISNULL(@CreditRating, [CreditRating] )
				  ,[PreferredVendorStatus] = ISNULL(@PreferredVendorStatus, [PreferredVendorStatus] )
				  ,[PurchasingWebServiceURL] = ISNULL(@PurchasingWebServiceURL, [PurchasingWebServiceURL] )
				  ,[RecordStatus] = ISNULL(@RecordStatus, [RecordStatus] )
				  ,[UpdatedBy] = ISNULL(@UpdatedBy,  [UpdatedBy])
				  ,[UpdatedDate] = GETUTCDATE()
			 WHERE Id=@Id

		END

		
	IF(@IsAllowtoCreateUser=1)
		BEGIN
			EXEC [dbo].[usp_InsertUpdateUserInformation]
					@UserId = @UserId,
					@ContactId = @ContactId,
					@CompanyId = @CompanyId,
					@BranchId = @BranchId,
					@RecordStatus = @RecordStatus,
					@CreatedBy = @CreatedBy,
					@Command = @Command,
					@IsManulaCreatedUser = 1,
					@ActionPerformedBy = @CreatedBy,
					@ActionPerformed = 'User Created'

		END

	EXEC [dbo].[usp_GetContacts] @Id=@ContactId

	--SELECT @Id AS Id, @ContactId AS ContactId, @ContactAddressId AS ContactAddressId, @AddressId AS AddressId

END
----UPDATE 
--exec [dbo].[usp_InsertUpdateVendor] @Id=N'4',@MainUserId=N'320c5299-8947-4295-9471-dde57aeed3f0',@UserId=N'92ba3c01-6387-4d39-9dd7-7943c9ddc896',@CompanyId=1,@BranchId=1,@ContactId=9,@AccountNumber=0,@VendorType=N'INDIVIDUAL',@RecordStatus=1,@CreatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@CreatedDate='2020-09-03 10:00:46 +00:00',@UpdatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@UpdatedDate='0001-01-01 00:00:00 +00:00',@Command=N'UPDATE',@ContactTypeId=2,@NameStyle=N'False',@NameTitle=N'Mr.',@NameTitleUrdu=N'مسٹر',@FirstName=N'Test',@FirstNameUrdu=N'ٹیسٹ',@MiddleName=default,@MiddleNameUrdu=default,@LastName=N'Vendor',@LastNameUrdu=N'کسٹمر',@Suffix=default,@SuffixUrdu=default,@NationalIdNumber=N'023326',@EmailAddress=N'Vendor4@iiki.com',@EmailPromotion=0,@PhoneNumber=default,@CellNumber=N'62622',@FaxNumber=default,@BirthDate='2020-09-03 00:00:00',@BirthDay=3,@BirthMonth=9,@BirthYear=2020,@MaritalStatus=N'SINGLE',@Gender=N'MALE',@CasteId=1,@SubCasteId=2,@AboutContact=default,@ContactImage=default,@IsAllowtoCreateUser=1,@AddressTypeId=3,@AddressLine1=N'Lahore',@AddressLine1Urdu=N'لاہور',@AddressLine2=default,@AddressLine2Urdu=default,@CountryId=160,@Province=N'Punjab',@ProvinceUrdu=N'پنجاب',@City=N'Lahore',@CityUrdu=N'لاہور',@ZipCode=N'54000',@AddressId=9,@ContactAddressId=9,@IsDefault=1
----INSERT 
--exec [dbo].[usp_InsertUpdateVendor] @Id=N'0',@MainUserId=N'320c5299-8947-4295-9471-dde57aeed3f0',@UserId=N'2e23db42-661b-453c-81ee-7738e66e1def',@CompanyId=1,@BranchId=1,@ContactId=0,@AccountNumber=0,@VendorType=N'INDIVIDUAL',@RecordStatus=1,@CreatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@CreatedDate='0001-01-01 00:00:00 +00:00',@UpdatedBy=N'320c5299-8947-4295-9471-dde57aeed3f0',@UpdatedDate='0001-01-01 00:00:00 +00:00',@Command=N'INSERT',@ContactTypeId=0,@NameStyle=N'False',@NameTitle=N'Ms.',@NameTitleUrdu=N'مس',@FirstName=N'Test ',@FirstNameUrdu=N'ٹیسٹ',@MiddleName=default,@MiddleNameUrdu=default,@LastName=N'Vendor',@LastNameUrdu=N'کسٹمر',@Suffix=default,@SuffixUrdu=default,@NationalIdNumber=N'212121212',@EmailAddress=N'Vendor7@iiki.com',@EmailPromotion=0,@PhoneNumber=default,@CellNumber=N'2121212',@FaxNumber=default,@BirthDate='2020-09-15 00:00:00',@BirthDay=15,@BirthMonth=9,@BirthYear=2020,@MaritalStatus=N'SINGLE',@Gender=N'FEMALE',@CasteId=1,@SubCasteId=2,@AboutContact=default,@ContactImage=default,@IsAllowtoCreateUser=1,@AddressTypeId=3,@AddressLine1=N'Lahore ',@AddressLine1Urdu=N'لاہور',@AddressLine2=default,@AddressLine2Urdu=default,@CountryId=160,@Province=N'Punjab',@ProvinceUrdu=N'پنجاب',@City=N'Lahore ',@CityUrdu=N'لاہور',@ZipCode=N'54000',@AddressId=0,@ContactAddressId=0,@IsDefault=1
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchUsers]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_SearchUsers](
	@Id  NVARCHAR(128) =NULL,
	@UserId NVARCHAR(128) =NULL,
	@Email NVARCHAR(256) =NULL,
	@UserName NVARCHAR(256) =NULL,
	@FirstName  NVARCHAR(100) =NULL,
	@LastName  NVARCHAR(100) =NULL,
	@StartDate DATETIMEOFFSET(7)=NULL,
	@EndDate DATETIMEOFFSET(7)=NULL,
	@ContactsCount BIGINT =NULL,
	@EmailsSentCount BIGINT =NULL,
	@OffSet bigint =0,
	@PageSize BIGINT =10,
	@SortColumn INT =1,
	@SortOrder NVARCHAR(20) ='asc' ,
	@Command NVARCHAR(20) ='SEARCHUSERS' 

)

AS

	BEGIN

	IF(@Id IS NOT NULL AND @UserId IS NULL)
		BEGIN
			SET @UserId=@Id
		END

	IF(@Command='SEARCHUSERS')
		BEGIN
				;WITH main AS(
							SELECT ANU.Id 
								FROM [dbo].[AspNetUsers] ANU
								JOIN [dbo].[tblUserInformation] UI ON UI.UserId=ANU.Id
								JOIN [dbo].[tblContacts] C ON C.Id=UI.ContactId
								 WHERE (@UserId IS NULL OR ANU.Id=@UserId)
									AND (@Email IS NULL OR Email like '%'+@Email+'%')
									AND (@UserName IS NULL OR UserName like '%'+@UserName+'%')
									AND (@FirstName IS NULL OR FirstName like '%'+@FirstName+'%')
									AND (@LastName IS NULL OR LastName like '%'+@LastName+'%')
									AND (@StartDate IS NULL OR CreatedDate BETWEEN @StartDate AND @EndDate)

						), page_data AS (
							SELECT ANU.Id,UI.Id UserInfoId,M.TotalCount
								FROM [dbo].[AspNetUsers] ANU
								JOIN [dbo].[tblUserInformation] UI ON UI.UserId=ANU.Id
									CROSS APPLY (SELECT count(*) TotalCount from main) M
								WHERE EXISTS (SELECT 1 FROM main WHERE main.Id = ANU.Id)
								ORDER BY
								CreatedDate DESC
								OFFSET @OffSet ROWS
								FETCH NEXT @PageSize ROWS ONLY
							)


						SELECT UI.[Id]
							  ,UI.UserId
							  ,[Email]
							  ,[EmailConfirmed]
							  ,[PasswordHash]
							  ,[SecurityStamp]
							  ,ANU.[PhoneNumber]
							  ,C.[PhoneNumber] ContactPhoneNumber
							  ,[PhoneNumberConfirmed]
							  ,[TwoFactorEnabled]
							  ,[LockoutEndDateUtc]
							  ,[LockoutEnabled]
							  ,[AccessFailedCount]
							  ,[UserName]
							  ,C.FirstName
							  ,C.LastName
							  ,ISNULL(C.FirstName,'')+' '+ISNULL(C.LastName,'') AS FullName
							  ,ISNULL(C.FirstNameUrdu,'')+' '+ISNULL(C.LastNameUrdu,'') AS FullNameUrdu
							  ,C.FirstNameUrdu
							  ,C.LastNameUrdu
							  ,UI.RecordStatus
							  ,UI.CreatedDate
							  ,PD.TotalCount
							  ,ANR.[Name] RoleName
						  FROM [dbo].[AspNetUsers] ANU
								JOIN [dbo].[tblUserInformation] UI ON UI.UserId=ANU.Id
								JOIN [dbo].[tblContacts] C ON C.Id=UI.ContactId
								JOIN [dbo].[AspNetUserRoles] AUR ON AUR.UserId=ANU.Id --AND AUR.RoleId !='10553325-1b66-4020-9656-a546a6b77200'
								JOIN [dbo].[AspNetRoles] ANR ON ANR.Id=AUR.RoleId
								JOIN page_data PD ON PD.Id = ANU.Id
						 ORDER BY 
								CASE WHEN @SortOrder = 'asc' AND @SortColumn<2 THEN
									CASE 
										WHEN @SortColumn=0 THEN FirstName
										WHEN @SortColumn=1 THEN Email
									END
								END ASC,
								CASE WHEN @SortOrder = 'desc'AND @SortColumn<2 THEN
									CASE 
										WHEN @SortColumn=0 THEN FirstName
										WHEN @SortColumn=1 THEN Email
									END
								END DESC,
								CASE WHEN @SortOrder = 'asc' AND @SortColumn>=4 THEN
									CreatedDate
								END ASC,
								CASE WHEN @SortOrder = 'desc'AND @SortColumn>=4 THEN
									CreatedDate
								END DESC
		END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateInsertUserInfo]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateInsertUserInfo] 
	-- Add the parameters for the stored procedure here
        @UserId nvarchar(256) = null,
        @ContactId BIGINT = null,
        @FirstName nvarchar(256) = null,
        @LastName nvarchar(256) = null,
        @UserEmail  nvarchar(256) = null,
        @PhoneNumber nvarchar(MAX) = null,
        @UserName  nvarchar(256) = null
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE ANU
		SET 
		--ANU.Email = @UserEmail, 
		ANU.PhoneNumber = @PhoneNumber,
		--ANU.UserName = @UserName,
		ANU.PhoneNumberConfirmed = CASE WHEN ISNULL(ANU.PhoneNumber, '') != ISNULL(@PhoneNumber, '') THEN 0 ELSE ANU.PhoneNumberConfirmed END
	FROM [dbo].[AspNetUsers] ANU
		JOIN [dbo].[tblUserInformation] UI ON UI.UserId = ANU.Id 	
	WHERE ANU.Id = @UserId


	UPDATE TUI
		SET TUI.FirstName = @FirstName,
		TUI.LastName = @LastName
		
	FROM [dbo].[tblContacts] TUI
	WHERE TUI.Id = @ContactId
	

	DECLARE @ActionPerformedBy NVARCHAR(256)=NULL
	SET @ActionPerformedBy=@UserEmail

		/*Add User activity info*/
		IF(ISNULL(@ActionPerformedBy,'')!='')
		BEGIN
			EXEC [dbo].[usp_GetUserUpdateActivities] @ActionPerformedBy,@UserId,NULL,'User Info Updated','AddUserActivityPerformed'
		--INSERT INTO [dbo].[tblUserUpdateActivities] (ActionPerformedBy,UpdatedUserId,UpdatedDate,ActionPerformed)
		--	SELECT @ActionPerformedBy,@UserId,GETUTCDATE(),'User Created Manually'
		END
				
		/*END User activity info*/

END


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateProfileImage]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_UpdateProfileImage] 
	
	    @ContactId  nvarchar(256) = null,
	    @ProfileImage nvarchar(256) = null
        
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblContacts]
	SET ContactImage = @ProfileImage
	WHERE Id = @ContactId


END

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateRolesDefaultPermissions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateRolesDefaultPermissions]
	-- Add the parameters for the stored procedure here
	@RoleId nvarchar(128) = NULL, 
	@CurrentUserId nvarchar(128) = NULL,
	@SessionAdminUserId nvarchar(128) = NULL,
	@RightsAssigned varchar(max) = NULL,
	@ModulesAssigned varchar(max) = NULL
AS
BEGIN

	DECLARE @Eligible INT = NULL
	SELECT @Eligible = COUNT(CASE WHEN ANUR.UserId = ISNULL(@SessionAdminUserId, '') THEN 1 ELSE NULL END)
		* COUNT(CASE WHEN ANUR.UserId = ISNULL(@CurrentUserId, '') THEN 1 ELSE NULL END)
	FROM [dbo].[AspNetUserRoles] ANUR
	WHERE ANUR.RoleId = '10553325-1b66-4020-9656-a546a6b77200'
		AND (ANUR.UserId = ISNULL(@SessionAdminUserId, '') OR ANUR.UserId = ISNULL(@CurrentUserId, ''))

	IF ISNULL(@Eligible, 0) <= 0
		BEGIN
			RETURN
		END

	--DECLARE @ModulesAssigned varchar(max);

	SELECT @ModulesAssigned = STUFF((SELECT CASE WHEN ISNULL(AMR.COUNT, 0) > 0 THEN 1 ELSE 0 END FROM [dbo].[tblMainModules] MM
		LEFT OUTER JOIN (SELECT COUNT(*) AS COUNT, AA.ModuleId AS ModuleId FROM [dbo].[tblApplicationAreas] AA
			JOIN [dbo].[tblAreaRules] AR ON AA.Id = AR.ApplicationAreaId
				CROSS APPLY (SELECT SUBSTRING(@RightsAssigned, AR.Id, 1) AS AreaRight) R
				WHERE R.AreaRight > 0
				GROUP BY AA.ModuleId)
		AMR ON MM.Id = AMR.ModuleId FOR XML PATH(''), TYPE).value('text()[1]','nvarchar(max)'),1,0,N'')

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	IF EXISTS (SELECT 1 FROM [dbo].[tblRolesDefaultPermissions] WHERE RoleId=@RoleId)
		BEGIN
			UPDATE [dbo].[tblRolesDefaultPermissions]
				SET 
				ModulesPermissions = @ModulesAssigned, 
				ApplicationAreasPermissions = @RightsAssigned
			WHERE RoleId=@RoleId
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[tblRolesDefaultPermissions] VALUES(@RoleId, @ModulesAssigned,@RightsAssigned)
		END

	

    -- Insert statements for procedure here
	IF @@ERROR <> 0
		BEGIN
			SELECT 0 AS RETURNVAL
			RETURN
		END

	SELECT 1 AS RETURNVAL
	
END


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUserPermissions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateUserPermissions] 
	-- Add the parameters for the stored procedure here
	@NewSubUserId nvarchar(128) = NULL, 
	@CurrentUserId nvarchar(128) = NULL,
	@SessionAdminUserId nvarchar(128) = NULL,
	@AreaRights varchar(max) = NULL,
	@ModuleRights varchar(max) = NULL
AS
BEGIN

	DECLARE @Eligible INT = NULL
	SELECT @Eligible = COUNT(CASE WHEN ANUR.UserId = ISNULL(@SessionAdminUserId, '') THEN 1 ELSE NULL END)
		* COUNT(CASE WHEN ANUR.UserId = ISNULL(@CurrentUserId, '') THEN 1 ELSE NULL END)
	FROM [dbo].[AspNetUserRoles] ANUR
	WHERE (ANUR.RoleId = '10553325-1b66-4020-9656-a546a6b77200' OR ANUR.RoleId = '10553325-1b66-4020-9656-a546a6b77202')
		AND (ANUR.UserId = ISNULL(@SessionAdminUserId, '') OR ANUR.UserId = ISNULL(@CurrentUserId, ''))

	IF ISNULL(@Eligible, 0) <= 0
		BEGIN
			RETURN
		END

	DECLARE @ModulesAssigned varchar(max)=@ModuleRights;
	--IF(@ModuleRights IS NULL)
	--	BEGIN
			SELECT @ModulesAssigned = STUFF((SELECT CASE WHEN ISNULL(AMR.COUNT, 0) > 0 THEN 1 ELSE 0 END FROM [dbo].[tblMainModules] MM
				LEFT OUTER JOIN (SELECT COUNT(*) AS COUNT, AA.ModuleId AS ModuleId FROM [dbo].[tblApplicationAreas] AA
					JOIN [dbo].[tblAreaRules] AR ON AA.Id = AR.ApplicationAreaId
						CROSS APPLY (SELECT SUBSTRING(@AreaRights, AR.Id, 1) AS AreaRight) R
						WHERE R.AreaRight > 0
						GROUP BY AA.ModuleId)
				AMR ON MM.Id = AMR.ModuleId FOR XML PATH(''), TYPE).value('text()[1]','nvarchar(max)'),1,0,N'')
		--END
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	UPDATE [dbo].[tblUserPermissions]
		SET [ModulesAssigned] = @ModulesAssigned, 
		[RightsAssigned] = @AreaRights
	WHERE UserId = @NewSubUserId AND MainUserId IS NULL

	UPDATE UP SET UP.RightsAssigned = SUR.RightsAssigned,
		UP.ModulesAssigned=SURModule.ModulesAssigned
	FROM [dbo].[tblUserPermissions] UP
	CROSS APPLY (SELECT STUFF((SELECT (CASE WHEN ISNULL(R.AreaRight, 0) > 0 THEN SUBSTRING(UP.RightsAssigned, AR.Id, 1) ELSE 0 END) FROM [dbo].[tblAreaRules] AR
			 CROSS APPLY (SELECT CONVERT(INT, SUBSTRING(@AreaRights, AR.Id, 1))  AS AreaRight) R
				ORDER BY AR.Id
			 FOR XML PATH(''), TYPE).value('text()[1]','nvarchar(max)'),1,0,N'') AS RightsAssigned) SUR
	CROSS APPLY (SELECT STUFF((SELECT (CASE WHEN ISNULL(R.Module, 0) > 0 THEN SUBSTRING(UP.ModulesAssigned, AR.Id, 1) ELSE 0 END) FROM [dbo].[tblAreaRules] AR
		CROSS APPLY (SELECT CONVERT(INT, SUBSTRING(@ModulesAssigned, AR.Id, 1))  AS Module) R
		ORDER BY AR.Id
		FOR XML PATH(''), TYPE).value('text()[1]','nvarchar(max)'),1,0,N'') AS ModulesAssigned) SURModule
	WHERE MainUserId = @NewSubUserId

    -- Insert statements for procedure here
	IF @@ERROR <> 0
		BEGIN
			SELECT 0 AS RETURNVAL
			RETURN
		END

	SELECT 1 AS Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateUser]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ValidateUser]
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(256) = NULL, 
	@SessionID nvarchar(256) = NULL,
	@WebsiteID nvarchar(64) = NULL,
	@LoginAttemptId nvarchar(64) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Id bigint = NULL

	SET @LoginAttemptId = LTRIM(RTRIM(ISNULL(@LoginAttemptId, '')))

	SELECT @Id = COUNT(*) FROM [dbo].[tblUserSessions] US
	WHERE US.Id = @UserId AND US.SessionID = @SessionID
	AND US.WebsiteID = @WebsiteID

	IF @LoginAttemptId != '' AND ISNULL(@Id, 0) > 0 
		BEGIN
			UPDATE  [dbo].[tblUserLoginAttempts] SET IsLoginSucceed = 1 WHERE Id = @LoginAttemptId
		END

	SELECT @Id AS Id
END

GO
/****** Object:  StoredProcedure [dbo].[uspLogError]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [dbo].[uspLogError] logs error information in the ErrorLogs table about the 
-- error that caused execution to jump to the CATCH block of a 
-- TRY...CATCH construct. This should be executed from within the scope 
-- of a CATCH block otherwise it will return without inserting error 
-- information. 
Create PROCEDURE [dbo].[uspLogError] 
    @ErrorLogsID [int] = 0 OUTPUT -- contains the ErrorLogsID of the row inserted
AS                               -- by [dbo].[uspLogError] in the ErrorLogs table
BEGIN
    SET NOCOUNT ON;

    -- Output parameter value of 0 indicates that error 
    -- information was not logged
    SET @ErrorLogsID = 0;

    BEGIN TRY
        -- Return if there is no error information to log
        IF ERROR_NUMBER() IS NULL
            RETURN;

        -- Return if inside an uncommittable transaction.
        -- Data insertion/modification is not allowed when 
        -- a transaction is in an uncommittable state.
        IF XACT_STATE() = -1
        BEGIN
            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 
                + 'Rollback the transaction before executing [dbo].[uspLogError] in order to successfully log error information.';
            RETURN;
        END

        INSERT [dbo].[ErrorLogs] 
            (
            [UserName], 
            [ErrorNumber], 
            [ErrorSeverity], 
            [ErrorState], 
            [ErrorProcedure], 
            [ErrorLine], 
            [ErrorMessage]
            ) 
        VALUES 
            (
            CONVERT(sysname, CURRENT_USER), 
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
            );

        -- Pass back the ErrorLogsID of the row inserted
        SET @ErrorLogsID = @@IDENTITY;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred in stored procedure [dbo].[uspLogError]: ';
        EXECUTE [dbo].[uspPrintError];
        RETURN -1;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[uspPrintError]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [dbo].[uspPrintError] prints error information about the error that caused 
-- execution to jump to the CATCH block of a TRY...CATCH construct. 
-- Should be executed from within the scope of a CATCH block otherwise 
-- it will return without printing any error information.
Create PROCEDURE [dbo].[uspPrintError] 
AS
BEGIN
    SET NOCOUNT ON;

    -- Print error information. 
    PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
END;
GO
/****** Object:  Trigger [dbo].[trDeleteUserPermissions]    Script Date: 7/22/2024 9:51:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create TRIGGER [dbo].[trDeleteUserPermissions] 
   ON  [dbo].[AspNetUserRoles]
   FOR Delete
AS 
BEGIN
    -- Insert statements for trigger here

	DECLARE @DeletedUserID NVARCHAR(256)=NULL
	SELECT @DeletedUserID = del.UserId FROM DELETED del

	Delete FROM [dbo].tblUserPermissions
	Where UserId=@DeletedUserID

END
GO
ALTER TABLE [dbo].[AspNetUserRoles] ENABLE TRIGGER [trDeleteUserPermissions]
GO
/****** Object:  Trigger [dbo].[trInsertSetDefaultPermissions]    Script Date: 7/22/2024 9:51:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create TRIGGER [dbo].[trInsertSetDefaultPermissions] 
   ON  [dbo].[AspNetUserRoles]
   AFTER INSERT
AS 
BEGIN
    -- Insert statements for trigger here

	INSERT INTO [dbo].[tblUserPermissions]
		([UserId]
		,[RoleId]
		,[ModulesAssigned]
		,[RightsAssigned])
	SELECT i.UserId, i.RoleId, RDP.[ModulesPermissions], RDP.[ApplicationAreasPermissions] 
	FROM inserted i
	JOIN [dbo].tblRolesDefaultPermissions RDP ON RDP.RoleId = i.RoleId
	JOIN [dbo].[AspNetRoles] UR ON UR.Id = i.RoleId

END
GO
ALTER TABLE [dbo].[AspNetUserRoles] ENABLE TRIGGER [trInsertSetDefaultPermissions]
GO
/****** Object:  DdlTrigger [ddlDatabaseTriggerLog]    Script Date: 7/22/2024 9:51:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE TRIGGER [ddlDatabaseTriggerLog] ON DATABASE 
FOR DDL_DATABASE_LEVEL_EVENTS AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @data XML;
    DECLARE @schema sysname;
    DECLARE @object sysname;
    DECLARE @eventType sysname;

    SET @data = EVENTDATA();
    SET @eventType = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    SET @schema = @data.value('(/EVENT_INSTANCE/SchemaName)[1]', 'sysname');
    SET @object = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname') 

    IF @object IS NOT NULL
        PRINT '  ' + @eventType + ' - ' + @schema + '.' + @object;
    ELSE
        PRINT '  ' + @eventType + ' - ' + @schema;

    IF @eventType IS NULL
        PRINT CONVERT(nvarchar(max), @data);

    INSERT [dbo].[DatabaseLog] 
        (
        [PostTime], 
        [DatabaseUser], 
        [Event], 
        [Schema], 
        [Object], 
        [TSQL], 
        [XmlEvent]
        ) 
    VALUES 
        (
        GETDATE(), 
        CONVERT(sysname, CURRENT_USER), 
        @eventType, 
        CONVERT(sysname, @schema), 
        CONVERT(sysname, @object), 
        @data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(max)'), 
        @data
        );
END;
GO
DISABLE TRIGGER [ddlDatabaseTriggerLog] ON DATABASE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Database trigger to audit all of the DDL changes made.' , @level0type=N'TRIGGER',@level0name=N'ddlDatabaseTriggerLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for DatabaseLogs records.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'DatabaseLogsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the DDL change occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'PostTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user who implemented the DDL change.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'DatabaseUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of DDL statement that was executed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The schema to which the changed object belongs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'Schema'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The object that was changed by the DDL statment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'Object'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The exact Transact-SQL statement that was executed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'TSQL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The raw XML data generated by database trigger.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'COLUMN',@level2name=N'XmlEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (nonclustered) constraint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs', @level2type=N'CONSTRAINT',@level2name=N'PK_DatabaseLogs_DatabaseLogsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Audit table tracking all DDL changes made to the AdventureWorks database. Data is captured by the database trigger ddlDatabaseTriggerLog.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for ErrorLogs records.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorLogsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time at which the error occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'CONSTRAINT',@level2name=N'DF_ErrorLogs_ErrorTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user who executed the batch in which the error occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The error number of the error that occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The severity of the error that occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorSeverity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The state number of the error that occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the stored procedure or trigger where the error occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorProcedure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The line number at which the error occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorLine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The message text of the error that occurred.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'COLUMN',@level2name=N'ErrorMessage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs', @level2type=N'CONSTRAINT',@level2name=N'PK_ErrorLogs_ErrorLogsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISO code for countries and regions. Foreign key to tblCountries.CountryId.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCurrencies', @level2type=N'COLUMN',@level2name=N'CountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cross-reference table mapping ISO currency codes to a country or region.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCurrencies'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job classification. 0 = Hourly, not exempt from collective bargaining. 1 = Salaried, exempt from collective bargaining.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblEmployees', @level2type=N'COLUMN',@level2name=N'SalaryType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of available vacation hours.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblEmployees', @level2type=N'COLUMN',@level2name=N'VacationHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of available sick leave hours.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblEmployees', @level2type=N'COLUMN',@level2name=N'SickLeaveHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Serial No or barcode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'ProductSerialNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Good Part or Defective
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'ProductStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Repairer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'SupplierWarranty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Warranty in days' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'WarrantyPeroid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the part was first inbound to warehouse - will not change for transactions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'InboundDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for tblShipMethods records.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shipping company name.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minimum shipping charge.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'ShipBaseRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shipping charge per pound.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'COLUMN',@level2name=N'ShipRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'CONSTRAINT',@level2name=N'PK_tblShipMethods_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shipping company lookup table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ShipBaseRate] > (0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'CONSTRAINT',@level2name=N'CK_tblShipMethods_ShipBaseRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ShipRate] > (0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblShipMethods', @level2type=N'CONSTRAINT',@level2name=N'CK_tblShipMethods_ShipRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' Federal Information Processing Standard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStateProvinces', @level2type=N'COLUMN',@level2name=N'FIPSCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Qty,2=Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUnitofMeasurements', @level2type=N'COLUMN',@level2name=N'UoMType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor account (identification) number.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'AccountNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Superior, 2 = Excellent, 3 = Above average, 4 = Average, 5 = Below average' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'CreditRating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Do not use if another vendor is available. 1 = Preferred over other vendors supplying the same product.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'PreferredVendorStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor URL.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVendors', @level2type=N'COLUMN',@level2name=N'PurchasingWebServiceURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ea"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ta"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tc"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "tat"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_EntityAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_EntityAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ta"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tc"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 136
               Right = 665
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "at"
            Begin Extent = 
               Top = 58
               Left = 251
               Bottom = 188
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_FormattedAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_FormattedAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[9] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ANU"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ANUR"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 102
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANR"
            Begin Extent = 
               Top = 6
               Left = 508
               Bottom = 136
               Right = 678
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tC"
            Begin Extent = 
               Top = 6
               Left = 716
               Bottom = 136
               Right = 904
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tCT"
            Begin Extent = 
               Top = 6
               Left = 942
               Bottom = 136
               Right = 1158
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tUI"
            Begin Extent = 
               Top = 102
               Left = 300
               Bottom = 232
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 117' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Users'
GO
