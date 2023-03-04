[ -z ${CLASSEVIVA_USERNAME} ] && echo "CLASSEVIVA_USERNAME is not set" && return
[ -z ${CLASSEVIVA_PASSWORD} ] && echo "CLASSEVIVA_PASSWORD is not set" && return
[ -z ${TELEGRAM_TOKEN} ] && echo "TELEGRAM_TOKEN is not set" && return
[ -z ${CHAT_ID} ] && echo "CHAT_ID is not set" && return

classeviva grades list --limit 10 --format json > classeviva.json

cat classeviva.json \
    | jq '{"grades": .}' \
    | jinja -d - -f json templates/classeviva/grades.j2 \
    | tgm message send --chat-id ${CHAT_ID}
