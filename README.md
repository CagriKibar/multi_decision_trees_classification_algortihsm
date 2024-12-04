Kategorik değişkenleri kullanmamızın temel nedeni, analiz etmek istediğimiz verinin 
içeriğinin sadece sayısal (nicel) değil, aynı zamanda kategorik (nitel) bilgiler içermesidir. Bu 
tür bilgiler, krediye uygunluk gibi sınıflandırma problemlerinde önemli bir rol oynar. Şimdi 
detaylıca inceleyelim:
1. Verinin Yapısı:
Veri setinde yer alan bazı sütunlar kategorik nitelikte:
 Örneğin: 
o job (Meslek): Öğretmen, mühendis, işçi gibi farklı meslek grupları.
o marital (Medeni Durum): Evli, bekar, boşanmış gibi durumlar.
o education (Eğitim Durumu): İlkokul, lise, üniversite mezunu gibi kategoriler.
Bu sütunlar, sayısal bir anlam taşımadıkları için kategorik değişken olarak ele alınmalıdır. 
Kategorik değişkenler, verinin ayrık (discrete) ve sınıflandırılabilir olduğu durumlarda 
kullanılır.
2. Kategorik Değişkenler Neden Kullanılır?
Kategorik değişkenler, sınıflandırma problemlerinde kritik öneme sahiptir:
 Krediye Uygunluk Tahmini:
o Örneğin, bir kişinin mesleği, medeni durumu veya eğitim seviyesi krediye 
uygunluk kararında önemli bir faktör olabilir.
 Makine Öğrenmesi Modellerinin Girdisi:
o Modeller, kategorik veriler olmadan sadece sayısal verilere dayanarak yeterli 
bilgiye ulaşamayabilir. Örneğin, "Eğitim Durumu" bir kategorik değişkendir 
ve kredi kararında önemli bir etkisi olabilir.
3. Neden Sayısal Hale Getirilmedi?
Bazı durumlarda kategorik veriler one-hot encoding veya benzeri yöntemlerle sayısal hale 
getirilebilir. Ancak, karar ağaçları gibi algoritmalar (CTree, RPart) kategorik verileri 
doğrudan destekler ve sayısal hale getirilmesine gerek yoktur. Bu, hem verinin doğal yapısını 
korur hem de işlem basitleşir.
4. Kategorik Değişkenlerin Model İçindeki Rolü:
Kategorik değişkenler, verinin ayrıştırılmasında ve sınıflandırılmasında önemli rol oynar:
 Karar Ağacı Modellerinde:
o Örneğin, job değişkeni "öğretmen", "mühendis" gibi meslek gruplarını 
ayırarak kredi uygunluğunu etkileyebilir.
o Model şöyle bir kural oluşturabilir:
"Eğer job = öğretmen ve education = üniversite ise krediye uygun."
 Bu ayrım, modelin daha doğru tahminler yapmasını sağlar.
Sonuç:
Kategorik değişkenler:
1. Verinin anlamını korur.
2. Sınıflandırma problemlerinde kritik bilgiler sağlar.
3. Doğru modelleme için gereklidir, çünkü sadece sayısal verilere dayanmak eksik 
tahminlere yol açabilir.
set.seed() fonksiyonu, R'da rastgele işlemleri kontrol etmek için kullanılır. Bu, aynı kodun 
tekrar çalıştırıldığında aynı rastgele sonuçları üretmesini sağlar. Böylece, tekrar edilebilirlik
(reproducibility) sağlanır.
Peki neden 42 seçtik?
 42 herhangi bir özel matematiksel anlam taşımıyor, ancak programlama dünyasında 
mizahi bir referansa sahiptir. Douglas Adams'ın The Hitchhiker's Guide to the Galaxy
adlı kitabında 42 "hayatın, evrenin ve her şeyin anlamı" olarak tanımlanmıştır. Bu 
nedenle, programcılar arasında popüler bir seçimdir.
 Pratikte, 42 tamamen rastgele bir seçimdir. Herhangi bir başka pozitif tam sayı da aynı 
