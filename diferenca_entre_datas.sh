#!/bin/bash

name=$0

#echo "$name"

#https://stackabuse.com/how-to-parse-command-line-arguments-in-bash/
#Single colon (:) - Value is required for this option
 #Double colon (::) - Value is optional
 #No colons - No values are required

data_final=$(date "+%d/%m/%Y")
data_inicial=''



SHORT=i:,f:,h
LONG=inicial:,final::,help
OPTS=$(getopt --alternative --name $name --options $SHORT --longoptions $LONG -- "$@")



#echo "opts $OPTS"

eval set -- "$OPTS"

while :
do
  case "$1" in
    -i | --inicial )
      data_inicial="$2"
      shift 2
      ;;
    -f | --final )
      data_final="$2"
      shift 2
      ;;
    -h | --help )
      echo -e " esta é uma mensagem de ajuda: help: \n
      -h, --help    -> exibe esta ajuda

      -i, --inicial  -> data inicial, ex.:
                      -i 20/10/1986
                      --inicial 20/10/1986

      -f, --final    -> data final,
                          obs.: não é obrigatório. caso não seja informado irá usar a data atual, ex.:
                      -f 20/10/2020
                      --final $data_final

      exemplo de uso:
      $name -i 20/10/1986 --final $data_final
      ou
      $name -i 20/10/1986
      ou
      $name -h

      "
      exit 2
      ;;
    --)
      shift;
      break
      ;;
    *)
      echo "Opção desconhecida inesperada: $1"
      exit 2
      ;;
  esac
done

if [ "$data_inicial" == "" -o "$data_final" == "" ]
    then
        echo "incial: $data_inicial"
        echo "final : $data_final"
        echo -e "ERRO: data não informada ou fora do padrão

        use o comando para mais informações:

        $name --help
        "
        exit 2
    else
        #faz o calculo e impre a diferença numerica em dias:

        ini_dia=$(echo -n "$data_inicial"|cut -d"/" -f1)
        ini_mes=$(echo -n "$data_inicial"|cut -d"/" -f2)
        ini_ano=$(echo -n "$data_inicial"|cut -d"/" -f3)
        fim_dia=$(echo -n "$data_final"|cut -d"/" -f1)
        fim_mes=$(echo -n "$data_final"|cut -d"/" -f2)
        fim_ano=$(echo -n "$data_final"|cut -d"/" -f3)
        ini="$ini_ano/$ini_mes/$ini_dia"
        fim="$fim_ano/$fim_mes/$fim_dia"

        segundos_data_final=$( date -d "$fim" "+%s")
        segundos_data_inicial=$( date -d "$ini" "+%s")
        diferenca=$(($segundos_data_final - $segundos_data_inicial))
        dias=$(( $diferenca / 3600 / 24 ))
        #echo "diferenca=$diferenca"
#        echo "dias=$dias"
        echo -n "$dias"

    fi


