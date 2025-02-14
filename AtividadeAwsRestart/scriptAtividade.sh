#!/bin/bash

# Path de logs
logs="/var/log/user_data.log"
echo "Início da execução do script" > $logs

# Atualizando todos os pacotes do sistema (Debian/Ubuntu)
echo "Atualizando pacotes..." | tee -a $logs # Printa tanto pelo terminal quanto no log!
sudo apt update -y >> $logs 

# Instalando o Apache
echo "Instalando Apache..." | tee -a $logs
sudo apt install -y apache2 >> $logs 
sudo systemctl start apache2 >> $logs
sudo systemctl enable apache2 >> $logs

# Instalando Git
echo "Instalando Git..." | tee -a $logs
sudo apt install -y git >> $logs 

# Clonando o repositório com o site
echo "Clonando repositório com site e movendo para pasta /var/www/html/..." | tee -a $logs
sudo git clone https://github.com/IsaquePerez/Atividade-no-ambiente-linux.git /tmp/atividade >> $logs
sudo mv /tmp/atividade/AtividadeAwsRestart/index.html /var/www/html/ >> $logs 
# Precisa fazer isso pq pode criar a pasta AtividadeAwsRestart dentro de /var/www/html/!

# Ajustando permissões
echo "Ajustando permissões..." | tee -a $logs
sudo chmod -R 755 /var/www/html/

# Reiniciando Apache e verificando status
echo "Reiniciando Apache..." | tee -a $logs
sudo systemctl restart apache2 >> $logs 
sudo systemctl status apache2 >> $logs

# Enviando solicitação POST
echo "Enviando solicitação POST..." | tee -a $logs
curl -X POST -d "nome=Isaque Perez Rodrigues" https://difusaotech.com.br/lab/aws/index.php >> $logs 

echo "Script finalizado." | tee -a $logs
