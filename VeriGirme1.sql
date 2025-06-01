INSERT INTO FrekansBandlari (bant_adi) VALUES ('L-Band')
INSERT INTO FrekansBandlari (bant_adi) VALUES ('S-Band')
INSERT INTO FrekansBandlari (bant_adi) VALUES ('C-Band')
INSERT INTO FrekansBandlari (bant_adi) VALUES ('Ku-Band')
INSERT INTO FrekansBandlari (bant_adi) VALUES ('X-Band')
INSERT INTO FrekansBandlari (bant_adi) VALUES ('K-Band')
INSERT INTO FrekansBandlari (bant_adi) VALUES ('Ka-Band')

SELECT * FROM FrekansBandlari ORDER BY bant_id

INSERT INTO IFFkodlari (iffModu,Baslangic,Son) VALUES ('Mod-1','1950-01-01','1998-11-24')
INSERT INTO IFFkodlari (iffModu,Baslangic,Son) VALUES ('Mod-2','1953-10-23','2035-12-31')
INSERT INTO IFFkodlari (iffModu,Baslangic,Son) VALUES ('Mod-3/A','1957-05-11','2150-12-31')
INSERT INTO IFFkodlari (iffModu,Baslangic,Son) VALUES ('Mod-C','1960-09-24','2150-12-31')
INSERT INTO IFFkodlari (iffModu,Baslangic,Son) VALUES ('Mod-4','1969-01-31','2025-12-31')
INSERT INTO IFFkodlari (iffModu,Baslangic,Son) VALUES ('Mod-5','2010-07-17','2150-12-31')

SELECT * FROM IFFkodlari

INSERT INTO RadarTipleri (tip_adi) VALUES ('Mekanik Taramalý Radar (MSR)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('Elektronik Taramalý Radar')
INSERT INTO RadarTipleri (tip_adi) VALUES ('Darbeli Radar')
INSERT INTO RadarTipleri (tip_adi) VALUES ('Sürekli Dalga (CW) Radar')
INSERT INTO RadarTipleri (tip_adi) VALUES ('PESA (Pasif Faz Dizi Anten)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('AESA (Aktif Faz Dizi Anten)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('SAR (Sentetik Açýklýklý Radar)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('MTI (Hareketli Hedef Göstergesi)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('FMCW(Frekans Mod Sürekli Dalga)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('LPI – Low Probability of Intercept')

SELECT * FROM RadarTipleri   

INSERT INTO RadarTurleri (tur_adi) VALUES ('Hava Savunma Radarý')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Erken Ýhbar Radarý')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Hava Trafik Radarý-(ATC)')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Hava Durumu Radarý')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Hedef Takip Radarý')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Gözetleme Radarý')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Yüksek Çözünürlüklü Radar')

SELECT * FROM RadarTurleri ORDER BY tur_id

INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Sabit Frekanslý')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Darbeli')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('FMCW')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Chirp Sinyal')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Faz Kodlu Darbe')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('SAR')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('LPI')

SELECT * FROM SinyalTurleri ORDER BY sinyal_id

INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('TUSAÞ','1973','MEHMET','DEMÝROÐLU')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('BAYKAR','1984','HALUK','BAYRAKTAR')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('ASELSAN','1975','AHMET','AKYOL')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('ROKETSAN','1988','MURAT','ÝKÝNCÝ')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('HAVELSAN','1982','MEHMET AKÝF','NACAR')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('STM','1991','ÖZGÜR','GÜLERYÜZ')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('FNSS','1988','NAÝL','KURT')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('MKE','1950','ÝLHAMÝ','KELEÞ')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('METEKSAN SAVUNMA','2006','AZÝZ TUNÇ','BATUM')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('AIRBUS','1979','Guillaume','Faury')

SELECT * FROM UreticiFirma