işlevi görür.
Eğer 50 olsaydı ne olurdu?
Eğer set.seed(42) yerine set.seed(50) kullansaydık, rastgele işlemler sonucu farklı bir 
rastgele dizilim elde ederdik.
 Örneğin: 
o Eğitim ve test veri setine alınan veriler farklı olurdu.
o Modellerin eğitimi ve tahmin sonuçları, kullanılan rastgele veriler farklı 
olduğu için değişirdi.
Ancak, istatistiksel olarak iki farklı seed değeri ile elde edilen sonuçlar genelde benzer 
olmalıdır. Çünkü rastgele seçim işlemi, veri setinin genel yapısını değiştirmez, sadece hangi 
kayıtların eğitim ve test için seçildiğini belirler.
Özetle:
 set.seed değeri, rastgele işlemlerin tekrar edilebilir olmasını sağlar.
 42'nin seçilmesinin sebebi genellikle bir alışkanlık veya programcı mizahıdır.
 50 veya başka bir değer kullanırsanız, aynı kod farklı bir rastgele örnekleme yapar 
ama sonuçların genel eğilimi çok farklı olmaz.
Elbette! Kodun tüm parçalarını adım adım açıklayarak anlatalım:
Kod:
train_indices <- sample(1:nrow(data), size = 0.6 * nrow(data))
1. 1:nrow(data)
 Amacı: Veri setindeki satırların sıra numaralarını oluşturur.
 nrow(data) ne yapar?
o Veri setindeki toplam satır sayısını döndürür.
o Örneğin, veri setinde 1000 satır varsa, nrow(data) değeri 1000 olacaktır.
 1:nrow(data) çıktısı:
o 1, 2, 3, ..., 1000 şeklinde bir sayı dizisi oluşturur. Bu dizi, veri setindeki her bir 
satırın sıra numarasını temsil eder.
2. size = 0.6 * nrow(data)
 Amacı: Rastgele seçilecek eleman sayısını belirtir.
 0.6 * nrow(data) ne yapar?
o Veri setindeki toplam satır sayısının %60'ını alır.
o Örneğin, veri setinde 1000 satır varsa: 0.6×1000=6000.6 \times 1000 = 600 
o Bu, 1000 satırın 600'ünün rastgele seçileceğini ifade eder.
3. sample()
 Amacı: Bir dizi veya kümeden rastgele örnekler seçmek.
 Kullanımı:
 sample(x, size)
o x: Örnek alınacak veri (burada 1:nrow(data) dizisi).
o size: Kaç eleman seçileceğini belirtir (burada 0.6 * nrow(data)).
 Bu kodun yaptığı:
o 1:nrow(data) dizisinden, belirtilen size kadar rastgele eleman seçer.
o Örneğin: Veri seti 1000 satırdan oluşuyorsa, bu kod 1-1000 arasındaki 
sayılardan 600 tanesini rastgele seçer.
4. train_indices <-
 Amacı: Seçilen rastgele sıra numaralarını bir değişkene atamak.
 Sonuç:
o Örneğin, veri setinde 1000 satır varsa, train_indices değişkeni 600 tane 
rastgele sayı içerir: train_indices=[5,20,34,78,...,990]\text{train\_indices} = [5, 
20, 34, 78, ..., 990] 
Kodun Genel İşlevi:
Bu kod, veri setindeki satırlardan %60'ını rastgele seçerek, bu seçimin sıra numaralarını 
train_indices değişkenine atar. Bu sıra numaraları, genellikle eğitim veri setini oluşturmak 
için kullanılır.
Pratik Bir Örnek:
Eğer veri setimiz 10 satırdan oluşuyorsa:
data <- data.frame(x = 1:10)
nrow(data) # Çıktı: 10
set.seed(42)
train_indices <- sample(1:nrow(data), size = 0.6 * nrow(data))
print(train_indices)
Çıktı:
[1] 1 3 5 6 7 9
Bu durumda, veri setindeki 1., 3., 5., 6., 7., ve 9. satırlar eğitim veri seti için seçilmiştir.
Sonuç:
Bu kod, veri setinin rastgele %60'ını seçerek eğitim veri seti oluşturmak için kullanılır. Geriye 
kalan %40'lık kısım ise genelde test veri seti olarak ayrılır.
Bu iki kod satırı, veri setini eğitim (train) ve test veri seti olarak bölmek için kullanılır. 
Aşağıda bu kodların işlevlerini detaylı bir şekilde açıklayacağım:
Kod 1: train_data <- data[train_indices, ]
 Amaç:
