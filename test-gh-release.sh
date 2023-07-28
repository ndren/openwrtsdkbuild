sed -i 's/https/http/g' /etc/opkg/distfeeds.conf
sed -i '/check_signature/s/^/#/g' /etc/opkg.conf

mkdir -p /var/lock/ && touch /var/lock/opkg.lock
opkg update
opkg install wget-ssl

opkg print-architecture

# Defaults to https://github.com/ndren/openwrtsdkbuild/releases/tag/latest
echo "src/gz myrepo ${UPLOAD_REPO}" >> /etc/opkg/customfeeds.conf

opkg install "${PACK_NAME}"
"${PACK_NAME}" || true
