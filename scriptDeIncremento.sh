#!/bin/bash
#Isaque Perez Rodrigues
#Criei esse script para criar arquivos.

mkdir -p ArquivosScript
cd ArquivosScript

file=$(ls -F | grep -v '/' | wc -l)
counter=$file
while [ "$counter" -le $((24+file)) ]; do
    ((counter++))
    touch "isaque${counter}.txt"
    if [ "$counter" -gt 0 ]; then
        echo "Meu $((counter))º arquivo foi criado!"
    else
        echo "Meu $counterº arquivo foi criado!"
    fi
done

echo "$((counter)) arquivos criados!"
echo "Fim do Script!"