Rastgele seçilen satırları kullanarak eğitim veri setini oluşturmak.
Eğitim veri seti, makine öğrenmesi modelini eğitmek için kullanılır.
 data[train_indices, ] ne yapar?
o data: Orijinal veri seti.
o train_indices: Daha önce oluşturduğumuz, rastgele seçilen satırların indekslerini 
içeren liste.
o data[train_indices, ]: 
 Veri setindeki sadece train_indices içinde belirtilen satırları seçer.
 ,: Sütun boyutunda bir şey seçilmediği için tüm sütunları dahil eder.
 Sonuç:
train_data, orijinal veri setindeki train_indices'de belirtilen satırlardan oluşan bir 
alt küme olur.
Kod 2: test_data <- data[-train_indices, ]
 Amaç:
Eğitim veri seti için kullanılmayan satırları test veri seti olarak ayırmak.
Test veri seti, modeli test etmek ve performansını değerlendirmek için kullanılır.
 data[-train_indices, ] ne yapar?
o -train_indices: Eğitim veri setinde kullanılan satırların indekslerini çıkartır. 
 Örneğin, train_indices = c(1, 3, 5) ise -train_indices şu 
anlama gelir:
Tüm satırlar 1, 3, 5 hariç seçilir.
o data[-train_indices, ]: 
 Orijinal veri setindeki train_indices'de olmayan satırları seçer.
 Tüm sütunlar dahildir.
 Sonuç:
test_data, orijinal veri setindeki train_indices dışındaki satırlardan oluşan bir alt 
küme olur.
Örnekle Açıklama
Veri Seti:
data <- data.frame(
 ID = 1:10,
 Value = c(100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
)
set.seed(42)
train_indices <- sample(1:nrow(data), size = 0.6 * nrow(data))
print(train_indices)
Çıktı (Rastgele Seçim):
[1] 1 3 5 6 7 9
Eğitim ve Test Veri Setlerini Oluşturma:
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]
print(train_data)
print(test_data)
Çıktı:
# Eğitim Veri Seti
 ID Value
1 1 100
3 3 300
5 5 500
6 6 600
7 7 700
9 9 900
# Test Veri Seti
 ID Value
2 2 200
4 4 400
8 8 800
10 10 1000
Neden Bu İşlem Yapılıyor?
1. Eğitim Veri Seti (train_data):
o Modelin öğrenmesi için kullanılır.
o Burada model, bağımsız değişkenler (özellikler) ile hedef değişken arasındaki ilişkileri 
öğrenir.
2. Test Veri Seti (test_data):
o Modelin, daha önce görmediği veriler üzerindeki genelleme yeteneğini
değerlendirmek için kullanılır.
o Model performansı burada ölçülür.
Sonuç:
Bu iki satır:
 Veri setini rastgele eğitim ve test olarak ikiye böler.
 Eğitim verileri modeli eğitmek için, test verileri ise modeli değerlendirmek için kullanılır.
Bu kodlar, veri setinde belirli özelliklere dayanarak bir hedef değişkeni tahmin etmek için iki 
farklı karar ağacı modelini oluşturur. Şimdi her bir kodu detaylı bir şekilde inceleyelim:
Kod 1: ctree_model <- ctree(y ~ ., data = train_data)
Amaç:
ctree fonksiyonu, İstatistiksel Testli Karar Ağacı (Conditional Inference Tree) oluşturur. 
Bu model, hedef değişken (y) ile diğer bağımsız değişkenler arasındaki ilişkileri istatistiksel 
testlere dayalı olarak öğrenir.
Kod Açıklaması:
 ctree(y ~ ., data = train_data)
