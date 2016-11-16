#!/bin/bash

readonly PATH_TUMGREY=/home/rafael/Desktop/
readonly TUMGREY_FILE=arq.conf

function CriaDirEntradaIP()
{
	IP="$1"
	echo "Show, temos um IP para analisar!"
	echo "Local padrão das configurações:" $PATH_TUMGREY$TUMGREY_FILE
	
	ARQ_FINAL=`FormataDados $IP`
	echo "Finaleira: " $ARQ_FINAL
	mkdir -p $ARQ_FINAL
	ln -s $PATH_TUMGREY$TUMGREY_FILE $ARQ_FINAL/__default__		
}


function FormataDados()
{
	IP="$1"
	FINAL=`echo $IP | tr '.' '/'`
	PATH_FINAL=$PATH_TUMGREY$FINAL/
	echo $PATH_FINAL
}

echo "Informe o IP para liberacao: "
read IP

#echo $IP

if [ -z "$IP" ] 
then
	echo "IP não informado, saindo ..."
	exit
else
	echo "IP informado, realizando procedimento ..."
	CriaDirEntradaIP $IP
fi
