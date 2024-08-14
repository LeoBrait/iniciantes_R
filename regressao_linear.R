## Coeficiente de correlação manual

# Dados ------------------------------------------------------------------------
alunos <- c(
  "Pedro",
  "João",
  "Maria",
  "Ana",
  "José",
  "Carlos",
  "Paulo",
  "Lucas",
  "Marta",
  "Julia"
)
tempo_redes_sociais <- c(1, 2, 2, 2, 3, 2, 3, 3.5, 4, 5)
nota_prova <- c(10, 9, 8, 8, 6, 6, 5, 5, 4, 4)
plot(tempo_redes_sociais, nota_prova)
df <- data.frame(alunos, tempo_redes_sociais, nota_prova)
View(df)

# transformador de escala
#df$tempo_redes_sociais <- df$tempo_redes_sociais * 60
#df$nota_prova <- df$nota_prova * 10


# Transformar em x e y
x <- df$tempo_redes_sociais
y <- df$nota_prova

# Covariancia ------------------------------------------------------------------
## Tamanho amostral
length <- length(x)

## Médias
media_x <- mean(x)
media_y <- mean(y)

## Desvios da media em módulo
desvios_x <- x - media_x
desvios_y <- y - media_y

## multiplicação dos desvios
desvios_multiplicados <- desvios_x * desvios_y

## Sigmas de tudo
sigma_x <- sum(x)
sigma_y <- sum(y)
sigma_desvios_x <- sum(desvios_x)
sigma_desvios_y <- sum(desvios_y)
soma_desvios_multiplicados <- sum(desvios_multiplicados)

## Vetor de sigmas
vetor_sigmas <- c(
  "sigmas",
  sigma_x,
  sigma_y,
  sigma_desvios_x,
  sigma_desvios_y,
  soma_desvios_multiplicados
)

## Atualizar tabela
df_atualizado <- data.frame(df, desvios_x, desvios_y, desvios_multiplicados)
df_atualizado_com_sigma <- rbind(df_atualizado, vetor_sigmas)
View(df_atualizado_com_sigma)
write.csv(df_atualizado_com_sigma, "df_atualizado_com_sigma.csv")

## Calcular Covariancia
covariancia <- soma_desvios_multiplicados / (length - 1)

# Coeficiente de correlação ----------------------------------------------------
variancia_x <- sum(desvios_x ^ 2) / (length - 1)
variancia_y <- sum(desvios_y ^ 2) / (length - 1)
coeficiente_correlacao <- covariancia / sqrt(variancia_x * variancia_y)
r_quadrado <- coeficiente_correlacao ^ 2





#plot linear regression abline
plot(
  x, y,
  pch = 19,
  col = "blue",
  main = "",
  xlab = "Tempo em redes sociais",
  ylab = "Nota na prova"
)
abline(lm(y ~ x), col = "red")
sumario <- summary(lm(y ~ x))
print(sumario)
