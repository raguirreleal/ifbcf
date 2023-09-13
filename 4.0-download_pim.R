# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script: 4.0-download_pim.R
# Descrição: Web scraping das tabelas PIM-PF atuais
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== Agregado e variável da PIM-PF:
agre_pim    =  8885  # Prod Física Indust, por grupos, classes ind selec
agre_pim_cc =  8886  # Prod Física Indust, construção civil
var_pim     = 12606  # Número-índice (2022=100)

# ==== Período da PIM-PF:
# "201001-202112" [inicio-fim, no formato aaaamm]
# "200801-200912|201001-202112" [dois subperíodos]
# "-6" [últimos 6 meses]
# "all" [todos os períodos]
per_pim = "201101-202112"

# ==== Nomes para os arquivos
arq_pim    = "pim.xlsx"
arq_pim_cc = "pim_cc.xlsx"

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== URLs do IBGE:
# URL download SIDRA/IBGE
url_sidra = "https://sidra.ibge.gov.br/geratabela?format=xlsx&name="

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== URLs PIM-PF
url_pim = paste0(url_sidra, arq_pim, "&terr=N&rank=-&query=t/",
                 agre_pim, "/n1/all/v/",
                 var_pim, "/p/", 
                 per_pim, "/c542/all/d/v12606%205/l/v%2Bt,c542,p")
url_pim_cc = paste0(url_sidra, arq_pim_cc, "&terr=N&rank=-&query=t/",
                    agre_pim_cc, "/n1/all/v/",
                    var_pim, "/p/", 
                    per_pim, "/d/v12606%205/l/v%2Bt,,p") 

# ==== Download dos arquivos 
# Na pasta 'dir_dados'

path_pim    = down_pim()
path_pim_cc = down_pim(cc=TRUE)

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== Ler e montar tabela PIM
pim = read_excel(path_pim, sheet = "Tabela") %>% 
  suppressMessages() %>% suppressWarnings()
classes = pim[4,-1] %>% as.vector(mode = "character")
classes %<>% substr(1, regexpr(" ", .))
names(pim) = c("mes", classes)
pim %<>% .[-c(1:4, nrow(.)),]
pim %<>% mutate(mes = as.yearmon(mes)) %>% mutate(mes = as.Date(mes)) 
pim %<>% mutate_if(is.character, as.numeric) %>% suppressWarnings()
pim[is.na(pim)]=0

# ==== Ler e montar tabela PIM CC
pim_cc = read_excel(path_pim_cc, sheet = "Tabela") %>% 
  suppressMessages() %>% suppressWarnings()
names(pim_cc) = c("mes", "i_cc")
pim_cc %<>% .[-c(1:3, nrow(.)),]
pim_cc %<>% mutate(mes = as.yearmon(mes)) %>% mutate(mes = as.Date(mes)) 
pim_cc %<>% mutate_if(is.character, as.numeric) %>% suppressWarnings()
pim_cc[is.na(pim_cc)]=0


