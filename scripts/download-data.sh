#!/bin/bash

# This is a shell script to download the chosen data and upload to hdfs, this must be run from an environmento
# with access to hadoop commands

set -x

urls=( "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201901" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201902" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201903" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201904" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201905" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201906" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201907" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201908" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201909" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201910" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201911" "http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/201912" )

mkdir -p ~/data
mkdir -p ~/data/uploaded
hdfs dfs -mkdir /input || true
for url in ${urls[*]}
do
	cd ~/data &&
		wget -O current.zip $url &&
		unzip current.zip &&
		hdfs dfs -put ./*.csv /input/ &&
		rm ./*.zip && mv ./*.csv ./uploaded/
done

