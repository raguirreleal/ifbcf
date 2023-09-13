# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script: pesos_q
# Descrição: Calcula, para cada produto, a proporção (peso) da sua 
#            demanda total para uso como bem de capital.
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

nome_arqs_tab4 = list.files(dir_tru) %>% grep("68_tab4", ., value = TRUE)
path_arqs_tab4 = file.path(dir_tru, nome_arqs_tab4)
anos_tru = substr(nome_arqs_tab4, 9, 12) %>% as.numeric()

m_q = foreach(i=path_arqs_tab4, .combine=cbind) %do% {
  x_tab4 = read_excel(i, sheet = "demanda", 
                      col_types = "numeric") %>% 
    suppressMessages() %>% suppressWarnings()
  x_tab4 %<>% select(1, 7, 10)
  names(x_tab4) = c("cod", "dem_fbcf", "dem_total")
  x_tab4 %<>% filter(!is.na(cod))
  x_tab4$q = x_tab4$dem_fbcf / x_tab4$dem_total
}
m_q %<>% cbind(x_tab4$cod, .) %>% as_tibble() %>% suppressWarnings()
names(m_q) = c("cod", paste0("q", anos_tru))

