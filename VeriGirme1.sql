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

INSERT INTO RadarTipleri (tip_adi) VALUES ('Mekanik Taramal� Radar (MSR)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('Elektronik Taramal� Radar')
INSERT INTO RadarTipleri (tip_adi) VALUES ('Darbeli Radar')
INSERT INTO RadarTipleri (tip_adi) VALUES ('S�rekli Dalga (CW) Radar')
INSERT INTO RadarTipleri (tip_adi) VALUES ('PESA (Pasif Faz Dizi Anten)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('AESA (Aktif Faz Dizi Anten)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('SAR (Sentetik A��kl�kl� Radar)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('MTI (Hareketli Hedef G�stergesi)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('FMCW(Frekans Mod S�rekli Dalga)')
INSERT INTO RadarTipleri (tip_adi) VALUES ('LPI � Low Probability of Intercept')

SELECT * FROM RadarTipleri   

INSERT INTO RadarTurleri (tur_adi) VALUES ('Hava Savunma Radar�')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Erken �hbar Radar�')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Hava Trafik Radar�-(ATC)')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Hava Durumu Radar�')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Hedef Takip Radar�')
INSERT INTO RadarTurleri (tur_adi) VALUES ('G�zetleme Radar�')
INSERT INTO RadarTurleri (tur_adi) VALUES ('Y�ksek ��z�n�rl�kl� Radar')

SELECT * FROM RadarTurleri ORDER BY tur_id

INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Sabit Frekansl�')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Darbeli')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('FMCW')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Chirp Sinyal')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('Faz Kodlu Darbe')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('SAR')
INSERT INTO SinyalTurleri (sinyal_adi) VALUES ('LPI')

SELECT * FROM SinyalTurleri ORDER BY sinyal_id

INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('TUSA�','1973','MEHMET','DEM�RO�LU')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('BAYKAR','1984','HALUK','BAYRAKTAR')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('ASELSAN','1975','AHMET','AKYOL')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('ROKETSAN','1988','MURAT','�K�NC�')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('HAVELSAN','1982','MEHMET AK�F','NACAR')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('STM','1991','�ZG�R','G�LERY�Z')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('FNSS','1988','NA�L','KURT')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('MKE','1950','�LHAM�','KELE�')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('METEKSAN SAVUNMA','2006','AZ�Z TUN�','BATUM')
INSERT INTO UreticiFirma (firmaAdi,kurulusYili,firmaCIO_ad,firmaCIO_soyad) VALUES ('AIRBUS','1979','Guillaume','Faury')

SELECT * FROM UreticiFirma

INSERT INTO AracTuru (tur_adi) VALUES ('�NSANSIZ HAVA ARACI-�HA')
INSERT INTO AracTuru (tur_adi) VALUES ('S�LAHLI �HA-S�HA')
INSERT INTO AracTuru (tur_adi) VALUES ('HEL�KOPTER')
INSERT INTO AracTuru (tur_adi) VALUES ('YOLCU U�A�I')
INSERT INTO AracTuru (tur_adi) VALUES ('KARGO U�A�I')
INSERT INTO AracTuru (tur_adi) VALUES ('ASKER� U�AK-JET')
INSERT INTO AracTuru (tur_adi) VALUES ('SAVA� GEM�LER�')
INSERT INTO AracTuru (tur_adi) VALUES ('DEN�ZALTI')
INSERT INTO AracTuru (tur_adi) VALUES ('�NSANSIZ DEN�Z ARA�LARI')
INSERT INTO AracTuru (tur_adi) VALUES ('ROKETLER')
INSERT INTO AracTuru (tur_adi) VALUES ('BAL�ST�K F�ZE')
INSERT INTO AracTuru (tur_adi) VALUES ('MENZ�LL� F�ZE')
INSERT INTO AracTuru (tur_adi) VALUES('�ZEL JET')
INSERT INTO AracTuru (tur_adi) VALUES('�NSANSIZ SAVA� U�A�I')


SELECT * FROM AracTuru ORDER BY tur_id