o y ~ .: 
 Hedef değişken: y
 Bağımsız değişkenler: . (Bu ifade, tüm diğer sütunların y hedef değişkenini 
tahmin etmek için kullanılacağını belirtir.)
o data = train_data: Modelin eğitilmesi için kullanılacak veri seti olarak 
train_data seçilmiştir.
 Nasıl Çalışır?
o ctree, hedef değişken ve bağımsız değişkenler arasındaki ilişkileri anlamak için 
hipotez testleri (ör. ki-kare testi) uygular.
o Önemli değişkenleri seçerek dallar oluşturur.
o Bölünmeleri yaparken, değişkenler arasında önem farkını göz önünde bulundurur.
 Avantajları:
o Aşırı uyum (overfitting) sorununa karşı daha dayanıklıdır.
o Hangi değişkenlerin istatistiksel olarak anlamlı olduğunu değerlendirir.
Sonuç:
ctree_model değişkeni, ctree fonksiyonu kullanılarak oluşturulan İstatistiksel Testli 
Karar Ağacı Modelini içerir.
Kod 2: rpart_model <- rpart(y ~ ., data = train_data)
Amaç:
rpart fonksiyonu, Klasik Karar Ağacı algoritması kullanarak bir model oluşturur. Bu 
yöntem, veri setini dallara ayırarak hedef değişkeni tahmin etmeye çalışır.
Kod Açıklaması:
 rpart(y ~ ., data = train_data)
o y ~ .: 
 Hedef değişken: y
 Bağımsız değişkenler: . (Tüm sütunlar kullanılır.)
o data = train_data: Eğitim için kullanılan veri seti train_datadır.
 Nasıl Çalışır?
o rpart, veri setindeki bağımsız değişkenleri sırayla analiz eder.
o Gini indiski veya entropi gibi bölme kriterlerine göre dallar oluşturur.
o Ağacı büyütür ve daha sonra aşırı uyumu önlemek için gerekirse budama işlemi 
uygular.
 Avantajları:
o Hızlı ve hesaplaması kolaydır.
o Basit ve sezgisel modeller oluşturur.
o Önemli değişkenleri sıralayarak değişken önemini (variable importance) çıkarabilir.
Sonuç:
rpart_model değişkeni, rpart fonksiyonu kullanılarak oluşturulan Klasik Karar Ağacı 
Modelini içerir.
Farklılıklar:
Özellik ctree rpart
Yaklaşım İstatistiksel testlere dayanır. Bölme kriterleri (Gini, Entropi).
Aşırı Uyum (Overfitting) Daha dayanıklıdır. Daha hassastır.
Performans Küçük veri setlerinde daha iyidir. Büyük veri setlerinde hızlıdır.
Değişken Seçimi Sadece anlamlı değişkenleri seçer. Tüm değişkenleri dikkate alır.
Sonuç:
 ctree_model, daha istatistiksel temelli ve düzenli bir model oluştururken,
 rpart_model, daha hesaplama odaklı ve sezgisel bir model oluşturur.
Her iki modelin çıktıları daha sonra tahmin performansı açısından karşılaştırılır.
Bu iki satırda, daha önce eğitilmiş olan ctree_model ve rpart_model ile test veri seti 
(test_data) kullanılarak tahminler yapılır. Şimdi bu kodları kelime kelime açıklayalım:
Kod 1: ctree_pred <- predict(ctree_model, newdata = test_data)
1. predict Fonksiyonu:
 Predict, bir model kullanılarak yeni veri üzerinde tahmin yapmak için kullanılır.
 Eğitilmiş bir modelin (örneğin, ctree_model veya rpart_model) test veri seti üzerindeki 
tahminlerini üretir.
2. ctree_model:
 Daha önce oluşturduğumuz İstatistiksel Testli Karar Ağacı Modeli.
 Bu model, train_data ile eğitilmiş ve hedef değişkeni (y) tahmin etmeye hazırdır.
