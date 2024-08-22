#!/bin/bash

for i in .homes .drivers .lixeiras publico sindicancia supervisao cimic chefia_turno_I chefia_turno_II chefia_turno_III chefia_turno_IV conexao_familiar administrativo aevp almoxarifado canil cpd dcsd educacao financas inclusao infraestrutura saude
scanner  wallpaper diretoria_geral diretoria_de_centro nucleo_de_pessoal portaria_turno_I portaria_turno_II portaria_turno_III portaria_turno_IV rol_de_visitas; 
echo "10.14.29.11:/srv/samba/$i  /srv/samba/$i nfs defaults 0 0 " >> /etc/fstab ; 
chmod a+w /srv/samba/$i
done
