# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# FUNÇÃO: plot_iter
# Descrição: Gráfico interativo série tempo
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

plot_iter = function(dados) {
  dados %<>%  as.data.frame()
  serie = xts(x = dados[,2], order.by = dados[,1])
  grafico = dygraph(serie) %>%
    dyOptions(labelsUTC = TRUE, 
              fillGraph=TRUE, 
              fillAlpha=0.1, 
              drawGrid = FALSE, 
              colors="#D8AE1A") %>%
    dyRangeSelector() %>%  
    dyCrosshair(direction = "vertical") %>%
    dyHighlight(highlightCircleSize = 5, 
                highlightSeriesBackgroundAlpha = 0.2, 
                hideOnMouseOut = FALSE)  %>%
    dyRoller(rollPeriod = 1)
  return(grafico)
}