3. newdata = test_data:
 predict fonksiyonuna modelin tahmin yapmasını istediğimiz yeni veri setini belirtir.
 Burada test_data, test için ayrılmış olan veri setidir.
4. ctree_pred <-:
 Tahmin sonuçları, ctree_pred adlı bir değişkende saklanır.
 Bu değişken, ctree_model kullanılarak yapılan tahminleri içerir.
Sonuç:
ctree_pred değişkeni, test_data kullanılarak ctree_model tarafından tahmin edilen hedef 
değişkenin (y) değerlerini içerir.
Kod 2: rpart_pred <- predict(rpart_model, newdata = test_data, type = 
"class")
1. predict:
 Tahmin yapmak için kullanılır. Aynı ctree_model için olduğu gibi rpart_model için de 
tahmin yapar.
2. rpart_model:
 Daha önce oluşturduğumuz Klasik Karar Ağacı Modeli.
 Bu model, train_data ile eğitilmiş ve hedef değişkeni (y) tahmin etmeye hazırdır.
3. newdata = test_data:
 Tahmin yapmak için kullanılacak veri seti, test_datadır.
4. type = "class":
 Tahminin türünü belirtir.
 "class": 
o Modelin hedef değişken için sınıf etiketlerini tahmin etmesini sağlar.
o Örneğin: Hedef değişken y iki sınıfa sahip olabilir: yes ve no. Bu durumda, predict
her bir test örneği için yes veya no olarak tahminde bulunur.
5. rpart_pred <-:
 rpart_model kullanılarak yapılan tahminler, rpart_pred değişkeninde saklanır.
Sonuç:
rpart_pred değişkeni, rpart_model kullanılarak test_data üzerindeki hedef değişken (y) 
için sınıf tahminlerini içerir.
Kodlar Arasındaki Farklar:
Kod Açıklama
ctree_pred <- İstatistiksel testlere dayalı model (ctree) tahmin sonuçlarını saklar.
rpart_pred <- Klasik karar ağacı (rpart) modelinin sınıf tahminlerini saklar.
type = "class"
(rpart)
rpart tahminlerinin sınıf etiketleri olarak döndürülmesini sağlar.
newdata = test_data Her iki model için de tahminlerin test_data üzerinde yapılmasını 
belirtir.
Özet:
Bu iki kod, test veri seti kullanılarak her iki modelin tahminlerini ayrı ayrı hesaplar ve 
sonuçları sırasıyla ctree_pred ve rpart_pred değişkenlerinde saklar. Bu tahminler daha 
sonra modellerin performanslarını karşılaştırmak için kullanılır.
Bu kod parçaları, karışıklık matrislerini oluşturarak her iki modelin (ctree ve rpart) 
performansını değerlendirir. Aşağıda her bir kısmı detaylıca açıklayalım:
Kod 1: ctree_conf <- table(Actual = test_data$y, Predicted = ctree_pred)
1. table:
 Bir çapraz tablo oluşturur.
 İki kategorik değişkenin (gerçek ve tahmin edilen değerler) frekanslarını hesaplar.
2. Actual = test_data$y:
 Gerçek değerlerdir.
 test_data$y, test veri setindeki hedef değişkenin gerçek sınıf etiketlerini içerir.
 Bu, modelin neyi tahmin etmeye çalıştığını gösterir.
3. Predicted = ctree_pred:
 Tahmin edilen değerlerdir.
 ctree_pred, ctree_model tarafından test veri seti (test_data) kullanılarak yapılan 
tahminleri içerir.
4. ctree_conf <-:
 Oluşturulan karışıklık matrisi, ctree_conf adlı değişkende saklanır.
Sonuç:
ctree_conf, ctree_model tarafından yapılan tahminler ile gerçek değerlerin 
karşılaştırmasını gösteren bir karışıklık matrisidir.
Kod 2: rpart_conf <- table(Actual = test_data$y, Predicted = rpart_pred)
1. table:
 Aynı şekilde bir çapraz tablo oluşturur.
 Gerçek ve tahmin edilen değerlerin frekanslarını hesaplar.
