#!/bin/bash
#Isaque Perez Rodrigues
#Criei esse script para criar arquivos.

mkdir -p ArquivosScript
cd ArquivosScript

counter=1
while [ $counter -le 25 ]; do
    touch "isaque${counter}.txt"
    echo "Meu $counterº arquivo foi criado!"
    ((counter++))
done

echo "$((counter -1)) arquivos criados!"
echo "Fim do Script!"