-- Creates a PriceGroupTarget and inserts values into EntityUi if they do not exists.
BEGIN
	IF NOT EXISTS (SELECT 1 
			   FROM INFORMATION_SCHEMA.TABLES 
			   WHERE TABLE_NAME='uCommerce_PriceGroupTarget')
	BEGIN
		CREATE TABLE uCommerce_PriceGroupTarget (
			PriceGroupTargetId int primary key,
			PriceGroupName	nvarchar(150),
		)
	END

	
	IF NOT EXISTS (SELECT 1 from uCommerce_EntityUi ui where ui.VirtualPathUi = 'Targets/PriceGroupUi.ascx')
	BEGIN
		declare @entityUiId as int 
		INSERT INTO uCommerce_EntityUi 
		VALUES (
			'UCommerce.EntitiesV2.PriceGroupTarget, UCommerce',
			'Targets/PriceGroupUi.ascx',
			15
		)
		SET @entityUiId = SCOPE_IDENTITY()

		insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Price group',null,'en-US')
		insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Pris grupp',null,'sv-SE')
		insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Pris gruppe',null,'da-DK')
		insert into uCommerce_EntityUiDescription VALUES (@entityUiId,'Preisgruppe',null,'de-DE')
	END
END
