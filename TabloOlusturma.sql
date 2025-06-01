CREATE TABLE UreticiFirma (
	firma_id INT PRIMARY KEY IDENTITY(1,1),
	firmaAdi VARCHAR(30) UNIQUE,
	kurulusYili DATE,
	firmaCIO_ad VARCHAR(40),
	firmaCIO_soyad VARCHAR(20)
);
CREATE TABLE GorevModu(
	mod_id INT PRIMARY KEY IDENTITY(1,1),
	mod_adi VARCHAR(50) UNIQUE
);
CREATE TABLE GorevTuru(
	tur_id INT PRIMARY KEY IDENTITY(1,1),
	tur_adi VARCHAR(60) UNIQUE
);
CREATE TABLE AracTuru(
	tur_id INT PRIMARY KEY IDENTITY(1,1),
	tur_adi VARCHAR(30) UNIQUE
);
CREATE TABLE AksiyonTuru(
	tur_id INT PRIMARY KEY IDENTITY(1,1),
	tur_adi VARCHAR(50) UNIQUE
);
CREATE TABLE RadarTipleri(
	tip_id INT PRIMARY KEY IDENTITY(1,1),
	tip_adi VARCHAR(30) UNIQUE
);
CREATE TABLE RadarTurleri(
	tur_id INT PRIMARY KEY IDENTITY(1,1),
	tur_adi VARCHAR(50) UNIQUE
);
CREATE TABLE FrekansBandlari (
	bant_id INT PRIMARY KEY IDENTITY(1,1),
	bant_adi VARCHAR (7) UNIQUE
);
CREATE TABLE SinyalTurleri(
	sinyal_id INT PRIMARY KEY IDENTITY(1,1),
	sinyal_adi VARCHAR(15)
);

CREATE TABLE IFFkodlari(
	iff_id INT PRIMARY KEY IDENTITY(1,1),
	iffModu VARCHAR(10) NOT NULL,
	Baslangic DATETIME,
	Son DATETIME 
	CHECK(DATEPART(YEAR, Baslangic) <=DATEPART(YEAR, Son))
);

CREATE TABLE HavaAraclari(
	arac_id INT PRIMARY KEY IDENTITY(1,1),
	arac_adi VARCHAR(50) NOT NULL,
	kyrkNum VARCHAR(10) UNIQUE,
	aracTuru INT FOREIGN KEY REFERENCES AracTuru NOT NULL,
	model VARCHAR(50),
	ureticiFirma INT FOREIGN KEY REFERENCES UreticiFirma NOT NULL,
	birlikAdi VARCHAR(50),
	envGiris Date,
	MaxHiz SMALLINT, --km/s
	Menzil SMALLINT, --km cinsinden olmalý
	MaxIrtifaFeet INT, --feet cinsinden olmalý
	RCS FLOAT, --metrekare cinsinden olmalý
	MaxUcusSuresi TINYINT, --saat cinsinden
	gorevModu INT FOREIGN KEY REFERENCES GorevModu NOT NULL,
	gorevTuru INT FOREIGN KEY REFERENCES GorevTuru NOT NULL, 
	iff_kodu INT FOREIGN KEY REFERENCES IFFkodlari NOT NULL,
	CHECK (LEN(kyrkNum)>=5)
);

ALTER TABLE IFFkodlari
ADD CONSTRAINT iff_uniq UNIQUE (iffModu);

CREATE TABLE Radarlar(
	radar_id INT PRIMARY KEY IDENTITY(1,1),
	radarAdi VARCHAR(30) UNIQUE,
	ureticiFirma INT FOREIGN KEY REFERENCES UreticiFirma NOT NULL,
	uretimTarihi DATE,
	serinum BIGINT UNIQUE,
	birlikAdi VARCHAR(50),
	envGiris DATE,
	Enlem FLOAT NOT NULL,
	Boylam FLOAT NOT NULL,
	Irtifa FLOAT NOT NULL, 
	Maxmenzil SMALLINT,
	Kapasite SMALLINT,
	AzimutAcisi FLOAT,
	ElevasyonAcisi FLOAT,
	tip_id INT FOREIGN KEY REFERENCES RadarTipleri,
	tur_id INT FOREIGN KEY REFERENCES RadarTurleri,
	frekans_id INT FOREIGN KEY REFERENCES FrekansBandlari,
	sinyal_id INT FOREIGN KEY REFERENCES SinyalTurleri,
	CalismaDurumu BIT NOT NULL,
	CHECK (DATEPART (YEAR, uretimTarihi) <= DATEPART(YEAR, envGiris))
);

CREATE TABLE TespitEdilenler (
	tespit_id INT PRIMARY KEY IDENTITY(1,1),
	radar_id INT FOREIGN KEY REFERENCES Radarlar,
	konum_enlem DECIMAL (9,6) NOT NULL,
	konum_boylam DECIMAL (9,6) NOT NULL,
	irtifa DECIMAL (7,2) NOT NULL, --feet
	hareketli_mi BIT NOT NULL,
	ilkTespitZamani DATETIME NOT NULL,
	HavaDurumu TEXT
);

CREATE TABLE TakipEdilenler(
	takip_id INT PRIMARY KEY IDENTITY(1,1),
	tspnesne_id INT FOREIGN KEY REFERENCES TespitEdilenler,
	ZamanBilgisi DATETIME NOT NULL,
	konum_enlem DECIMAL (9,6),
	konum_boylam DECIMAL (9,6),
	irtifa DECIMAL(7,2),
	AzimutAcisi FLOAT,
	ElevasyonAcisi FLOAT,
	Tahmini_Varis_Noktasi TEXT,
	RCS FLOAT,
	Dopplerkaymasi DECIMAL(9, 4),
	Hiz FLOAT,
	izSuresi TINYINT,
	AlarmSeviyesi INT
);

CREATE TABLE HedefTanima(
	hedef_id INT PRIMARY KEY IDENTITY(1,1),
	takip_id INT FOREIGN KEY REFERENCES TakipEdilenler,
	hedefTuru INT FOREIGN KEY REFERENCES AracTuru,
	IFFdurumu BIT NOT NULL,
	iff_id INT FOREIGN KEY REFERENCES IFFkodlari,
	tehditSeviyesi SMALLINT,
	bilinenArac_mi BIT NOT NULL,
	arac_id INT FOREIGN KEY REFERENCES HavaAraclari,
	CHECK (tehditSeviyesi>=0 OR tehditSeviyesi<=5),
	CONSTRAINT chk_iff_kontrol CHECK (
        (IFFdurumu = 1 AND iff_id IS NOT NULL) OR (IFFdurumu = 0)
    )
);

CREATE TABLE MudahaleEdilenler(
	id INT PRIMARY KEY IDENTITY(1,1),
	nesne_id INT FOREIGN KEY REFERENCES HedefTanima,
	mdhlZamani DATETIME NOT NULL,
	Aksiyon_id INT FOREIGN KEY REFERENCES AksiyonTuru,
	Aks_enlem DECIMAL (9,6),
	Aks_boylam DECIMAL (9,6),
	Aks_irtifa DECIMAL (7,2),
	Aciklama TEXT
);

