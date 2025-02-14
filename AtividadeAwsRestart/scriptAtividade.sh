#!/bin/bash

# Path de logs
logs="/var/log/user_data.log"
echo "Início da execução do script" > $logs

# Atualizando pacotes
echo "Atualizando pacotes..." | tee -a $logs
yum update -y >> $logs 

# Instalando o Apache
echo "Instalando Apache..." | tee -a $logs
yum install -y httpd >> $logs 
systemctl start httpd >> $logs
systemctl enable httpd >> $logs

# Baixando o repositório com o site
echo "Clonando repositório..." | tee -a $logs
yum install -y git >> $logs 
git clone https://github.com/IsaquePerez/Atividade-no-ambiente-linux.git /var/www/html/ >> $logs 

# Ajustando permissões
echo "Ajustando permissões..." | tee -a $logs
chown -R apache:apache /var/www/html/ >> 
chmod -R 755 /var/www/html/ >> $logs

# Reiniciando Apache
echo "Reiniciando Apache..." | tee -a $logs
systemctl restart httpd >> $logs 

# Enviando solicitação POST
echo "Enviando solicitação POST..." | tee -a $logs
curl -X POST -d "nome=Isaque Perez Rodrigues" https://difusaotech.com.br/lab/aws/index.php >> $logs 

echo "Script finalizado." | tee -a $logs