# Hava Radar Sistemleri Basit Veri Tabanı
TQL kullanarak hava radar sistemlerinin temsili veri tabanı yapılmıştır. 
## SENARYO:
Radarlar etki alanına elektromanyetik sinyaller göndererek nesneleri tanır. Nesnelerden yansıyan radar sinyalleri analiz edilmeden önce bu sinyalleri bozabilecek sabit nesneler ve bulut, kuş gibi nesneler süzülür, sadece hareketli nesneler işleme alınır ayrıca zayıf sinyallerde tespit edilir ve işleme alınmazlar. Bu sinyallerin analizi ile hareketli nesneye ait enlem ve boylam cinsinde konum, irtifa, hız, azimut ve elevasyon açısı, RCS (radar kesit alanı) değeri, menzili, sinyal gücü, Doppler bilgisi elde edilir. 
Radarlar tespit ettiği hareketli nesneyi belirli bir süre takibe alır eğer belirli bir süre (1 dakika) sinyal alınıyorsa takip edilenler listesine alınır. İzleme süresince konum değişikliği takip edilir ve muhtemel rotasını tespit edilir. Eğer muhtemel rotasında askeri üs gibi önemli bölgeler varsa veya belirsizse hava aracına IFF kodu gönderilir ayrıca muhtemel rotasına bakılmaksızın eğer hızı 600 km/s den büyükse veya alçak irtifada yüksek hızda hareket ediyorsa yine IFF kodu gönderilir. Eğer IFF koduna yanıt veriyorsa yanıtı veri tabanı ile karşılaştırılır kod eşleşirse veya eşleşmezse gerekli parametrelere bakılarak alarm seviyesi belirlenir. Eğer IFF konuda yanıt vermezse alarm seviyesi direkt en yüksek değer olacak şekilde olarak belirlenir. 
Eğer takip edilen hava aracı önceden şüpheli olarak sınıflandırıldıysa alarm seviyesi arttırılır. Ve ek doğrulama işlemleri için aracın tipi, hızı, ivmesi (manevra bilgisi), elektronik sinyal yanıtı, silah sistemi olup olmadığı bilgileri elde edilir ve tehdit seviyesine göre sınıflandırılır. Dost uçaklar mavi, bilinmeyenler sarı, potansiyel tehlike oluşturacak olanlar turuncu, düşman uçaklar kırmızı ile gösterilir.
Eğer tespit edilen araç bir tehdit oluşturuyorsa hava aracına acil çağrı frekansı üzerinden uyarı gönderilir. Hala ihlale devam ediyorsa F-16 gibi savaş uçakları havalanarak hedefi görsel olarak teşhis eder. Hedef uçak hala ihlale devam ederse eskort edilerek bölgeden çıkarılır. Tehdit büyükse füze savunma sistemleri devreye girer.
Tüm bu olaylar zinciri süreç boyunca kayıt altına alınır ve veri tabanına kaydedilir.
Veri tabanında bu olayların yanı sıra hedefi tespit eden radarın bilgileri de bulunur. Bu bilgiler şunlardır: askeri radar türü (AESAR, BMDR…), radar sinyal tipi (darbeli, sürekli …), radarın konumu, radarın çalıştığı frekans bandı (L-bandı, C-bandı, S -bandı …), kapsama alanı, darbe sıkılığı, çalışma durumu (aktif, pasif). Bunun yanı sıra radarın hedefi tespit ettiği sıradaki çevresel faktörler de belirtilmelidir (rüzgar yönü, hızı, hava durumu, elektromanyetik parazit seviyesi).
Tüm bu bilgiler tarih ve zaman bilgisi eklenerek raporlanır.

## TABLO OLUŞTURMA
Aşağıdaki tablolar oluşturulmuştur:
•	Hava Araçları 
•	Radarlar
•	Tespit Edilen Nesneler
•	Takip Edilen Nesneler
•	Hedef Tanıma
•	Müdahale Bilgisi
•	Radar Tipleri
•	Radar Türleri
•	Frekans Bantları
•	Sinyal Türleri
•	IFF Kodları
•	Aksiyon Türleri
•	Hava Aracı Türleri
•	Görev Modları
•	Görev Türleri
•	Üretici Firmalar

