#!/bin/bash
clear
# get the VPS IP
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi

echo ""
echo -e "==========[[-Script-By-D1NFUCK3R-]]=========="
echo ""
echo -e "	ชื่อบัญชีที่ต้องการสร้าง"
echo -e ""
read -p "	Username : " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "	Username [$username] นี้มีอยู่แล้ว!"
	exit 1
else
	echo -e ""
	echo -e "	รหัสผ่าน"
	echo -e ""
	read -p "	Password : " password
echo -e ""
echo -e "	วันใช้งาน"
echo -e ""
	read -p "	ระบุจำนวนวันใช้งาน : " D1N

	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$D1N days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire lowclass-vpn.ga-$username
	echo lowclass-vpn.ga-$username:$password | chpasswd
echo "Connecting to LOWCLASS VPN SSH.."
sleep 0.6
echo "กำลังสร้างบัญชี.."
sleep 0.4
echo "สร้างอยู่.."
sleep 0.4
echo "จะเสร็จล่ะ.."
sleep 0.4
echo "อีกนิด.."
sleep 0.4
echo -e "สร้างบัญชี เรียบร้อยแล้ว.."
sleep 1
clear

echo -e ""
echo -e "============[[-LOWCLASS-VPN-SSH-]]==========="
echo -e ""
echo -e "     Host: $MYIP										  "
echo -e "     Username: lowclass-vpn.ga-$username "
echo -e ""
echo -e "     Password: $password            		       "
echo -e ""
echo -e "     Port ssh : 22, 443       						   "
echo -e "     Port Proxy   : 8080,3128      				  "
echo -e "     จำกัดเชื่อมต่อ : SSH 2 VPN 1         			 "
echo -e ""
echo -e "     วันหมดอายุ  : $(date -d "$D1N days" +"%d-%m-%Y")"
echo -e "     Config OVPN:                          			  "
echo -e ""
echo -e "     http://$MYIP/client.ovpn  	      			  "
echo -e "============================================="
echo -e "   แสบไข่เมื่อไหร่ ก้อโทรมาหาเฮียน่ะ 555              	"
echo -e ""
echo -e ""
fi
