/*
	Payment Window modifications
		- Remove redundant constraint from order status linking order status to itself by orderstatusid
		- Add message column to orderstatus audit for custom messages
		- Add pipeline column to payment method for post processing pipeline name
		- Add reference id to payment to be used for linked a payment provider transaction to payment before a transaction id is supplied
		- Drop orderstatudid seed to allow for controlled status id for reference from code
*/

SET NUMERIC_ROUNDABORT OFF

SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tmpErrors')) DROP TABLE tmpErrors

CREATE TABLE tmpErrors (Error int)

SET XACT_ABORT ON

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION

PRINT N'Altering [dbo].[uCommerce_OrderStatus]'

ALTER TABLE [dbo].[uCommerce_OrderStatus] DROP CONSTRAINT [uCommerce_FK_OrderStatus_OrderStatus]

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Altering [dbo].[uCommerce_OrderStatusAudit]'

ALTER TABLE [dbo].[uCommerce_OrderStatusAudit] ADD
[Message] [nvarchar] (max) NULL

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Altering [dbo].[uCommerce_PaymentMethod]'

ALTER TABLE [dbo].[uCommerce_PaymentMethod] ADD
[Pipeline] [nvarchar] (128) NULL

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

PRINT N'Altering [dbo].[uCommerce_Payment]'

ALTER TABLE [dbo].[uCommerce_Payment] ADD
[ReferenceId] [nvarchar] (max) NULL

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION

IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END

IF EXISTS (SELECT * FROM tmpErrors) ROLLBACK TRANSACTION

IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'

DROP TABLE tmpErrors