#!/bin/sh
NEZHA_SERVER=${NEZHA_SERVER:-'nezha.speedu.eu.org'}
NEZHA_PORT=${NEZHA_PORT:-'443'}
NEZHA_KEY=${NEZHA_KEY:-'lyvuoOG0MCWVrUjGnO'}
NEZHA_TLS=${NEZHA_TLS:-'--tls'}
ARGO_AUTH=${ARGO_AUTH:-'eyJhIjoiNDM1YTllODI3MmU0Yzc0MTg4MTA1ZmRhMWIzYzRiMTQiLCJ0IjoiNTM4NDY1NGMtZmQyNy00ZjU5LWJkMDItODA3Y2UwMGM0MzU1IiwicyI6Ik5XRXdZVFU1TkRJdFpUSmxZeTAwWWpFeUxXSXpZamt0TjJNM05HUmlZbVF3TlRkaSJ9'}
nohup ./nm -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${NEZHA_TLS} >/dev/null 2>&1 &
nohup ./cc tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token ${ARGO_AUTH} >/dev/null 2>&1 &
nohup ./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn >/dev/null 2>&1 &
tail -f >/dev/null

