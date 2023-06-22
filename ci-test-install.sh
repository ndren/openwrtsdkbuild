sed -i 's/https/http/g' /etc/opkg/distfeeds.conf
sed -i '/check_signature/s/^/#/g' /etc/opkg.conf

mkdir -p /var/lock/ && touch /var/lock/opkg.lock
opkg update
opkg install wget-ssl

echo "src/gz myrepo http://usernameisnotimportant:${PERSONAL_ACCESS_TOKEN}@${UPLOAD_REPO}" >> /etc/opkg/customfeeds.conf
opkg update
opkg install "${PACK_NAME}"

"${PACK_NAME}"