2. Actual = test_data$y:
 Test veri setindeki gerçek sınıf etiketlerini içerir.
3. Predicted = rpart_pred:
 rpart_pred, rpart_model tarafından yapılan tahminleri içerir.
 Bu, rpart_modelin test_data üzerindeki tahminleridir.
4. rpart_conf <-:
 Bu karışıklık matrisi, rpart_conf adlı değişkende saklanır.
Sonuç:
rpart_conf, rpart_modelin tahminlerinin gerçek değerlerle karşılaştırmasını gösterir.
Karışıklık Matrisi Nedir?
 Karışıklık matrisi, sınıflandırma modellerinin performansını değerlendirmek için kullanılır.
 Tablo şu şekilde düzenlenir: 
o Satırlar: Gerçek değerleri gösterir (Actual).
o Sütunlar: Tahmin edilen değerleri gösterir (Predicted).
o Hücreler: Gerçek ve tahmin edilen sınıfların kesişiminde kaç örnek bulunduğunu 
belirtir.
Predicted Yes No
Actual Yes TP FN
Actual No FP TN
Terimler:
1. TP (True Positive): Doğru pozitifler (Gerçek sınıf Yes ve tahmin de Yes).
2. FN (False Negative): Yanlış negatifler (Gerçek sınıf Yes, tahmin No).
3. FP (False Positive): Yanlış pozitifler (Gerçek sınıf No, tahmin Yes).
4. TN (True Negative): Doğru negatifler (Gerçek sınıf No ve tahmin de No).
Her Kodun Çıktısı:
1. ctree_conf: ctree_modelin performansını gösteren karışıklık matrisi.
2. rpart_conf: rpart_modelin performansını gösteren karışıklık matrisi.
Bu matrisler, her bir modelin tahminlerinin ne kadar doğru olduğunu analiz etmek ve 
karşılaştırmak için kullanılır. Örneğin:
 Doğruluk oranı (Accuracy)
 Hata oranı (Error Rate)
 Hassasiyet (Precision)
 Duyarlılık (Recall)
Bu değerlendirmeler sonucunda hangi modelin daha iyi performans gösterdiği anlaşılabilir.
Bu kod parçaları, oluşturduğumuz karışıklık matrislerini terminale (veya çıktı ekranına) 
yazdırır. Kodun her bir kısmını detaylıca açıklayalım:
Kod 1: print("CTree Karışıklık Matrisi:")
 Amaç:
o Çıktıya bir başlık eklemek için kullanılır.
o "CTree Karışıklık Matrisi:" ifadesini ekrana yazdırır.
o Bu ifade, aşağıdaki matrisin hangi modele ait olduğunu belirtir.
Kod 2: print(ctree_conf)
 Amaç:
o Daha önce oluşturduğumuz ctree_conf karışıklık matrisini ekrana yazdırır.
o Bu matris, ctree_model tarafından yapılan tahminler ile gerçek değerlerin 
karşılaştırmasını gösterir.
o Örnek Çıktı:
o Predicted
o Actual yes no
o yes 45 5
o no 10 40
 Burada, satırlar gerçek sınıf değerlerini, sütunlar ise tahmin edilen 
sınıf değerlerini temsil eder.
 Örneğin: 
 45: Model, doğru bir şekilde pozitif sınıfı tahmin etmiş (True 
Positive, TP).
 5: Model, pozitif olan bir sınıfı yanlışlıkla negatif olarak tahmin 
etmiş (False Negative, FN).
Kod 3: print("\nRPart Karışıklık Matrisi:")
 Amaç:
o Çıktıya bir boş satır ekler ve ardından "RPart Karışıklık Matrisi:"
ifadesini yazdırır.
o Bu, hangi matrisin rpart_modele ait olduğunu belirtir.
Kod 4: print(rpart_conf)
 Amaç:
