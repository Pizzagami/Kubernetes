#fouttre l'ip depuis le fichier
pure-ftpd -p 21000:21000 -P $(cat ip.txt)
