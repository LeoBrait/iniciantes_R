# Titulo 
#   Aula de tidyverse
# Descrição 
#   Nesta aula aprenderemos sobre as funções do tidyverse, que são muito úteis
#   para a transformação de tabelas. O tidyverse possui um conjunto de funções 

#     



library(tidyverse)


df <- read_csv("inputs/amostras_macroinvertebrados.csv")
View(df)


################################### Mutate #####################################
# A função mutate() é usada para criar novas variáveis ou modificar existentes
# Podemos empregar inclusive fórmulas para responder perduntas sobre os dados
#
################################################################################


df <- mutate(
  df,
  total_insetos = ephemeroptera + plecoptera + tricoptera
)

# Desafio 1!
## Calcule a média de insetos em cada coleta

# Desafio 2!
## Calcule a abundância relativa (porcentagem) de instos em cada coleta


############################ Group_by e summarise ##############################
#  As funções group_by() e summarise() são usadas de maneira congugada:
#   * A função group_by() agrupa os dados de acordo com a pergunta
#   * A função summarise() calcula a estatística desejada para cada grupo
#     baseado no agrupamento feito pela função group_by() e em uma fórmula
#     definida pelo usuário.
################################################################################
