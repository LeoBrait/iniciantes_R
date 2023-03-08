#******************** Script tutorial de R *************************************
#*******************************************************************************
# Autor: Brait LAS (leonardobrait@gmail.com)
# Data: Março 2023
#*******************************************************************************
#******************** Módulo 0: primeiros passos *******************************


# 1. Local de trabalho
# No R, o local de trabalho é a pasta onde os arquivos são salvos e carregados.
# Compreender o conceito e definir seu local de trabalho pode ser muito útil
# para evitar erros chatos e para organizar seus arquivos.

#1.1 a função a seguir mostra o local de trabalho atual. Observe que o resultado
# é um caminho de pasta, que é uma sequência de pastas separadas por barras.
# getwd é a abreviação de get working directory.
getwd()

#1.2 a função a seguir define o local de trabalho. Observe que o argumento
# é um caminho de pasta entre aspas. No R, as barras aceitas são "/" e não "\".
# Use o setwd a seguir substituindo o caminho do exemplo pelo caminho da sua
# pasta de trabalho deste curso.
# atente que iniciantes_R deve ser a última pasta do caminho na sua máquina.
setwd("C:/Users/leona/Desktop/iniciantes_R/")

#1.2.1 Ah, esqueci de dizer. A função getwd() é meramente uma função de checagem
# e não costuma ser necessária para nenhum workflow. Ela serve para você,
# usuário se situar. Utilize o getwd() novamente para checar se seu setwd()
# funcionou.
getwd()

# 2. Abrindo tabelas
# O R é uma ferramenta muito útil para análise de dados. Dito isto,
# provavelmente a dor de cabeça que te fez chegar aqui envolve abrir tabelas e
# trabalhar com elas. Então vamos lá.

#2.1 a função a seguir abre uma tabela. Observe que o argumento é um caminho de
# arquivo entre aspas.

preco_frutas_df <- read.csv("inputs/frutas/frutas_precos.txt")

# O que está sendo dito aqui é "leia a tabela que está na pasta frutas, dentro
# da pasta inputs, e que se chama frutas_precos.txt".
# Ou dito de maneira mais simples: "leia o arquivo do caminho indicado"


#2.2 Você pode consultar a tabela com o comando View() ou pode simplesmente
# digitar o nome da tabela.
View(frutas_df)
frutas_df

# 2.3 Você deve ter percebido que está uma tabela meio estanha, meio feiosa. Na
# verdade, sequer parece uma tabela!! Isso acontece porque o R não sabe que o
# separador da tabela é uma vírgula. Para corrigir isso, basta adicionar o
# argumento "sep = ",".

preco_frutas_df <- read.csv("inputs/frutas/frutas_precos.txt", sep = ",")
View(preco_frutas_df)
preco_frutas_df

################################################################################
# Exercício 1: Abra a tabela de preço de verduras e tente atrelar o argumento de
# separador adequado.
# a tabela está na pasta verduras, dentro da pasta inputs.





################################################################################
# Parabéns! Você terminou o módulo 0 e provavelmente aprendeu sobre caminhos e 
# como abrir tabelas no R.