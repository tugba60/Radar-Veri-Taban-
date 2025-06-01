--2024 y�l�nda tespit edilen t�m nesneler
SELECT * FROM TespitEdilenler WHERE YEAR(ilkTespitZamani)=2024

--Tespit edilen araclar�n y�l�na g�re gruplama
SELECT YEAR(ilkTespitZamani) AS YIL , COUNT(*) AS TespitEdilenNesneSayisi FROM TespitEdilenler GROUP BY YEAR(ilkTespitZamani)

--2024 y�l�nda tespit edilen harektli nesneler
SELECT * FROM TespitEdilenler WHERE YEAR(ilkTespitZamani)=2024 AND hareketli_mi=1

--Y�llara g�re tespit edilen hareketli nesne say�s�
SELECT YEAR(ilkTespitZamani) AS YIL, COUNT(*) AS HareketliNesneSayisi FROM TespitEdilenler 
WHERE hareketli_mi=1 
GROUP BY YEAR(ilkTespitZamani)

--Nesneyi tespit eden radarlar�n isimlerini getirme
SELECT Rdr.radarAdi, Tsp.konum_enlem,Tsp.konum_boylam,Tsp.irtifa FROM Radarlar Rdr
INNER JOIN TespitEdilenler Tsp ON Tsp.radar_id=Rdr.radar_id

--Nesneyi tespit eden radarlar� ve radarlar�n bulundu�u konumlar� bulma
SELECT Rdr.radarAdi, Rdr.Enlem, Rdr.Boylam, Tsp.konum_enlem,Tsp.konum_boylam,Tsp.irtifa 
FROM Radarlar Rdr
INNER JOIN TespitEdilenler Tsp ON Tsp.radar_id=Rdr.radar_id
ORDER BY Rdr.radarAdi

--Ka� farkl� radardan nesne tespit edildi�ini bulma
SELECT DISTINCT radar_id FROM TespitEdilenler

--Hangi birlikteki hangi radar t�r� ne kadar hedef tespit etti
SELECT Rdr.birlikAdi, Rdr.radarAdi, COUNT(Tsp.tespit_id) AS TespitEdilenNesneSayisi 
FROM Radarlar Rdr
INNER JOIN TespitEdilenler Tsp ON Tsp.radar_id=Rdr.radar_id 
GROUP BY Rdr.radarAdi,Rdr.birlikAdi
ORDER BY Rdr.birlikAdi, Rdr.radarAdi


-- Alarm seviyesi 3 ve �zeri olan nesnelerin hangi radar ile hangi enlem ve boylamda takip etmeye ba�lad���n�n bilgisi:
SELECT Rdr.radarAdi AS radarAdi, Tkp.konum_enlem AS Enlem, Tkp.konum_boylam AS Boylam, Tkp.AlarmSeviyesi FROM TakipEdilenler Tkp
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id=Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id=Tsp.radar_id
WHERE AlarmSeviyesi>=3
ORDER BY AlarmSeviyesi


--Alarm seviyesine g�re ka� nesne oldu�unun say�s�
SELECT AlarmSeviyesi, COUNT(*) AS TakipEdilenNesneSayisi FROM TakipEdilenler GROUP BY AlarmSeviyesi

--H�z� 600 den b�y�k olanlar� veya irtifas� 6000 den k���k ve h�z� 500 den fazla olanlar� alarm seviyeleri ve iz s�releri ile birlikte getir ve hangi radar taraf�ndan tespit edildi�ini getir
SELECT  Tkp.AlarmSeviyesi, Tkp.izSuresi TakipSuresi_sn, Rdr.radarAdi, Rdr.birlikAdi FROM TakipEdilenler Tkp
INNER JOIN TespitEdilenler Tsp ON Tkp.tspnesne_id=Tsp.tespit_id
INNER JOIN Radarlar Rdr ON Tsp.radar_id=Rdr.radar_id
WHERE Tkp.Hiz>600 OR (Tkp.irtifa<6000 AND Tkp.Hiz>500)
ORDER BY Tkp.AlarmSeviyesi 


--Bilinmeyen ara�lar�n de�erlerini getirme
SELECT Hdf.IFFdurumu, IFF.iffModu, A.tur_adi, Tkp.AlarmSeviyesi ,Hdf.tehditSeviyesi,
Tkp.konum_enlem, Tkp.konum_boylam, Tkp.irtifa FROM HedefTanima Hdf
INNER JOIN AracTuru A ON A.tur_id=Hdf.hedefTuru
INNER JOIN TakipEdilenler Tkp ON Tkp.takip_id=Hdf.takip_id
LEFT JOIN IFFkodlari IFF ON IFF.iff_id=Hdf.iff_id
WHERE Hdf.bilinenArac_mi=0 
ORDER BY IFFdurumu

--Bilinmeyen araclar�n tehdit seviyesi alarm seviyesine g�re artan veya sabit kalanlar� getir
SELECT Hdf.IFFdurumu, A.tur_adi, Tkp.AlarmSeviyesi ,Hdf.tehditSeviyesi FROM HedefTanima Hdf
INNER JOIN AracTuru A ON A.tur_id=Hdf.hedefTuru
INNER JOIN TakipEdilenler Tkp ON Tkp.takip_id=Hdf.takip_id
WHERE Hdf.bilinenArac_mi=0 AND (Tkp.AlarmSeviyesi = Hdf.tehditSeviyesi OR Tkp.AlarmSeviyesi < Hdf.tehditSeviyesi)
ORDER BY IFFdurumu


