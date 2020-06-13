#fouttre l'ip depuis le fichier
echo ip.txt
pure-ftpd -p 21000:21000 -P $(cat ip.txt)
