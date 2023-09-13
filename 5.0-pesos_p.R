# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script: 5.0-pesos_p.R
# Descrição: Calcula, para cada produto, a proporção (peso) da  
#            produção total de bens de capital em relação à sua 
#            produção para FBCF 
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ==== Nome arquivo
# 'compat_scn_cnae':
path_compat_cods = file.path(dir_dados, "compat_scn_cnae.xlsx")

# ==== Ler e montar tabela compatibilidade códigos SCN e CNAE 
compat_cods = read_excel(path_compat_cods, sheet = "compat") 
#compat_cods %<>% filter(cod_scn != 8592 & cod_scn !=8692)
#compat_cods %<>% mutate(cods_cnae = as.list(cods_cnae))



