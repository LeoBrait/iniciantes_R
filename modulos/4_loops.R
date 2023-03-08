#******************** Script tutorial de R *************************************
#*******************************************************************************
# Autor: Brait LAS (leonardobrait@gmail.com)
# Data: Março 2023
#*******************************************************************************
#******************** Módulo 4: Loops ******************************************

# 1. Realizando repetições for.
# Teremos uma longa etapa de observação agora. Tente ddeduzir o que está
# acontecendo a partir da evolução dos resultados a seguir:

# level 0:
print("Hello world!")

# level 1:
for (iteracao in 1:5) {
  print("Olá mundo!")
}

for (iteracao in 1:10) {
  print("tchau mundo!")
}

# level 2:
for (iteracao in 1:5) {
  print(iteracao)
}

for (i in 1:5) {
  print("Olá mundo!")
}

for (i in 1:10) {
  print("tchau mundo!")
}

for (i in 1:5) {
  print("Olá mundo!")
  print("tchau mundo!")
  print(i)
}

# level 3:
for (i in 1:5) {
  print("Olá mundo!")
  print("tchau mundo!")
  print(
        paste("Essa é a iteração de número:", i)
        )
}
