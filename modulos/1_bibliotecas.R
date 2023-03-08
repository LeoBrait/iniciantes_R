#******************** Script tutorial de R *************************************
#*******************************************************************************
# Autor: Brait LAS (leonardobrait@gmail.com)
# Data: Março 2023
#*******************************************************************************
#******************** Módulo 1: Bibliotecas ************************************

# 1. Onde estão minhas bibliotecas?
# Cada biblioteca instalada para o R é uma pequena pasta situada em algum lugar
# do seu computador. O(s) lugare(s) onde estão suas bibliotecas é chamado de
# lib path.
# Consulte o libpath do seu computador com o comando a seguir.
.libPaths()

# O resultado dessa consulta é uma lista de caminhos. Para alguns iniciantes
# azarados, haverá mais de um caminho de bibliotecas e isso poderá causar
# algumas dores de cabeça na instalação de pacotes.
# Caso esteja enfrentando isto, você pode resolver instalando e carregando as
# bibliotecas especificando o caminho da biblioteca que você quer usar.

# 2. Instalando uma biblioteca

# Para os sortudos:
install.packages("tidyverse")

# Para os azarados:
install.packages("tidyverse", lib = "C:/Users/leona/Documents/R-4.2.1/library")
# O caminho acima é um exemplo. Você deve substituir por um dos caminhos da sua
# preferência que esteja na lista de lib paths do passo 1.

# 3. Carregando uma biblioteca

# Para os sortudos:
library(tidyverse)

# Para os azarados:
library(tidyverse, lib.loc = "C:/Users/leona/Documents/R-4.2.1/library")
# O caminho acima é um exemplo. Você deve substituir pelo MESMO caminho
# oferecido no argumento lib do passo 2.

# Essa é uma resolução parcial para o problema que alguns iniciantes enfrentam
# com intalação de bibliotecas. Para uma resolução completa, procure na internet
# sobre variáveis de ambiente e como configurar o R neste sentido.