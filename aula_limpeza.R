library(tidyverse)

df <- read_csv("inputs/amostras_macroinvertebrados.csv")
View(df)

################################### Filter #####################################
# A função filter() é usada para filtrar LINHAS de acordo com uma condição
# associada a alguma coluna da tabela.
# A função filter() é uma função do pacote dplyr, que é parte do tidyverse,
# entretanto, há uma função filter() no r-base também.
# Para que o R não confunda as duas funções, é necessário usar o prefixo dplyr::
# que significa "do pacote dplyr, use a função filter()"
################################################################################

# selecionando apenas os dados do bioma Amazônia
df_filtro <- dplyr::filter(df, bioma == "Amazônia")


# Posso fazer o contrário e filtrar os dados que NÃO são do bioma Amazônia
# usando o operador de negação "!" (exclamação)

df_filtro <- dplyr::filter(df, !(bioma == "Amazônia"))

# Posso ainda filtrar os dados de acordo com mais de uma condição para a
# mesma coluna com o operador lógico "|", que significa "ou"....
df_filtro <- dplyr::filter(df, bioma == "Amazônia" | bioma == "Cerrado")

# ou para colunas diferentes com o operador lógico "&", que significa "e"....
df_filtro <- dplyr::filter(df, bioma == "Amazônia" & coletor == "Marina Costa")


# da mesma forma, posso fazer o inverso da condição usando o operador de negação
# "!" (exclamação) e o operador lógico "&", que significa "e"....
df_filtro <- dplyr::filter(
  df,
  !(bioma == "Amazônia" & coletor == "Marina Costa")
)

################################## Select ######################################
# A função select() é usada para manter ou remover COLUNAS
################################################################################