o rpart_conf karışıklık matrisini ekrana yazdırır.
o Bu matris, rpart_model tarafından yapılan tahminler ile gerçek değerlerin 
karşılaştırmasını içerir.
o Örnek Çıktı:
o Predicted
o Actual yes no
o yes 48 2
o no 12 38
 Bu matris de benzer şekilde değerlendirilir: 
 48: Doğru bir şekilde pozitif sınıfı tahmin etmiş (True Positive, 
TP).
 2: Pozitif sınıfı yanlışlıkla negatif olarak tahmin etmiş (False 
Negative, FN).
Kodların Çalışma Akışı:
1. print("CTree Karışıklık Matrisi:") -> ctree_conf matrisi başlığı ekrana 
yazdırılır.
2. print(ctree_conf) -> ctree_modelin tahminlerinin performansını gösteren matris 
ekrana yazdırılır.
3. print("\nRPart Karışıklık Matrisi:") -> rpart_conf için bir başlık ekrana 
yazdırılır.
4. print(rpart_conf) -> rpart_modelin tahminlerinin performansını gösteren matris 
ekrana yazdırılır.
Özet:
Bu kod, her iki modelin tahmin sonuçlarını açık bir şekilde karşılaştırmayı mümkün kılar. 
Matrislerdeki TP, FN, FP, TN değerlerini analiz ederek modellerin doğruluk, hassasiyet, ve 
duyarlılık gibi performans ölçütleri hesaplanabilir. Bu ölçütlere göre modellerin güçlü ve 
zayıf yönleri belirlenebilir.
Bu kod parçacığı, rpart modelinin özelliklerin önem derecelerini ekrana yazdırır. Şimdi her 
bir bölümün anlamını detaylıca açıklayalım:
Kod 1: print("\nÖzellik Önemi (RPart):")
 Amaç:
o Bu komut, bir başlık ekler. Ekranda şu metni görüntüler: "Özellik Önemi 
(RPart):".
o Bu başlık, aşağıdaki çıktının rpart modeline ait olduğunu belirtir.
Kod 2: print(rpart_model$variable.importance)
 Amaç:
o rpart_model bir karar ağacı modelidir ve bu modelin eğitilmiş olduğu 
verideki özelliklerin önem derecelerini elde etmek için 
variable.importance özelliği kullanılır.
o rpart_model$variable.importance ifadesi, her bir özelliğin modeldeki 
tahmin gücüne olan katkısını (önemini) listeler.
o Bu değerler, modelin her bir değişkeni nasıl ve ne kadar kullandığını gösterir.
Özelliklerin Önemi Nedir?
Bir karar ağacı modelinde, bazı özellikler diğerlerine kıyasla daha fazla bilgi taşır ve tahmin 
yapılırken daha belirleyicidir. rpart modeli, hangi özelliklerin (değişkenlerin) tahminler 
üzerinde daha etkili olduğunu belirler ve bunları sıralar.
Örnek Çıktı:
Özellik Önemi (RPart):
 age 15.6
 job 9.2
 marital 7.3
 education 5.6
 balance 12.5
 housing 10.1
 loan 8.9
Bu örnekte, her bir özelliğin variable.importance değeri verilmiştir. Değerler daha yüksek 
olan özellikler, modelin tahmin gücünde daha büyük bir rol oynamaktadır. Örneğin:
 age (yaş) değişkeni, modelin tahmin yaparken en önemli özelliktir.
 balance (bakiye), ikinci sırada yer alır ve tahminlerde önemli bir etkiye sahiptir.
 Diğer özellikler, modelin performansında daha az etkili olabilir.
Sonuç:
Bu yöntemle, hangi özelliklerin modelin doğru tahminler yapması için daha kritik olduğunu 
anlayabiliriz. Bu bilgi, özellikle özellik mühendisliği (feature engineering) veya model 
geliştirme aşamalarında önemli olabilir. Gereksiz veya az önemli özellikleri modelden 
çıkararak daha verimli ve hızlı bir model elde edilebilir.
