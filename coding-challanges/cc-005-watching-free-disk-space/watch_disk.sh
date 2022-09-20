#!/bin/bash
ADMIN="seryum26@gmail.com"
DATE=$(date +'%A %b %Y, time = %k:%M:%S')
partition=$(df / | grep / | awk '{print $1}')
CURRENT=$(df / | grep / | awk '{print $5}' | sed 's/%//g' )
echo "Enter default value for threshold: " 
read THRESHOLD

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then

echo "WARNING: The partition $partition has used $CURRENT% of total available space - Date: $DATE"
mutt -s "Alert: Almost out of disk space $CURRENT%" "$ADMIN"

else [ "$CURRENT" -le "$THRESHOLD" ]

echo "Good News:) The partition $partition has used $CURRENT% of total available space - Date: $DATE"

fi


<< 'MULTILINE-COMMENT'

Linux AWK
Linux tabanli işletim sistemlerinde dosya içinde arama yapmak, listelemek ve içeriği uygun biçimde yazdirmak için kullanilan awk komutu ile ilgili bilgiler yer aliyor.

Sed ve Özellikleri
Sed bir dosyadan veya standart girdiden(klavyeden) bilgi okur ve standart çiktiya (ekrana) okuduğu bilgileri kullanicinin belirlediği düzene sokarak yazar. Bu veriyi de kullanici genellikle bir dosyaya yerleştirir.


Örnekler
Sed kullanirken en çok başvuracağiniz işleç `s' işlecidir. Bir karakteri veya karakter kümesini başka bir diziye çevirmeye yarar. 
Buna basit bir örnek :sed 's/hapisane/hapishane/g' dosya Komutun sonundaki `g' işleci, sed'e dosyanin tamamini araştirmasini söyler. Eğer bunu kaldirirsaniz, sed her satirin başinda bulduğu ilk değiştirmeyi yapacak ve satirin geri kalanina dokunmayacaktir.
MULTILINE-COMMENT
