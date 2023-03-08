#******************** Script tutorial de R *************************************
#*******************************************************************************
# Autor: Brait LAS (leonardobrait@gmail.com)
# Data: Março 2023
#*******************************************************************************
#******************** Módulo 3: Vetores ****************************************

# 1. Criando vetores
# execute os comandos a seguir e observe o resultado.
vetor_de_numeros <- c(1, 2, 3, 4, 5)
vetor_de_nomes <- c("Daniel", "Leonardo", "Patricia", "Carlos")
print(vetor_de_numeros)
print(vetor_de_nomes)

# 2. Acessando elementos de um vetor pelo índice.
print(vetor_de_nomes[2])
print(vetor_de_nomes[4])
print(vetor_de_numeros[3])

# os valores contidos nos vetores são indexados. O primeiro elemento do vetor
# é o elemento 1, o segundo é o elemento 2, e assim por diante. Cada valor pode
# ser acessado pelo seu índice correspondente utilizando colchetes.

################################################################################
# Exercício: crie um vetor com 5 nomes de pessoas e imprima o terceiro nome.


################################################################################

# 3. Acessando elementos de um vetor por intervalo.
# Você também pode acessar um intervalo de elementos de um vetor utilizando
# o intervalo desejado entre colchetes e separados por dois pontos.
print(vetor_de_nomes[2:4])

# 4. Modificando elementos de um vetor por índice.
# Você pode modificar um elemento de um vetor utilizando o índice.
vetor_de_nomes[2] <- "Leonardo Brait"
print(vetor_de_nomes)
vetor_de_nomes[2] <- "Programação"
print(vetor_de_nomes)

# 5. Acessando elementos de um vetor por condição.
# Você pode acessar elementos de um vetor que atendam a uma condição.
# Execute os comandos a seguir e observe o resultado.
vetor_de_numeros <- c(1, 2, 3, 4, 5)
vetor_de_nomes <- c("Daniel", "Leonardo", "Patricia", "Carlos")
print(vetor_de_numeros)
vetor_de_nomes[vetor_de_nomes == "Leonardo"] <- "Leonardo Brait"
print(vetor_de_nomes)

# No exemplo anterior utilizamos o operador == para verificar uma condição.
# podemos ler o comando como: "se o elemento do vetor vetor_de_nomes for igual a
# "Leonardo", então substitua o elemento por "Leonardo Brait"

################################################################################
# Exercício: pratique o acesso a vetores por condições. Um outo operador útil
# é o operador != que significa "diferente de".

################################################################################

################################################################################
# Desafio: Crie um vetor com 10 números e substitua todos os numeros maiores que
# 5 por 0.

################################################################################