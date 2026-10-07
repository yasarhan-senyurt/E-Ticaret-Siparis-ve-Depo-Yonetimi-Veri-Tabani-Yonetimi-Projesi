E-Ticaret Sipariş ve Depo Yönetimi

Proje Hakkında;

Bu proje, bir e-ticaret sisteminde kullanıcıların ürünleri inceleyebilmesi, ürünleri sepetlerine ekleyebilmesi ve sipariş oluşturabilmesi amacıyla geliştirilecek bir E-Ticaret Sipariş ve Depo Yönetimi uygulamasıdır. Proje kapsamında veritabanı işlemleri ile kullanıcı arayüzü birbirinden ayrılmış bir yapı içerisinde geliştirilecektir. Uygulama tarafında Laravel, veritabanı tarafında ise MySQL kullanılacaktır. Projenin geliştirme ve çalışma ortamlarının daha düzenli, taşınabilir ve birbirinden izole şekilde yönetilebilmesi amacıyla Docker kullanılacaktır. Uygulama, iki ayrı container üzerinden çalışacak şekilde planlanmıştır.
Kullanılan Teknolojiler;

Laravel: Uygulama ve kullanıcı arayüzünün geliştirilmesi

PHP: Laravel uygulamasının programlama dili

MySQL: İlişkisel veritabanı yönetim sistemi

Docker: Uygulama ve veritabanı çalışma ortamlarının oluşturulması

Git / GitHub: Projenin sürüm kontrolü ve paylaşılması

Projenin İşleyiş Hikâyesi;

Sistemin işleyişi bir kullanıcının e-ticaret platformuna giriş yapmasıyla başlamaktadır.

Kullanıcı sisteme giriş yaptıktan sonra ürünleri ve ürünlerin ait olduğu kategorileri görüntüleyebilir. Her ürünün adı, açıklaması, fiyatı ve mevcut stok miktarı sistemde tutulmaktadır.

Kullanıcı satın almak istediği bir ürünü sepetine eklediğinde, sistem kullanıcının sepetini ve sepette bulunan ürünün miktarını kayıt altına alır. Kullanıcı isterse sepetindeki ürünlerin adetlerini değiştirebilir veya ürünleri sepetinden çıkarabilir.

Kullanıcı alışverişini tamamlamak istediğinde sipariş oluşturma aşamasına geçer. Bu aşamada kullanıcının kayıtlı teslimat adreslerinden biri seçilir ve sepette bulunan ürünler siparişe dönüştürülür.

Sipariş oluşturulduğunda, siparişin hangi kullanıcıya ait olduğu, hangi adrese gönderileceği, sipariş tarihi, sipariş durumu ve toplam tutarı kayıt altına alınır.

Sipariş içerisindeki her ürün için ayrıca ürünün sipariş verildiği andaki miktarı ve birim fiyatı tutulur. Böylece ilerleyen zamanda ürünün güncel fiyatı değişse bile geçmiş siparişin hangi fiyat üzerinden oluşturulduğu korunmuş olur.

Sipariş oluşturulmasının ardından ürünün stok miktarı güncellenerek mevcut stok takip edilir. Siparişin durumu sistem üzerinden takip edilebilir ve sipariş süreci farklı durumlara göre yönetilebilir.

Bu şekilde sistem; ürünün sisteme eklenmesinden, kullanıcının ürünü sepete eklemesine, sipariş oluşturmasına ve stok miktarının güncellenmesine kadar olan temel e-ticaret sürecini veritabanı üzerinden yönetmeyi amaçlamaktadır.

Veritabanı Yapısı;

Projede toplam 8 adet ilişkisel SQL tablosu kullanılacaktır.

1. Kullanicilar

Sistemde kayıtlı kullanıcıların temel bilgilerini ve kullanıcı rollerini tutar.

Örneğin kullanıcı adı, soyadı, e-posta adresi, şifre ve rol bilgileri bu tabloda tutulacaktır.

2. Kategoriler

Ürünlerin belirli kategoriler altında sınıflandırılmasını sağlar.

Örneğin elektronik, giyim veya kitap gibi ürün kategorileri bu tabloda tutulabilir.

3. Urunler

Sistemde satışa sunulan ürünlerin bilgilerini tutar.

Ürün adı, açıklaması, fiyatı ve stok miktarı gibi bilgiler bu tabloda bulunacaktır. Her ürün aynı zamanda bir kategoriyle ilişkilendirilecektir.

4. Sepetler

Kullanıcıların alışveriş sırasında kullandıkları sepet bilgilerini tutar.

Sepetin hangi kullanıcıya ait olduğu ve oluşturulma tarihi gibi bilgiler burada saklanacaktır.

5. Sepet_Detaylari

Sepette bulunan ürünlerin detaylarını tutar.

Hangi sepette hangi ürünün bulunduğu ve o üründen kaç adet olduğu bu tabloda saklanacaktır.

6. Siparisler

Kullanıcıların oluşturduğu siparişlerin temel bilgilerini tutar.

Siparişin hangi kullanıcıya ait olduğu, hangi adrese gönderileceği, sipariş tarihi, sipariş durumu ve toplam tutar gibi bilgiler burada tutulacaktır.

7. Siparis_Detaylari

Bir siparişin içerisinde bulunan ürünlerin detaylarını tutar.

Siparişte bulunan ürün, ürünün miktarı ve sipariş oluşturulduğu andaki birim fiyatı bu tabloda saklanacaktır.

8. Adresler

Kullanıcıların teslimat adreslerini tutar.

Bir kullanıcı sisteme birden fazla adres ekleyebilir ve sipariş oluştururken kullanacağı teslimat adresini seçebilir.

Docker Yapısı ve Proje Mimarisi;

Proje, uygulama ve veritabanı katmanlarının birbirinden ayrıldığı bir mimari yapıda geliştirilecektir. Çalışma ortamının izole ve taşınabilir olması amacıyla Docker kullanılacaktır.

Proje içerisinde iki container bulunacaktır:

Laravel Container: Uygulamanın ve kullanıcı arayüzünün çalıştığı katmandır.

MySQL Container: Projenin veritabanının ve 8 SQL tablosunun bulunduğu katmandır.

İki container aynı Docker ağı içerisinde çalışacak ve birbirleriyle bu ağ üzerinden iletişim kuracaktır. Laravel container'ı, veritabanı işlemlerini gerçekleştirmek için MySQL container'ına bağlanacaktır.

Genel yapı;

Kullanıcı → Laravel Container ↔ MySQL Container

Container'ların oluşturulması ve birlikte yönetilmesi Docker Compose üzerinden gerçekleştirilecektir.
