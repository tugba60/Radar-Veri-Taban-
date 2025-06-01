--2024 yýlýnda tespit edilen tüm nesneler
SELECT * FROM TespitEdilenler WHERE YEAR(ilkTespitZamani)=2024

--Tespit edilen araclarýn yýlýna göre gruplama
SELECT YEAR(ilkTespitZamani) AS YIL , COUNT(*) AS TespitEdilenNesneSayisi FROM TespitEdilenler GROUP BY YEAR(ilkTespitZamani)

--2024 yýlýnda tespit edilen harektli nesneler
SELECT * FROM TespitEdilenler WHERE YEAR(ilkTespitZamani)=2024 AND hareketli_mi=1

--Yýllara göre tespit edilen hareketli nesne sayýsý
SELECT YEAR(ilkTespitZamani) AS YIL, COUNT(*) AS HareketliNesneSayisi FROM TespitEdilenler 
WHERE hareketli_mi=1 
GROUP BY YEAR(ilkTespitZamani)

--Nesneyi tespit eden radarlarýn isimlerini getirme
SELECT Rdr.radarAdi, Tsp.konum_enlem,Tsp.konum_boylam,Tsp.irtifa FROM Radarlar Rdr
INNER JOIN TespitEdilenler Tsp ON Tsp.radar_id=Rdr.radar_id

--Nesneyi tespit eden radarlarý ve radarlarýn bulunduðu konumlarý bulma
SELECT Rdr.radarAdi, Rdr.Enlem, Rdr.Boylam, Tsp.konum_enlem,Tsp.konum_boylam,Tsp.irtifa 
FROM Radarlar Rdr
INNER JOIN TespitEdilenler Tsp ON Tsp.radar_id=Rdr.radar_id
ORDER BY Rdr.radarAdi

--Kaç farklý radardan nesne tespit edildiðini bulma
SELECT DISTINCT radar_id FROM TespitEdilenler

--Hangi birlikteki hangi radar türü ne kadar hedef tespit etti
SELECT Rdr.birlikAdi, Rdr.radarAdi, COUNT(Tsp.tespit_id) AS TespitEdilenNesneSayisi 
FROM Radarlar Rdr
INNER JOIN TespitEdilenler Tsp ON Tsp.radar_id=Rdr.radar_id 
GROUP BY Rdr.radarAdi,Rdr.birlikAdi
ORDER BY Rdr.birlikAdi, Rdr.radarAdi


-- Alarm seviyesi 3 ve üzeri olan nesnelerin hangi radar ile hangi enlem ve boylamda takip etmeye baþladýðýnýn bilgisi:
SELECT Rdr.radarAdi AS radarAdi, Tkp.konum_enlem AS Enlem, Tkp.konum_boylam AS Boylam, Tkp.AlarmSeviyesi FROM TakipEdilenler Tkp
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id=Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id=Tsp.radar_id
WHERE AlarmSeviyesi>=3
ORDER BY AlarmSeviyesi


--Alarm seviyesine göre kaç nesne olduðunun sayýsý
SELECT AlarmSeviyesi, COUNT(*) AS TakipEdilenNesneSayisi FROM TakipEdilenler GROUP BY AlarmSeviyesi

--Hýzý 600 den büyük olanlarý veya irtifasý 6000 den küçük ve hýzý 500 den fazla olanlarý alarm seviyeleri ve iz süreleri ile birlikte getir ve hangi radar tarafýndan tespit edildiðini getir
SELECT  Tkp.AlarmSeviyesi, Tkp.izSuresi TakipSuresi_sn, Rdr.radarAdi, Rdr.birlikAdi FROM TakipEdilenler Tkp
INNER JOIN TespitEdilenler Tsp ON Tkp.tspnesne_id=Tsp.tespit_id
INNER JOIN Radarlar Rdr ON Tsp.radar_id=Rdr.radar_id
WHERE Tkp.Hiz>600 OR (Tkp.irtifa<6000 AND Tkp.Hiz>500)
ORDER BY Tkp.AlarmSeviyesi 


--Bilinmeyen araçlarýn deðerlerini getirme
SELECT Hdf.IFFdurumu, IFF.iffModu, A.tur_adi, Tkp.AlarmSeviyesi ,Hdf.tehditSeviyesi,
Tkp.konum_enlem, Tkp.konum_boylam, Tkp.irtifa FROM HedefTanima Hdf
INNER JOIN AracTuru A ON A.tur_id=Hdf.hedefTuru
INNER JOIN TakipEdilenler Tkp ON Tkp.takip_id=Hdf.takip_id
LEFT JOIN IFFkodlari IFF ON IFF.iff_id=Hdf.iff_id
WHERE Hdf.bilinenArac_mi=0 
ORDER BY IFFdurumu

--Bilinmeyen araclarýn tehdit seviyesi alarm seviyesine göre artan veya sabit kalanlarý getir
SELECT Hdf.IFFdurumu, A.tur_adi, Tkp.AlarmSeviyesi ,Hdf.tehditSeviyesi FROM HedefTanima Hdf
INNER JOIN AracTuru A ON A.tur_id=Hdf.hedefTuru
INNER JOIN TakipEdilenler Tkp ON Tkp.takip_id=Hdf.takip_id
WHERE Hdf.bilinenArac_mi=0 AND (Tkp.AlarmSeviyesi = Hdf.tehditSeviyesi OR Tkp.AlarmSeviyesi < Hdf.tehditSeviyesi)
ORDER BY IFFdurumu