INSERT INTO GorevModu (mod_adi) VALUES ('MANUEL MOD')
INSERT INTO GorevModu (mod_adi) VALUES ('OTOMAT�K MOD')
INSERT INTO GorevModu (mod_adi) VALUES ('Y�KSEK �RT�FA MOD')
INSERT INTO GorevModu (mod_adi) VALUES ('D�KEY �N�� KALKI� MOD')

SELECT * FROM GorevModu ORDER BY mod_id

INSERT INTO GorevTuru (tur_adi) VALUES ('TA�IMA G�REV�')
INSERT INTO GorevTuru (tur_adi) VALUES ('KE��F G�REV�')
INSERT INTO GorevTuru (tur_adi) VALUES ('SAVUNMA G�REV�')
INSERT INTO GorevTuru (tur_adi) VALUES ('ARA�TIRMA VE GEL��T�RME G�REV�')
INSERT INTO GorevTuru (tur_adi) VALUES ('ARAMA KURTARMA')
INSERT INTO GorevTuru (tur_adi) VALUES ('HAVA AMBULANSI')

SELECT * FROM GorevTuru ORDER BY tur_id

INSERT INTO AksiyonTuru (tur_adi) VALUES ('ESKORT ETME')
INSERT INTO AksiyonTuru (tur_adi) VALUES ('F�ZE SAVUNMA S�STEMLER� �LE M�DAHALE')
INSERT INTO AksiyonTuru (tur_adi) VALUES ('SAVA� U�AKLARI �LE M�DAHALE')

SELECT * FROM AksiyonTuru

INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 100-G',3,'2023',536129232,'Ankara �l Jandarma Top�u Tugay�','03-04-2024',39.9208,32.8541,1250,8,180,360,24,3,6,4,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 100-G',3,'2023',536122534,'�STANBUL �l Jandarma Top�u Tugay�','2025-01-01',41.9678,29.8121,100,8,180,360,24,3,6,4,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('HTRS 100',3,'2021',536441246,'TRABZON �l Jandarma Deniz Komutanl���','2025-03-01',39.1265,41.9834,550,300,200,360,14,3,3,2,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 200-G',3,'2024',536122733,'KAYSER� Talas �l�e Jandarma','2025-04-17',38.7128,35.5672,1250,8,180,360,24,7,6,null,5,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 200-G',3,'2024',536126544,'ANKARA �l Jandarma Top�u Tugay�','2024-01-12',40.7128,33.5672,1750,8,180,360,24,7,6,null,5,0)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 100-G',3,'2023',536122534,'�STANBUL �l Jandarma Top�u Tugay�','2025-01-01',41.9678,29.8121,100,8,180,360,24,3,6,4,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('HTRS 100',3,'2021',536231263,'HATAY �l Jandarma Deniz Komutanl���','2023-11-23',36.1265,35.9834,250,300,200,360,14,3,3,2,2,0)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('HTRS 100',3,'2021',536441246,'TRABZON �l Jandarma Deniz Komutanl���','2025-03-01',39.1265,41.9834,550,300,200,360,14,3,3,2,2,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('M�LSAR',9,'2021',123254813,'�STANBUL �l Jandarma �stihbarat ve Ke�if','2022-08-23',0.0,0.0,22000,166,200,360,20,8,7,null,6,1)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('AURA 200-G',3,'2024',536126544,'ANKARA �l Jandarma Top�u Tugay�','2024-01-12',40.7128,33.5672,1750,8,180,360,24,7,6,null,5,0)
INSERT INTO Radarlar (radarAdi,ureticiFirma,uretimTarihi,serinum,birlikAdi,envGiris,Enlem,Boylam,Irtifa,Maxmenzil,Kapasite,AzimutAcisi,ElevasyonAcisi,tip_id,tur_id,frekans_id,sinyal_id,CalismaDurumu)
VALUES ('M�LSAR',9,'2021',123298516,'KARS �l Jandarma �stihbarat ve Ke�if','2023-09-11',0.0,0.0,22000,166,200,360,20,8,7,null,6,1)