## Tablolar
### 1.UreticiFirma Tablosu
Radar ve Hava Araçlarının üretici firma bilgilerini tutan tablodur.
Primary Key: firma_id (her firma için benzersiz kimliklendirme)
Unique Index: firmaAdi (her firmanın yalnız bir kere DB ye girilmesi için kullandım)

### 2.GorevModu Tablosu
Her hava aracının görev modu vardır hava aracının nasıl çalıştığını anlatır. Otomatik, manuel gibi.
Primary Key: mod_id (hava araçlarının farklı görevleri için kullanılan benzersiz kimliktir)
Unique Index: mod_adi (girilen görev modlarının farklı olması gerektiğini ayarlar.)

### 3.GorevTuru Tablosu
Hava aracının kullanıldığı görevlerin tür bilgilerini tutar. Keşif görevi, saldırı görevi gibi.
Primary Key: tur_id (hava araçlarının görevlerinin tanımlandığı tablonun kimliklendirmesini yapar.)
Unique Index: tur_adi (Görev türlerinin birbirinden farklı olmasını böylece tekrar etmemesini sağlar.)

### 4.AracTuru Tablosu
Hava araçlarının türünü belirtir. SİHA, İHA, Helikopter gibi.
Primary Key: tur_id (hava araçlarının türlerinin tanımlandığı tablonun kimliklendirmesini yapar.)
Unique Index: tur_adi (Türlerin birbirinden farklı olmasını böylece tekrar etmemesini sağlar.)

### 5.AksiyonTuru Tablosu
Eğer bir nesne tehlikeliyse ve müdahale gerekiyorsa bunun türünü belirtir. Eskort etme, imha etme gibi.
Primary Key: tur_id (Nesnelere müdahale edilmenin türünü belirleyen tabloda indexleme yapar)
Unique Index: tur_adi (Nesnelere müdahale edilmesinin türlerini belirler.)

### 6.RadarTipleri Tablosu
Radarların çalışma tipini belirtir. Darbeli radar, sürekli radar gibi.
Primary Key: tip_id (radarların tiplerinin tanımlandığı tablonun kimliklendirmesini yapar.)
Unique Index: tip_adi (radarların tiplerinin birbirinden farklı olmasını böylece tekrar etmemesini sağlar.)

### 7.RadarTurleri Tablosu
Radarların hangi amaçla kullanıldığını belirtir. Hava trafik kontrol, dost düşman tespiti gibi.
Primary Key: tur_id (Radarların türlerinin tanımlandığı tablonun kimliklendirmesini yapar.)
Unique Index: tur_adi (Radar türlerinin birbirinden farklı olmasını böylece tekrar etmemesini sağlar.)

### 8.FrekansBandlari Tablosu
Radarların çalışma frekanslarını belirtir. A bandı, K bandı gibi.
Primary Key: bant_id (Radarların çalıştığı frekans bantlarını indexler.)
Unique Index: bant_adi (Frekans bant çeşitlerinin tekrarını önler.)

### 9.SinyalTurleri Tablosu
Radarların yaymış olduğu sinyallerin türünü belirtir.
Primary Key: sinyal_id (Radarların çalıştığı sinyal türlerini indexler.)
Unique Index: bant_adi (Sinyal türlerinin tekrarını önler.)

### 10.IFFkodlari Tablosu
Her hava aracına görevine göre iff kodu atanır. Eğer bir araç düşmansa iff kodunu vermeyebilir ancak her hava aracına bu kodlar tanımlıdır. Mod-3, Mod-4 gibi.
Primary Key: iff_id (Hava araçlarının sahip olduğu iff kodlarını indexler.)
UNIQUE INDEX: iffModu (Hava araçlarının sahip olduğu iff kodlarının tekrarını önler.)

