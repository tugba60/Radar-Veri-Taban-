--       TespitEdilenler
--eðer harektli_mi 1 ise takip edilenlere al arayüz ile diðer bilgileri update et.
CREATE TRIGGER TakipEt 
ON dbo.[TespitEdilenler] 
AFTER INSERT
AS
BEGIN
		INSERT INTO TakipEdilenler(tspnesne_id,ZamanBilgisi) --arayüz ile diðer bilgilerin update olmasý saðlanacak.
		SELECT i.tespit_id,GETDATE()
		FROM inserted i
		WHERE i.hareketli_mi=1
END

CREATE TRIGGER NullKontrolEt_tkp
ON dbo.[TakipEdilenler]
AFTER UPDATE
AS
BEGIN
	IF EXISTS(
	SELECT 1 FROM inserted
	WHERE konum_enlem IS NULL OR konum_boylam IS NULL OR irtifa IS NULL OR Hiz IS NULL OR AlarmSeviyesi IS NULL)
		BEGIN
			RAISERROR ('Enlem, boylam, irtifa, hýz, alarm seviyesi deðerleri boþ geçilemez',16,1)
			ROLLBACK TRANSACTION
		END
END
--Hedeftanima

CREATE TRIGGER MudahaleEt 
ON dbo.[HedefTanima] 
AFTER INSERT
AS
BEGIN
		INSERT INTO MudahaleEdilenler(nesne_id,mdhlZamani)--arayüz ile diðer bilgilerin update olmasý saðlanacak.
		SELECT i.hedef_id,GETDATE()
		FROM inserted i
		WHERE i.tehditSeviyesi>=3
END

CREATE TRIGGER NullKontrolEt_mdhl
ON dbo.[MudahaleEdilenler]
AFTER UPDATE
AS
BEGIN
	IF EXISTS(
	SELECT 1 FROM inserted
	WHERE Aksiyon_id IS NULL OR Aks_enlem IS NULL OR Aks_boylam IS NULL OR Aks_irtifa IS NULL)
		BEGIN
			RAISERROR ('Aksiyon türü, enlem, boylam ve irtifa deðerleri boþ geçilemez',16,1)
			ROLLBACK TRANSACTION
		END
END