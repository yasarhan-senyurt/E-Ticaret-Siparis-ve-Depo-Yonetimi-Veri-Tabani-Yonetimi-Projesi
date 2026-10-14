-- E-Ticaret Siparis ve Depo Yonetimi

CREATE TABLE Kullanicilar (
    kullanici_id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    sifre VARCHAR(255) NOT NULL
);

CREATE TABLE Kategoriler (
    kategori_id INT AUTO_INCREMENT PRIMARY KEY,
    kategori_adi VARCHAR(100) NOT NULL,
    aciklama VARCHAR(255)
);

CREATE TABLE Urunler (
    urun_id INT AUTO_INCREMENT PRIMARY KEY,
    kategori_id INT NOT NULL,
    urun_adi VARCHAR(100) NOT NULL,
    aciklama VARCHAR(255),
    fiyat DECIMAL(10,2) NOT NULL,
    stok_miktari INT NOT NULL,
    FOREIGN KEY (kategori_id) REFERENCES Kategoriler(kategori_id)
);

CREATE TABLE Adresler (
    adres_id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_id INT NOT NULL,
    adres_basligi VARCHAR(50) NOT NULL,
    il VARCHAR(50) NOT NULL,
    ilce VARCHAR(50) NOT NULL,
    acik_adres VARCHAR(255) NOT NULL,
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id)
);

CREATE TABLE Sepetler (
    sepet_id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_id INT NOT NULL,
    olusturma_tarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id)
);

CREATE TABLE Sepet_Detaylari (
    sepet_detay_id INT AUTO_INCREMENT PRIMARY KEY,
    sepet_id INT NOT NULL,
    urun_id INT NOT NULL,
    adet INT NOT NULL,
    FOREIGN KEY (sepet_id) REFERENCES Sepetler(sepet_id),
    FOREIGN KEY (urun_id) REFERENCES Urunler(urun_id)
);

CREATE TABLE Siparisler (
    siparis_id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_id INT NOT NULL,
    adres_id INT NOT NULL,
    siparis_tarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    durum VARCHAR(30) NOT NULL,
    toplam_tutar DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
    FOREIGN KEY (adres_id) REFERENCES Adresler(adres_id)
);

CREATE TABLE Siparis_Detaylari (
    siparis_detay_id INT AUTO_INCREMENT PRIMARY KEY,
    siparis_id INT NOT NULL,
    urun_id INT NOT NULL,
    adet INT NOT NULL,
    birim_fiyat DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (siparis_id) REFERENCES Siparisler(siparis_id),
    FOREIGN KEY (urun_id) REFERENCES Urunler(urun_id)
);