### 11.HavaAraclari Tablosu
Envantere girmiş görev yapmaya hazır araçların ve bilgilerinin tutulduğu tablodur.
Primary Key: araç_id (Envantere girmiş olan hava araçlarının tutulduğu tablonun indexlenmesini sağlar.)
Unique Index: kyrkNum (Her hava aracının kendine özgü bir kuyruk numarası vardır.)
Foreign Key: aracTuru (Hava araçlarının türünü AracTuru tablosundan alır.), ureticiFirma (Hava aracının üretildiği firma adını UreticiFirma tablosundan referans alır.), gorevModu (Hava aracının çalıştığı modu GorevModu tablosundan alır), gorevTuru (Hava aracının görev türünü GorevTuru tablosundan referan alır.), iff_kodu (Hava raçlarının görevine göre atanan iff kodu bilgisini IFFkodlari tablosundan alır.)

### 12.Radarlar Tablosu
Envantere girmiş radarların ve bilgilerinin tutulduğu tablodur.
Primary Key: radar_id (Envantere girmiş radarların indexlenmesini sağlar.)
Unıque Index: seriNum (Her bir radarın kendine özgü seri numarasının olduğunu belirtmemize olanak tanır.)
Foreign Key: ureticiFirma (Radarların üretildiği firma adını UreticiFirma tablosundan referans alır.), tip_id (RadarTipleri tablosundan veri çeker), tur_id (Radar türünü RadarTurleri tablosundan alır.), frekans_id (Radarların çalıştığı frekans bantlarını FrekansBandlari tablosundan çeker.), sinyal_id (Radarların çalıştığı sinyal türü bilgisini SinyalTurleri tablosundan alır.)

### 13.TespitEdilenler Tablosu
Radarlar tarafından tespit edilen hareketli hareketsiz nesnelerin tutulduğu tablodur.
Primary Key: tespit_id (Radar tarafından tespit edilen nesnelerin tutulduğu tabloları indexler.)
Foreign Key: radar_id (Nesnelerin tespit edildiği radarı Radarlar tablosundan referans alır.)

### 14.TakipEdilenler Tablosu
Tespit edilen nesne eğer hareketli ise yani belirli bir süre sinyal alınıyorsa o nesne takibe alınır. Bu tablo da takip edilen nesnelerin ve hız, irtifa gibi bilgilerinin tutulduğu tablodur.
Primary Key: takip_id (Takibe alınan nesnelerin indexlenmesini sağlar.)
Foreign Key: tspnesne_id (Eğer tespit edilen nesne hareketli ise takibe alınır ve bu kolon tespit edilen nesnenin indexini referans alır.)

### 15.HedefTanima Tablosu
Eğer takip edilen nesnenin hız değeri, irtifa değeri, RCS yani radar kesit alanı normal değilse IFF kodu gönderilmek üzere tabloya eklenir.
Primary Key: hedef_if (alarm seviyesine göre nesneleri daha iyi tanımaya alınan nesneleri indexler.)
Foreign Key: takip_id (takip edilen hangi nesnenin inceleneceğini belirtir.), hedefTuru (Tabloya eklenen nesnenin hangi türden olduğunu belirtir), iff_id (eğer iff yanıtı varsa iff bilgisini alır), araç_id (eğer araç tanıdık dost ise HavaAraclari tablosundan referans alır.)

### 16.MudahaleEdilenler Tablosu
Araç tanındıktan sonra eğer tehlikeli bulunduysa çeşitli müdahale yöntemleri kullanılarak aksiyon alınır. Bu tabloda da müdahale edilme ile ilgili bilgiler tutar.
Primary Key: id (müdahale edilen nesnelerin indexlenmesini sağlar.)
Unique Index: nesne_id (hangi tanınan nesneye müdahale edildiğini belirtir.), Aksiyon_id (ne tür bir aksiyon alındığını belirtir.)

*Bu projede kullanılan veriler gerçek değildir ve sadece test/geliştirme amaçlıdır.*