INSERT INTO AracTuru (tur_adi) VALUES ('ÝNSANSIZ HAVA ARACI-ÝHA')
INSERT INTO AracTuru (tur_adi) VALUES ('SÝLAHLI ÝHA-SÝHA')
INSERT INTO AracTuru (tur_adi) VALUES ('HELÝKOPTER')
INSERT INTO AracTuru (tur_adi) VALUES ('YOLCU UÇAÐI')
INSERT INTO AracTuru (tur_adi) VALUES ('KARGO UÇAÐI')
INSERT INTO AracTuru (tur_adi) VALUES ('ASKERÝ UÇAK-JET')
INSERT INTO AracTuru (tur_adi) VALUES ('SAVAÞ GEMÝLERÝ')
INSERT INTO AracTuru (tur_adi) VALUES ('DENÝZALTI')
INSERT INTO AracTuru (tur_adi) VALUES ('ÝNSANSIZ DENÝZ ARAÇLARI')
INSERT INTO AracTuru (tur_adi) VALUES ('ROKETLER')
INSERT INTO AracTuru (tur_adi) VALUES ('BALÝSTÝK FÜZE')
INSERT INTO AracTuru (tur_adi) VALUES ('MENZÝLLÝ FÜZE')
INSERT INTO AracTuru (tur_adi) VALUES('ÖZEL JET')
INSERT INTO AracTuru (tur_adi) VALUES('ÝNSANSIZ SAVAÞ UÇAÐI')


SELECT * FROM AracTuru ORDER BY tur_id

INSERT INTO GorevModu (mod_adi) VALUES ('MANUEL MOD')
INSERT INTO GorevModu (mod_adi) VALUES ('OTOMATÝK MOD')
INSERT INTO GorevModu (mod_adi) VALUES ('YÜKSEK ÝRTÝFA MOD')
INSERT INTO GorevModu (mod_adi) VALUES ('DÝKEY ÝNÝÞ KALKIÞ MOD')

SELECT * FROM GorevModu ORDER BY mod_id

INSERT INTO GorevTuru (tur_adi) VALUES ('TAÞIMA GÖREVÝ')
INSERT INTO GorevTuru (tur_adi) VALUES ('KEÞÝF GÖREVÝ')
INSERT INTO GorevTuru (tur_adi) VALUES ('SAVUNMA GÖREVÝ')
INSERT INTO GorevTuru (tur_adi) VALUES ('ARAÞTIRMA VE GELÝÞTÝRME GÖREVÝ')
INSERT INTO GorevTuru (tur_adi) VALUES ('ARAMA KURTARMA')
INSERT INTO GorevTuru (tur_adi) VALUES ('HAVA AMBULANSI')

SELECT * FROM GorevTuru ORDER BY tur_id

INSERT INTO AksiyonTuru (tur_adi) VALUES ('ESKORT ETME')
INSERT INTO AksiyonTuru (tur_adi) VALUES ('FÜZE SAVUNMA SÝSTEMLERÝ ÝLE MÜDAHALE')
INSERT INTO AksiyonTuru (tur_adi) VALUES ('SAVAÞ UÇAKLARI ÝLE MÜDAHALE')

SELECT * FROM AksiyonTuru

INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 100-G',3,'2023',536129232,'Ankara Ýl Jandarma Topçu Tugayý','03-04-2024',39.9208,32.8541,1250,8,180,360,24,3,6,4,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 100-G',3,'2023',536122534,'ÝSTANBUL Ýl Jandarma Topçu Tugayý','2025-01-01',41.9678,29.8121,100,8,180,360,24,3,6,4,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('HTRS 100',3,'2021',536441246,'TRABZON Ýl Jandarma Deniz Komutanlýðý','2025-03-01',39.1265,41.9834,550,300,200,360,14,3,3,2,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 200-G',3,'2024',536122733,'KAYSERÝ Talas Ýlçe Jandarma','2025-04-17',38.7128,35.5672,1250,8,180,360,24,7,6,null,5,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 200-G',3,'2024',536126544,'ANKARA Ýl Jandarma Topçu Tugayý','2024-01-12',40.7128,33.5672,1750,8,180,360,24,7,6,null,5,0)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 100-G',3,'2023',536122534,'ÝSTANBUL Ýl Jandarma Topçu Tugayý','2025-01-01',41.9678,29.8121,100,8,180,360,24,3,6,4,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('HTRS 100',3,'2021',536231263,'HATAY Ýl Jandarma Deniz Komutanlýðý','2023-11-23',36.1265,35.9834,250,300,200,360,14,3,3,2,2,0)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('HTRS 100',3,'2021',536441246,'TRABZON Ýl Jandarma Deniz Komutanlýðý','2025-03-01',39.1265,41.9834,550,300,200,360,14,3,3,2,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('MÝLSAR',9,'2021',123254813,'ÝSTANBUL Ýl Jandarma Ýstihbarat ve Keþif','2022-08-23',0.0,0.0,22000,166,200,360,20,8,7,null,6,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 200-G',3,'2024',536126544,'ANKARA Ýl Jandarma Topçu Tugayý','2024-01-12',40.7128,33.5672,1750,8,180,360,24,7,6,null,5,0)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('MÝLSAR',9,'2021',123298516,'KARS Ýl Jandarma Ýstihbarat ve Keþif','2023-09-11',0.0,0.0,22000,166,200,360,20,8,7,null,6,1)