--Müdahale edilen araçlarý araç türlerine göre tespit takip ve müdahale süreçlerini getirme
SELECT  Arc.tur_adi AS AracTürü,Tsp.ilkTespitZamani,Tkp.izSuresi AS TakipSüresi_sn,Mdh.mdhlZamani AS MüdahaleZamani,
Aks.tur_adi AS AksiyonBiçimi, Rdr.radarAdi, Rdr.birlikAdi AS TespitEdilenYer FROM MudahaleEdilenler Mdh
INNER JOIN AksiyonTuru Aks ON Aks.tur_id = Mdh.Aksiyon_id 
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id= Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru=Arc.tur_id
INNER JOIN TakipEdilenler Tkp ON Hdf.takip_id=Tkp.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id=Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id=Tsp.radar_id
ORDER BY Hdf.tehditSeviyesi


--Müdahale edilen araç türlerinin yýllara göre daðýlýmý 
SELECT  Arc.tur_adi AS AracTürü, YEAR(Mdh.mdhlZamani) YIL, COUNT(*) AS MüdahaleEdilenAracSayisi FROM MudahaleEdilenler Mdh
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id= Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru=Arc.tur_id
GROUP BY Arc.tur_adi, YEAR(Mdh.mdhlZamani)
ORDER BY COUNT(*) DESC


--2025 ten önce müdahale edilen araçlarýn sayýsýný ve tür bilgisini getirme
SELECT  Arc.tur_adi AS AracTürü, YEAR(Mdh.mdhlZamani) YIL, COUNT(*) AS MüdahaleEdilenAracSayisi FROM MudahaleEdilenler Mdh
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id= Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru=Arc.tur_id
GROUP BY Arc.tur_adi, YEAR(Mdh.mdhlZamani)
HAVING YEAR (Mdh.mdhlZamani)<2025


--Müdahale edilen araçlarýn bilgileri 
SELECT Arc.tur_adi AS AracTürü, Tsp.ilkTespitZamani, 
	Tkp.izSuresi AS TakipSüresi_sn, Mdh.mdhlZamani AS MüdahaleZamani,
    DBO.SureHesapla(Tsp.ilkTespitZamani, Mdh.mdhlZamani) AS MüdahaleSüresi,
    Aks.tur_adi AS AksiyonBiçimi, Rdr.radarAdi, Rdr.birlikAdi AS TespitEdilenYer
FROM MudahaleEdilenler Mdh
INNER JOIN AksiyonTuru Aks ON Aks.tur_id = Mdh.Aksiyon_id 
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id = Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru = Arc.tur_id
INNER JOIN TakipEdilenler Tkp ON Hdf.takip_id = Tkp.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id = Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id = Tsp.radar_id
ORDER BY Hdf.tehditSeviyesi;


--Müdahale edilen araçlara ait çeþitli bilgi getirme
SELECT Arc.tur_adi AS AracTürü, Tsp.ilkTespitZamani,
	Tkp.izSuresi AS TakipSüresi_sn, Mdh.mdhlZamani AS MüdahaleZamani,
	DBO.SureHesaplaSaniye(Tsp.ilkTespitZamani, Mdh.mdhlZamani) AS MüdahaleSüresi,
    Aks.tur_adi AS AksiyonBiçimi, Rdr.radarAdi, Rdr.birlikAdi AS TespitEdilenYer
FROM MudahaleEdilenler Mdh
INNER JOIN AksiyonTuru Aks ON Aks.tur_id = Mdh.Aksiyon_id 
INNER JOIN HedefTanima Hdf ON Hdf.hedef_id = Mdh.nesne_id
INNER JOIN AracTuru Arc ON Hdf.hedefTuru = Arc.tur_id
INNER JOIN TakipEdilenler Tkp ON Hdf.takip_id = Tkp.takip_id
INNER JOIN TespitEdilenler Tsp ON Tsp.tespit_id = Tkp.tspnesne_id
INNER JOIN Radarlar Rdr ON Rdr.radar_id = Tsp.radar_id
ORDER BY Hdf.tehditSeviyesi;

--SUBQUERY
--IFF kodu alabildiklerimizden askeri amaçlý olanlarý getir
SELECT hedef_id, A.tur_adi, IFFdurumu,tehditSeviyesi,bilinenArac_mi,H.arac_adi FROM HedefTanima Hd
INNER JOIN AracTuru A ON A.tur_id=Hd.hedefTuru
LEFT JOIN HavaAraclari H ON H.arac_id=Hd.arac_id
WHERE iff_id IN 
	(SELECT iff_id From IFFkodlari WHERE iffModu='Mod-4' OR iffModu='Mod-5')


--IFF kodu bilinen ve tanýnan araçsa müdahale bilgilerini getir
SELECT * FROM MudahaleEdilenler M
WHERE EXISTS (SELECT 1 FROM HedefTanima H
				WHERE H.arac_id= M.nesne_id AND H.iff_id IS NOT NULL)


-- En yüksek hýzlý olan aracýn takip edildiðindeki bilgilerini getirme
SELECT * FROM TakipEdilenler
WHERE Hiz=(SELECT MAX(Hiz) FROM TakipEdilenler)


--En hýz ilk 5 araca ait çeþitli bilgileri getirme
SELECT * FROM MudahaleEdilenler M
INNER JOIN HedefTanima H ON H.hedef_id=M.nesne_id
INNER JOIN TakipEdilenler T ON T.takip_id=H.takip_id
WHERE T.takip_id=H.takip_id AND H.hedef_id=M.nesne_id AND 
	T.Hiz IN (SELECT TOP 5 Hiz FROM TakipEdilenler ORDER BY Hiz DESC)



