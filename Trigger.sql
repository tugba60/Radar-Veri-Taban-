--       TespitEdilenler
--e�er harektli_mi 1 ise takip edilenlere al aray�z ile di�er bilgileri update et.
CREATE TRIGGER TakipEt 
ON dbo.[TespitEdilenler] 
AFTER INSERT
AS
BEGIN
		INSERT INTO TakipEdilenler(tspnesne_id,ZamanBilgisi) --aray�z ile di�er bilgilerin update olmas� sa�lanacak.
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
			RAISERROR ('Enlem, boylam, irtifa, h�z, alarm seviyesi de�erleri bo� ge�ilemez',16,1)
			ROLLBACK TRANSACTION
		END
END
--Hedeftanima

CREATE TRIGGER MudahaleEt 
ON dbo.[HedefTanima] 
AFTER INSERT
AS
BEGIN
		INSERT INTO MudahaleEdilenler(nesne_id,mdhlZamani)--aray�z ile di�er bilgilerin update olmas� sa�lanacak.
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
			RAISERROR ('Aksiyon t�r�, enlem, boylam ve irtifa de�erleri bo� ge�ilemez',16,1)
			ROLLBACK TRANSACTION
		END
END