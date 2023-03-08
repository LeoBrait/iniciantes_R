#******************** Script tutorial de R *************************************
#*******************************************************************************
# Autor: Brait LAS (leonardobrait@gmail.com)
# Data: Março 2023
#*******************************************************************************
#******************** Módulo 2: Assinando Variáveis ****************************

# 1. nomeando variáveis
# execute os comandos a seguir e observe o resultado.
caixinha_verde <- 10
caixinha_vermelha <- 20

print(caixinha_verde)
print(caixinha_vermelha)

caixa_maior <- caixinha_vermelha + caixinha_verde
print(caixa_maior)

# Perceba que você pode nomear variáveis com qualquer nome que você quiser. As
# únicas regras são: 1) não pode começar com número; 2) não pode conter espaços;
# 3) não pode conter caracteres especiais como !, @, #, $, %, ^, &, *, (, ), etc
# 4) não pode conter acentos.
# O recomendável nos manuais de estilo de R é que você use nomes de variáveis
# em minúsculo e com underline para separar palavras. Isto é chamado snake_case.
# Lembre-se sempre de utilizar nomes curtos e significativos. Evite siglas, a
# menos que sejam estritamente necessárias ou muito comuns. Por exemplo, as
# siglas de variáveis como "id" e "df" são comuns e não precisam de explicações.

# 2. Reassinalando variáveis
# execute os comandos a seguir e observe o resultado.
print(caixinha_verde)
caixinha_verde <- 30
print(caixinha_verde)
caixinha_verde <- caixinha_verde + 10
print(caixinha_verde)
caixinha_verde <- 0
print(caixinha_verde)

# Essa sequência é útil para entendermos que o R guarda o valor das variáveis
# assinadas e você pode fazer operações com essa informação. Mas você pode
# atribuir valores novos a qualquer momento.

################################################################################
# Exercício: crie suas variáveis, dê nome a elas e faça operações com elas.
# No exemplo acima eu usei o operador +, mas você pode usar qualquer operador,
# como -, *, /, etc.


################################################################################