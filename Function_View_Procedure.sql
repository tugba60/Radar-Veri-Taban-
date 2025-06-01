USE [RADARHEDEF];
GO

CREATE FUNCTION DBO.SureHesapla(@ilk DATETIME,@son DATETIME)
RETURNS INT
AS
BEGIN
	DECLARE @Fark INT
	SET @Fark = DATEDIFF(MINUTE,@ilk,@son);
RETURN @Fark;
END

CREATE FUNCTION DBO.SureHesaplaSaniye(@ilk DATETIME,@son DATETIME)
RETURNS INT
AS
BEGIN
	DECLARE @Fark INT
	SET @Fark = DATEDIFF(MINUTE,@ilk,@son);
RETURN @Fark*60;
END




CREATE VIEW AyrintiliBilgi
AS
SELECT A.tur_adi NesneTuru,Tsp.ilkTespitZamani TespitZamani, T.ZamanBilgisi TakibeBaþlamaZamani, 
M.mdhlZamani MüdahaleZamani, H.tehditSeviyesi, T.Hiz, IFF.iffModu ,T.Tahmini_Varis_Noktasi, M.Aciklama
FROM MudahaleEdilenler M
INNER JOIN HedefTanima H ON H.hedef_id=M.nesne_id
INNER JOIN TakipEdilenler T ON T.takip_id=H.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id=T.tspnesne_id
INNER JOIN AracTuru A ON A.tur_id= H.hedefTuru
LEFT JOIN IFFkodlari IFF ON IFF.iff_id=H.iff_id

 
SELECT * FROM AyrintiliBilgi

ALTER VIEW AyrintiliBilgi 
AS
SELECT A.tur_adi AS NesneTuru,Tsp.ilkTespitZamani AS TespitZamani, T.ZamanBilgisi AS TakibeBaþlamaZamani,
M.mdhlZamani AS MüdahaleZamani, DATEDIFF(MINUTE,Tsp.ilkTespitZamani,M.mdhlZamani) AS ToplamSure_dk, H.tehditSeviyesi AS TehditSeviyesi,
T.Hiz AS Hiz, M.Aks_irtifa AS Müdahale_irtifasi , IFF.iffModu AS IFF_Modu ,T.Tahmini_Varis_Noktasi, M.Aciklama
FROM MudahaleEdilenler M
INNER JOIN HedefTanima H ON H.hedef_id=M.nesne_id
INNER JOIN TakipEdilenler T ON T.takip_id=H.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id=T.tspnesne_id
INNER JOIN AracTuru A ON A.tur_id= H.hedefTuru
LEFT JOIN IFFkodlari IFF ON IFF.iff_id=H.iff_id

CREATE PROCEDURE AlrSevDogruMu
@id AS INT
AS
BEGIN
DECLARE @alarm AS INT
SET @alarm = (SELECT AlarmSeviyesi FROM TakipEdilenler WHERE @id=takip_id)
DECLARE @hiz AS FLOAT
SET @hiz = (SELECT Hiz FROM TakipEdilenler WHERE @id=takip_id)
DECLARE @irtifa AS DECIMAL(7,2)
SET @irtifa = (SELECT irtifa FROM TakipEdilenler WHERE @id=takip_id)
	IF  @hiz> 600 AND @alarm>=3
		SELECT 'Alarm seviyesi doðru'
	ELSE IF @hiz> 800 AND @alarm=5
		SELECT 'Alarm seviyesi doðru'
	ELSE IF @hiz>600 AND @irtifa <6000 AND @alarm=5
		SELECT 'Alarm seviyesi doðru'
	ELSE IF @irtifa>45000 AND @alarm>=4
		SELECT 'Alarm seviyesi doðru'
	ELSE
		SELECT 'Alarm seviyesi yanlýþ'
END

ALTER PROCEDURE AlrSevDogruMu
@id AS INT
AS
BEGIN
DECLARE @alarm AS INT
SET @alarm = (SELECT AlarmSeviyesi FROM TakipEdilenler WHERE @id=takip_id)
DECLARE @hiz AS FLOAT
SET @hiz = (SELECT Hiz FROM TakipEdilenler WHERE @id=takip_id)
DECLARE @irtifa AS DECIMAL(7,2)
SET @irtifa = (SELECT irtifa FROM TakipEdilenler WHERE @id=takip_id)
	IF  @hiz> 600 AND @alarm>=3
		SELECT 'Alarm seviyesi doðru'
	ELSE IF @hiz> 800 AND @alarm=5
		SELECT 'Alarm seviyesi doðru'
	ELSE IF @hiz>600 AND @irtifa <6000 AND @alarm=5
		SELECT 'Alarm seviyesi doðru'
	ELSE IF @irtifa>45000 AND @alarm>=4
		SELECT 'Alarm seviyesi doðru'
	ELSE
		SELECT 'Alarm seviyesi yanlýþ ya da öyle bir nesne yok'
END

EXEC AlrSevDogruMu @id = 7;
EXEC AlrSevDogruMu @id = 1;
