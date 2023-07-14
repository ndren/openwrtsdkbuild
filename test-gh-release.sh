sed -i 's/https/http/g' /etc/opkg/distfeeds.conf
sed -i '/check_signature/s/^/#/g' /etc/opkg.conf

mkdir -p /var/lock/ && touch /var/lock/opkg.lock
opkg update
opkg install curl

opkg print-architecture

curl "${UPLOAD_REPO}/releases/download/latest/${IPK_NAME}" -Lo "${IPK_NAME}"
opkg install "${IPK_NAME}"

"${PACK_NAME}"
