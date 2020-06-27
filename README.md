# pipingSystem

Endüstriyel bir tesisin bulunduğu büyük bir arazide su talep edilen yerler ve talep miktarları şekilde ve ekteki tabloda gösterilmiştir. Bir baraj gölü kenarına kurulacak bir pompa ile bu taleplere uygun su şebekesini verilen tasarım kriterlerine göre belirleyiniz ve toplam talebi karşılayacak bir santrifüj pompa seçiniz. Uzunlukları verilen boruların çaplarını belirleyiniz. Pompanın manometrik basma yüksekliği, debisi ve gücünü belirleyerek pompa kataloglarından uygun bir seçim yapınız. Pompanın kavitasyona yol açmadan çalışması için gerekli olan maksimum emme yüksekliğini belirleyiniz. 
TASARIM KRİTERLERİ :  
	Alt taraftaki baraj gölü su kaynağı olarak kullanılmaktadır. 
	2- Her bir boru parçasının başlangıç ve bitiş kesitine birer vana yerleştirilecektir. (Bakım veya borudan su kaçağı olması durumlarında bu boruyu sistemden izole etmek amacıyla).  
	3- Boru malzemesi dökme demir olacak ve çap aşağıdaki standart çaplar arasından seçilecektir.  5, 6, 8, 10, 15, 20, 30, 40, 50, 60, 75, 90, 105 ve 120 cm 

Verilenler:  
 L1=145m   L2=175m   L3=115m   L4=120m   L5=135m   L6=115m   L7=60m   L8=115m   (boru uzunlukları) 
 H =830m  bu durumda A ve C noktası 850m, B ve D noktası 870m yüksekliktedir. 
Q_A=4  litre⁄s  Q_B=8  litre⁄s  〖  Q〗_C=8  litre⁄s       Q_D=8  litre⁄s     (debiler)
Çözüm yöntemi:
Belirli yüksekliklerdeki noktalara istenen debileri sağlayabilmek için gereken hesapları Hardy-Cross yöntemi ile bilgisayar ortamında hesapladım. Hesapları her bir boru çapı için tekrarlayarak, boruların çapına göre işletme için gerekli pompa gücünün değişimini inceledim ve en uygun boru çapını 15 cm olarak belirledim. 
Daha sonra boru çapına uygun, sistemde kullanılabilecek vana araştırması yaptım ve kayıplarının diğerlerine göre daha az olması sebebiyle sürgülü vana seçiminin makul olduğunu düşündüm. Sistemdeki akışın darbesiz ve sıkıştıralamaz olması sebebiyle vana kayıp katsayılarının eşdeğer boru uzunluğu olarak yazılabileceğini düşündüm ve tablodan vananın eşdeğer boru uzunluğunu buldum. Vananın eşdeğer boru uzunluğu = 3,5 ft = 1,068m
Borular, vanalar, debiler ve enerji kayıpları hesaplandıktan sonra enerji denklemi ile pompanın uygulaması gereken manometrik basma yüksekliği ve gerekli güç belirlenir.
Gerekli olan    H_pompa=32,18  , gerekli olan    Pompa gucu=8523 watt 
Santrifüj pompa araştırması sonucu en uygun pompa belirlenmiştir:
Pedrello firmasnın FG2-160B model pompa seçimi yapılmıştır. 








Pompa kataloğundan elde edilen NPSH değeri ve tesisin kurulduğu yerin rakımı (H) kullanılarak, pompanın kavitasyona yol açmadan çalışması için gerekli olan maksimum emme yüksekliğini belirlenir.

P_(atm@830m)=0,91744 bar


MEY=3,729m

Formulü ile 0,9 güvenlik faktörü (SF) eklenerek maksimum emme yüksekliği  3,729m olarak hesaplanmıştır. 
