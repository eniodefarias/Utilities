#!/bin/bash

#exemplo:
#  ./ffmpg_extrair_audio.sh $(find /home/user/Downloads -name "*.mp4" | sort)


HOME=/$(whoami)
lista_arquivos=$*
qtde_lista_arquivos=$#

echo "lista parametros=$lista_arquivos"
echo "qtde parametros=$qtde_lista_arquivos"
counter=1
while [ $counter -le $qtde_lista_arquivos ]
    do

        zero_counter=$(printf %04d $counter)
        arquivo_da_vez=$(echo $lista_arquivos | awk -v id_counter="$counter" '{ print $id_counter }' )
        diretorio=$(dirname $arquivo_da_vez)
        #cd diretorio
        nome_arq=$(echo $arquivo_da_vez | awk -F"/" 'NF>1{print $NF}' )
        if [ "$nome_arq" == "" ]
            then
                nome_arq=$arquivo_da_vez
            fi
        arquivo_original=$diretorio/$nome_arq
        novo_arquivo="$diretorio/audio_"$zero_counter"_"$nome_arq.mp3

        echo " fazendo arquivo $counter = $arquivo_original"
        echo " criando novo arquivo = $novo_arquivo"
        #ls -latrh $diretorio/$nome_arq
        #echo "------"




        time ffmpeg -y -i $arquivo_original -vn -acodec mp3 $novo_arquivo
        echo " TERMINOU arquivo $counter = $arquivo_original"
        echo " TERMINOU novo arquivo = $novo_arquivo"
        echo ""
        echo ""
        echo ""


        counter=$((counter + 1))
    done