SELECT * FROM Radarlar ORDER BY radar_id

INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('Bayraktar KIZILELMA','24-1453',13,'KIZILELMA (MÝUS)',2,'Batman 14. Ýnsansýz Uçak Sistemleri Üs Komutanlýðý','2024-12-03',956,3000,45000,0.24,3,2,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('Bayraktar KIZILELMA','24-1454',13,'KIZILELMA (MÝUS)',2,'Elâzýð Taktik ÝHA Birlik Komutanlýðý','2025-01-07',956,3000,45000,0.24,3,3,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('Bayraktar KIZILELMA','24-1455',13,'KIZILELMA (MÝUS)',2,'Çanakkale 313. Deniz ÝHA Filo Komutanlýðý','2024-11-11',956,3000,45000,0.24,3,2,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('GÖKBEY HELÝKOPTER','23-1304',3,'T625 GÖKBEY',1,'KARS ÝL JANDARMA Komutanlýðý','2024-06-03',297,948,6096,10,5,1,3,1)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('GÖKBEY HELÝKOPTER','23-1305',3,'T625 GÖKBEY',1,'HAKKARÝ ÝL JANDARMA Komutanlýðý','2025-03-22',297,948,6096,10,5,1,3,1)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('GÖKBEY HELÝKOPTER','23-1306',3,'T625 GÖKBEY',1,'ARDAHAN ÝL JANDARMA Komutanlýðý','2024-11-12',297,948,6096,10,5,1,5,4)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('GÖKBEY HELÝKOPTER','23-1307',3,'T625 GÖKBEY',1,'ANKARA ÝL JANDARMA KOMUTANLIÐI-JÖAK BÝRLÝÐÝ','2025-01-02',297,948,6096,10,5,1,5,4)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('GÖKBEY HELÝKOPTER','23-1308',3,'T625 GÖKBEY',1,'Prof. Dr. Cemil Taþcýoðlu Þehir Hastanesi','2025-02-11',297,948,6096,10,5,1,6,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('ATAK HELÝKOPTER','14-1048',3,'T129 ATAK',1,'ÝSTANBUL ÝL JANDARMA Komutanlýðý','2015-05-08',281,537,4572,9.1,3,1,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('ATAK HELÝKOPTER','14-1049',3,'T129 ATAK',1,'ANKARA ÝL JANDARMA Komutanlýðý','2016-03-19',281,537,4572,9.1,3,1,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('ATAK HELÝKOPTER','14-1050',3,'T129 ATAK',1,'ÝZMÝR ÝL JANDARMA Komutanlýðý','2016-12-01',281,537,4572,9.1,3,1,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('AIRBUS YOLCU UÇAÐI','94-1234',4,'AIRBUS A330-300',10,'ÝSTANBUL SABÝHA GÖKÇEN HAVALÝMANI','2023-05-08',880,11750,4572,150.5,14,1,1,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('AIRBUS YOLCU UÇAÐI','94-1235',4,'AIRBUS A330-300',10,'ADANA ÞAKÝRPAÞA HAVALÝMANI','2007-03-19',880,11750,4572,150.5,14,1,1,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('AIRBUS YOLCU UÇAÐI','94-1236',4,'AIRBUS A330-300',10,'Ankara Esenboða Havalimaný','2010-12-01',880,11750,4572,150.5,14,1,1,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('BAYRAKTAR TB2','14-2019',2,'Bayraktar TB2',2,'ANKARA EMNÝYET GENEL MÜDÜRLÜÐÜ','2016-04-21',222,4500,22000,0.01,27,3,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('BAYRAKTAR TB2','14-2017',2,'Bayraktar TB2',2,'MÝT','2014-10-08',222,4500,22000,0.01,27,3,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('BAYRAKTAR TB2','14-2018',2,'Bayraktar TB2',2,'MÝT','2015-03-16',222,4500,22000,0.01,27,3,2,5)


SELECT * FROM HavaAraclari ORDER BY arac_id