SELECT * FROM Radarlar ORDER BY radar_id

INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('Bayraktar KIZILELMA','24-1453',13,'KIZILELMA (M�US)',2,'Batman 14. �nsans�z U�ak Sistemleri �s Komutanl���','2024-12-03',956,3000,45000,0.24,3,2,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('Bayraktar KIZILELMA','24-1454',13,'KIZILELMA (M�US)',2,'El�z�� Taktik �HA Birlik Komutanl���','2025-01-07',956,3000,45000,0.24,3,3,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('Bayraktar KIZILELMA','24-1455',13,'KIZILELMA (M�US)',2,'�anakkale 313. Deniz �HA Filo Komutanl���','2024-11-11',956,3000,45000,0.24,3,2,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('G�KBEY HEL�KOPTER','23-1304',3,'T625 G�KBEY',1,'KARS �L JANDARMA Komutanl���','2024-06-03',297,948,6096,10,5,1,3,1)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('G�KBEY HEL�KOPTER','23-1305',3,'T625 G�KBEY',1,'HAKKAR� �L JANDARMA Komutanl���','2025-03-22',297,948,6096,10,5,1,3,1)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('G�KBEY HEL�KOPTER','23-1306',3,'T625 G�KBEY',1,'ARDAHAN �L JANDARMA Komutanl���','2024-11-12',297,948,6096,10,5,1,5,4)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('G�KBEY HEL�KOPTER','23-1307',3,'T625 G�KBEY',1,'ANKARA �L JANDARMA KOMUTANLI�I-J�AK B�RL���','2025-01-02',297,948,6096,10,5,1,5,4)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('G�KBEY HEL�KOPTER','23-1308',3,'T625 G�KBEY',1,'Prof. Dr. Cemil Ta�c�o�lu �ehir Hastanesi','2025-02-11',297,948,6096,10,5,1,6,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('ATAK HEL�KOPTER','14-1048',3,'T129 ATAK',1,'�STANBUL �L JANDARMA Komutanl���','2015-05-08',281,537,4572,9.1,3,1,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('ATAK HEL�KOPTER','14-1049',3,'T129 ATAK',1,'ANKARA �L JANDARMA Komutanl���','2016-03-19',281,537,4572,9.1,3,1,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('ATAK HEL�KOPTER','14-1050',3,'T129 ATAK',1,'�ZM�R �L JANDARMA Komutanl���','2016-12-01',281,537,4572,9.1,3,1,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('AIRBUS YOLCU U�A�I','94-1234',4,'AIRBUS A330-300',10,'�STANBUL SAB�HA G�K�EN HAVAL�MANI','2023-05-08',880,11750,4572,150.5,14,1,1,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('AIRBUS YOLCU U�A�I','94-1235',4,'AIRBUS A330-300',10,'ADANA �AK�RPA�A HAVAL�MANI','2007-03-19',880,11750,4572,150.5,14,1,1,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('AIRBUS YOLCU U�A�I','94-1236',4,'AIRBUS A330-300',10,'Ankara Esenbo�a Havaliman�','2010-12-01',880,11750,4572,150.5,14,1,1,3)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('BAYRAKTAR TB2','14-2019',2,'Bayraktar TB2',2,'ANKARA EMN�YET GENEL M�D�RL���','2016-04-21',222,4500,22000,0.01,27,3,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('BAYRAKTAR TB2','14-2017',2,'Bayraktar TB2',2,'M�T','2014-10-08',222,4500,22000,0.01,27,3,3,5)
INSERT INTO HavaAraclari (arac_adi,kyrkNum,aracTuru,model,ureticiFirma,birlikAdi,envGiris,MaxHiz,Menzil,MaxIrtifaFeet,RCS,MaxUcusSuresi,gorevModu,gorevTuru,iff_kodu)
VALUES ('BAYRAKTAR TB2','14-2018',2,'Bayraktar TB2',2,'M�T','2015-03-16',222,4500,22000,0.01,27,3,2,5)


SELECT * FROM HavaAraclari ORDER BY arac_id
