
[ -z ${CHAT_ID} ] && echo "CHAT_ID is not set" && return
[ -z ${TELEGRAM_TOKEN} ] && echo "TELEGRAM_TOKEN is not set" && return


rfrb it iphones --name "13 Pro Max" --format json > iphones.json

cat iphones.json | \
    jq '{"products": .}' | \
    jinja -d - -f json templates/refurbished/iphones.j2 | \
    tgm message send --chat-id ${CHAT_ID}
