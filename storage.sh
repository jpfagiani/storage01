#!/bin/bash

hostnamectl set-hostname storage.cdpni.gov
apt install openssh-server xfsprogs -y
	cp -v /root/cdpni/storage/network/interfaces /etc/network/
	cp -v /root/cdpni/storage/etc/* /etc/
	chattr +i /etc/resolv.conf
	cp -v /root/cdpni/storage/ssh/sshd_config /etc/ssh/
	systemctl restart networking sshd
	#mkfs -t xfs /dev/sdb1
	#	xfs-admin -L supervisao /dev/sdb1 
	mkfs -t ext4 /dev/sdb1
		tune2fs -L supervisao /dev/sdb1
	mkfs -t ext4 /dev/sdc1
		tune2fs -L disciplina /dev/sdc1
	mkfs -t ext4 /dev/sdd1
		tune2fs -L publico /dev/sdd1
	mkdir -pv /srv/supervisao /srv/disciplina /srv/pulbico
		echo LABEL=supervisao /srv/supervisao ext4 defaults 0 0 >> /etc/fstab
		echo LABEL=disciplina /srv/disciplina ext4 defaults 0 0 >> /etc/fstab
		echo LABEL=publico    /srv/pulbico    ext4 defaults 0 0 >> /etc/fstab
for i in .homes .drivers .lixeiras publico; do mkdir -pv /srv/publico/$i; done 
for i in sindicancia supervisao cimic; do mkdir -pv /srv/supervisao/$i; done
for i in chefia_turno_I chefia_turno_II chefia_turno_III chefia_turno_IV conexao_familiar administrativo aevp almoxarifado canil  cpd dcsd educacao financas inclusao infraestrutura  saude ; do mkdir -pv /srv/disciplina/$i; done
for i in scanner  wallpaper diretoria_geral diretoria_de_centro nucleo_de_pessoal portaria_turno_I portaria_turno_II portaria_turno_III portaria_turno_IV rol_de_visitas; do mkdir -pv /srv/disciplina/$i; done
chmod 777 /srv/*




