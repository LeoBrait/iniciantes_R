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
df <- data.frame(alunos, tempo_redes_sociais, nota_prova)

# Abstrair ---------------------------------------------------------------------
# remover primeira coluna
df <- df[, -1]
colnames(df) <- c("x", "y")

# Covariancia ------------------------------------------------------------------
## Tamanho amostral
length <- length(df$x)

## Médias
media_x <- mean(df$x)
media_y <- mean(df$y)

resultados <- data.frame(
  "permutacao" = numeric(),
  "coeficiente_angular" = numeric(),
  "coeficiente_linear" = numeric(),
  "coeficiente_correlacao" = numeric(),
  "r_quadrado" = numeric(),
  "soma_dos_residuos" = numeric()
)
permutations <- 5000
tempo_de_espera <- 3
for (i in 1:permutations){

  desvios_x <- df$x - media_x
  desvios_y <- df$y - media_y

  ## Covariancia ---------------------------------------------------------------
  desvios_x <- df$x - media_x
  desvios_y <- df$y - media_y
  desvios_multiplicados <- desvios_x * desvios_y

  sigma_x <- sum(df$x)
  sigma_y <- sum(df$y)
  sigma_desvios_x <- sum(desvios_x)
  sigma_desvios_y <- sum(desvios_y)
  soma_desvios_multiplicados <- sum(desvios_multiplicados)

  covariancia <- soma_desvios_multiplicados / (length - 1)

  # Coeficiente de correlação --------------------------------------------------
  variancia_x <- sum(desvios_x ^ 2) / (length - 1)
  variancia_y <- sum(desvios_y ^ 2) / (length - 1)
  coeficiente_correlacao <- covariancia / sqrt(variancia_x * variancia_y)
  r_quadrado <- coeficiente_correlacao ^ 2

  # Componentes da reta --------------------------------------------------------
  coeficiente_angular <- covariancia / variancia_x
  coeficiente_linear <- media_y - coeficiente_angular * media_x
  y_predito <- coeficiente_angular * df$x + coeficiente_linear
  residuos <- df$y - y_predito
  soma_dos_residuos <- sum(residuos)

  if (i == 1) {
    df_original <- data.frame(
      "x" = df$x,
      "y" = df$y,
      "y_predito" = y_predito,
      "residuos" = residuos
    )

    resultados_originais <- data.frame(
      "permutacao" = i,
      "coeficiente_angular" = coeficiente_angular,
      "coeficiente_linear" = coeficiente_linear,
      "coeficiente_correlacao" = coeficiente_correlacao,
      "r_quadrado" = r_quadrado,
      "soma_dos_residuos" = soma_dos_residuos
    )
  }

  # atualizar resultados
  resultados <- rbind(
    resultados,
    data.frame(
      "permutacao" = i,
      "coeficiente_angular" = coeficiente_angular,
      "coeficiente_linear" = coeficiente_linear,
      "coeficiente_correlacao" = coeficiente_correlacao,
      "r_quadrado" = r_quadrado,
      "soma_dos_residuos" = soma_dos_residuos
    )
  )


  # plotar ---------------------------------------------------------------------
  par(mfrow = c(2, 3))

  ## Histograma do coeficiente de correlação
  hist(
    resultados$coeficiente_correlacao,
    main = "Histograma de coeficiente de correlação",
    xlab = "Coeficiente de correlação",
    col = "blue"
  )
  abline(v = resultados[i, "coeficiente_correlacao"], col = "green", lwd = 2)
  abline(v = resultados[1, "coeficiente_correlacao"], col = "red", lwd = 2)

  ## Histograma do coeficiente angular
  hist(
    resultados$coeficiente_angular,
    main = "Histograma de coeficiente angular",
    xlab = "Coeficiente angular",
    col = "blue"
  )
  abline(v = resultados[i, "coeficiente_angular"], col = "green", lwd = 2)
  abline(v = resultados[1, "coeficiente_angular"], col = "red", lwd = 2)

  ## Histograma do coeficiente linear
  hist(
    resultados$coeficiente_linear,
    main = "Histograma de coeficiente linear",
    xlab = "Coeficiente linear",
    col = "blue"
  )
  abline(v = resultados[i, "coeficiente_linear"], col = "green", lwd = 2)
  abline(v = resultados[1, "coeficiente_linear"], col = "red", lwd = 2)

  ## Histograma do r_quadrado
  hist(
    resultados$r_quadrado,
    main = "Histograma de r_quadrado",
    xlab = "r_quadrado",
    col = "blue"
  )
  abline(v = resultados[i, "r_quadrado"], col = "green", lwd = 2)
  abline(v = resultados[1, "r_quadrado"], col = "red", lwd = 2)

  ## Histograma da soma dos resíduos
  plot(
    df_original$x, df_original$y,
    pch = 19,
    col = "blue",
    main = "",
    xlab = "Tempo em redes sociais",
    ylab = "Nota na prova",
    xlim = c(0, 6),
    ylim = c(0, 11)
  )
  abline(
    resultados_originais$coeficiente_linear,
    resultados_originais$coeficiente_angular,
    col = "red", lwd = 2
  )

  # plotar o scatterplot e a linha do dado permutado
  plot(
    df$x, df$y,
    pch = 19,
    col = "blue",
    main = paste0("Permutação ", i),
    xlab = "Tempo em redes sociais",
    ylab = "Nota na prova",
    xlim = c(0, 6),
    ylim = c(0, 11)
  )
  abline(coeficiente_linear, coeficiente_angular, col = "green", lwd = 2)


  ## Permutar ------------------------------------------------------------------
  df$y <- sample(df$y)
  df$x <- sample(df$x)

  ## Aguardar ------------------------------------------------------------------
  Sys.sleep(tempo_de_espera)
  tempo_de_espera <- (tempo_de_espera / 1.5) + 0.05

}

## Calcular p-valor bicaudal
p_valor <-
  sum(
    abs(resultados$coeficiente_correlacao)
    >= abs(resultados_originais$coeficiente_correlacao)
  ) / permutations