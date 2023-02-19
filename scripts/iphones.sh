
pushd code/projects/zmoog/automator

. venv/bin/activate

rfrb it iphones --name "13 Pro Max" --format json > iphones.json

cat iphones.json | \
    jq '{"products": .}' | \
    jinja -d - -f json templates/refurbished/iphones.j2 | \
    tgm message send --chat-id ${CHAT_ID}

popd
