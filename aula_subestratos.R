# Titulo
#   Aula de tidyverse - Resumindo dados!
# Descrição
#   Nesta aula aprenderemos sobre as funções do tidyverse, que são muito úteis
#   para a transformação de tabelas em estatísticas descritivas.
################################################################################

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
## Calcule a abundância relativa (porcentagem) de vada ordem de insetos
## em cada coleta usando a função mutate()
## Dica: Pense/escreva como é a fórmula da porcentagem antes de tentar resolver
## Dica 2: imagine/desenhe como vc espera a tabela depois de resolver o desafio


############################ Group_by e summarise ##############################
#  As funções group_by() e summarise() são usadas de maneira congugada:
#   * A função group_by() agrupa os dados de acordo com a pergunta
#   * A função summarise() calcula a estatística desejada para cada grupo
#     da tabela a partir de uma fórmula definida pelo usuário.
################################################################################
df_agrupado <- group_by(df, bioma) #

df_medias_biomas <- summarise(     #
  df_agrupado,                     #
  media_ephemeroptera = mean(ephemeroptera),  #
  media_plecoptera = mean(plecoptera),        #
  media_tricoptera = mean(tricoptera)         #
)

# Desafio 2!
## Descreva o que aconteceu em cada um dos passos acima nas respectivas
## linhas de script

# Desafio 3!
## Pesquise na internet e aplique outras 2 operações estatísticas descritivas
## dentro da função summarise() e explique o que você fez.

## Desafio 4!
## Descubra e escreva em texto o total de insetos encontrado por cada coletor
## Resposta:

## Desafio 5!
## Descubra e escreva em texto a porcentagem de insetos encontrados por cada
## coletor.
## Resposta:

################################# Funçao Pipe ##################################
#   * A função pipe (|>) é usada para criar fluxos de dados. O que ela faz é
#     pegar o resultado da função anterior e passar como primeiro argumento para
#     a próxima função. É uma função apenas de comodidade, isto é, não muda o
#     resultado final, mas muda a forma como escrevemos o código, tornando-o
#     mais legível e mais prático de escrever.
#
#   Para o caso da conjugação entre as funções group_by() e summarise(), o pipe
#   acaba por economizar muitas linhas pois nos poupa de criar variáveis inter-
#   mediárias.
################################################################################

# sumario (resumo) das médias por bioma
df_medias_biomas <- df |> # Pegue objeto df e jogue como primeeiro argumento.
  group_by(bioma) |>      # agrupe por bioma e jogue como primeiro argumento
  summarise(              # calcule....
    media_ephemeroptera = mean(ephemeroptera), # media
    media_plecoptera = mean(plecoptera),       # media
    media_tricoptera = mean(tricoptera)        # media
  )

# sumário (resumo) dos desvios-padrão por bioma
df_medias_desvios <- df |>
  group_by(bioma) |>
  summarise(
    sd_ephemeroptera = sd(ephemeroptera),
    sd_plecoptera = sd(plecoptera),
    sd_tricoptera = sd(tricoptera)
  )

# sumário (resumo) da quantidade de amostras por bioma
df_medias_desvios_biomas <- df |>
  group_by(bioma) |>
  summarise(
    amostras = n()
  )

# Desafio 6!
## Descreva o que aconteceu em cada um dos sumários das seguintes maneiras
## a) o que cada função faz


# Não precisamos criar um sumário para cada estatística, podemos criar um único
# sumário com todas as estatísticas que quisermos, desde que respeitemos os
# agrupamentos.

df_sumario <- df |>
  group_by(bioma) |>
  summarise(
    media_ephemeroptera = mean(ephemeroptera),
    sd_ephemeroptera = sd(ephemeroptera),
    maximo_ephemeroptera = max(ephemeroptera),
    minimo_ephemeroptera = min(ephemeroptera),

    media_plecoptera = mean(plecoptera),
    sd_plecoptera = sd(plecoptera),
    maximo_plecoptera = max(plecoptera),
    minimo_plecoptera = min(plecoptera),

    media_tricoptera = mean(tricoptera),
    sd_tricoptera = sd(tricoptera),
    maximo_tricoptera = max(tricoptera),
    minimo_tricoptera = min(tricoptera),

    total_insetos = sum(ephemeroptera + plecoptera + tricoptera),
    total_amostras = n()
  )

## Dica: Essa tabela é muito grande, mas está sendo usada para exemplificar
## que você pode fazerm muitas operações de uma única vez.


# Desafio final:
# Teste, pesquise, escreva, explore e produza um texto explicando o que cada 
# função faz de maneira topicalizada e aborde a diferença entre as funções
# mutate(), group_by() e summarise().