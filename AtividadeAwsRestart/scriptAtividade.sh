#!/bin/bash

# Path de logs
logs="/var/log/user_data.log"
echo "Início da execução do script" > $logs

# Atualizando todos os pacotes do sistema(linux)
echo "Atualizando pacotes..." | tee -a $logs #Printa tanto pelo terminal quanto no log!
yum update -y >> $logs 

# Instalando o Apache
echo "Instalando Apache..." | tee -a $logs
yum install -y httpd >> $logs 
systemctl start httpd >> $logs
systemctl enable httpd >> $logs

# Instalando Git
echo "Instalando Git..." | tee -a $logs
yum install -y git >> $logs 

# Clonando o repositório com o site
echo "Clonando repositório com site e movendo para pasta /var/www/html/..." | tee -a $logs
git clone https://github.com/IsaquePerez/Atividade-no-ambiente-linux.git /tmp/atividade >> $logs
mv /tmp/atividade/AtividadeAwsRestart/index.html /var/www/html/ >> $logs 
# Precisa fazer isso pq pode criar a pasta AtividadeAwsRestart dentro de /var/www/html/!

# Reiniciando Apache
echo "Reiniciando Apache..." | tee -a $logs
systemctl restart httpd >> $logs 

# Enviando solicitação POST
echo "Enviando solicitação POST..." | tee -a $logs
curl -X POST -d "nome=Isaque Perez Rodrigues" https://difusaotech.com.br/lab/aws/index.php >> $logs 

echo "Script finalizado." | tee -a $logs