--M�dahale edilen ara�lar� ara� t�rlerine g�re tespit takip ve m�dahale s�re�lerini getirme
SELECT  Arc.tur_adi AS AracT�r�,Tsp.ilkTespitZamani,Tkp.izSuresi AS TakipS�resi_sn,Mdh.mdhlZamani AS M�dahaleZamani,
Aks.tur_adi AS AksiyonBi�imi, Rdr.radarAdi, Rdr.birlikAdi AS TespitEdilenYer FROM MudahaleEdilenler Mdh
INNER JOIN AksiyonTuru Aks ON Aks.tur_id = Mdh.Aksiyon_id 
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id= Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru=Arc.tur_id
INNER JOIN TakipEdilenler Tkp ON Hdf.takip_id=Tkp.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id=Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id=Tsp.radar_id
ORDER BY Hdf.tehditSeviyesi


--M�dahale edilen ara� t�rlerinin y�llara g�re da��l�m� 
SELECT  Arc.tur_adi AS AracT�r�, YEAR(Mdh.mdhlZamani) YIL, COUNT(*) AS M�dahaleEdilenAracSayisi FROM MudahaleEdilenler Mdh
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id= Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru=Arc.tur_id
GROUP BY Arc.tur_adi, YEAR(Mdh.mdhlZamani)
ORDER BY COUNT(*) DESC


--2025 ten �nce m�dahale edilen ara�lar�n say�s�n� ve t�r bilgisini getirme
SELECT  Arc.tur_adi AS AracT�r�, YEAR(Mdh.mdhlZamani) YIL, COUNT(*) AS M�dahaleEdilenAracSayisi FROM MudahaleEdilenler Mdh
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id= Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru=Arc.tur_id
GROUP BY Arc.tur_adi, YEAR(Mdh.mdhlZamani)
HAVING YEAR (Mdh.mdhlZamani)<2025


--M�dahale edilen ara�lar�n bilgileri 
SELECT Arc.tur_adi AS AracT�r�, Tsp.ilkTespitZamani, 
	Tkp.izSuresi AS TakipS�resi_sn, Mdh.mdhlZamani AS M�dahaleZamani,
    DBO.SureHesapla(Tsp.ilkTespitZamani, Mdh.mdhlZamani) AS M�dahaleS�resi,
    Aks.tur_adi AS AksiyonBi�imi, Rdr.radarAdi, Rdr.birlikAdi AS TespitEdilenYer
FROM MudahaleEdilenler Mdh
INNER JOIN AksiyonTuru Aks ON Aks.tur_id = Mdh.Aksiyon_id 
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id = Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru = Arc.tur_id
INNER JOIN TakipEdilenler Tkp ON Hdf.takip_id = Tkp.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id = Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id = Tsp.radar_id
ORDER BY Hdf.tehditSeviyesi;


--M�dahale edilen ara�lara ait �e�itli bilgi getirme
SELECT Arc.tur_adi AS AracT�r�, Tsp.ilkTespitZamani,
	Tkp.izSuresi AS TakipS�resi_sn, Mdh.mdhlZamani AS M�dahaleZamani,
	DBO.SureHesaplaSaniye(Tsp.ilkTespitZamani, Mdh.mdhlZamani) AS M�dahaleS�resi,
    Aks.tur_adi AS AksiyonBi�imi, Rdr.radarAdi, Rdr.birlikAdi AS TespitEdilenYer
FROM MudahaleEdilenler Mdh
INNER JOIN AksiyonTuru Aks ON Aks.tur_id = Mdh.Aksiyon_id 
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id = Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru = Arc.tur_id
INNER JOIN TakipEdilenler Tkp ON Hdf.takip_id = Tkp.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id = Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id = Tsp.radar_id
ORDER BY Hdf.tehditSeviyesi;

--SUBQUERY
--IFF kodu alabildiklerimizden askeri ama�l� olanlar� getir
SELECT hedef_id, A.tur_adi, IFFdurumu,tehditSeviyesi,bilinenArac_mi,H.arac_adi FROM HedefTanima Hd
INNER JOIN AracTuru A ON A.tur_id=Hd.hedefTuru
LEFT JOIN HavaAraclari H ON H.arac_id=Hd.arac_id
WHERE iff_id IN 
	(SELECT iff_id From IFFkodlari WHERE iffModu='Mod-4' OR iffModu='Mod-5')


--IFF kodu bilinen ve tan�nan ara�sa m�dahale bilgilerini getir
SELECT * FROM MudahaleEdilenler M
WHERE EXISTS (SELECT 1 FROM HedefTanima H
				WHERE H.arac_id= M.nesne_id AND H.iff_id IS NOT NULL)


-- En y�ksek h�zl� olan arac�n takip edildi�indeki bilgilerini getirme
SELECT * FROM TakipEdilenler
WHERE Hiz=(SELECT MAX(Hiz) FROM TakipEdilenler)


--En h�z ilk 5 araca ait �e�itli bilgileri getirme
SELECT * FROM MudahaleEdilenler M
INNER JOIN HedefTanima H ON H.hedef_id=M.nesne_id
INNER JOIN TakipEdilenler T ON T.takip_id=H.takip_id
WHERE T.takip_id=H.takip_id AND H.hedef_id=M.nesne_id AND 
	T.Hiz IN (SELECT TOP 5 Hiz FROM TakipEdilenler ORDER BY Hiz DESC)



