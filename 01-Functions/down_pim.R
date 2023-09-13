# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# FUNÇÃO: down_pim
# Descrição: Download das tabelas PIM-PF atuais
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

down_pim = function(cc=FALSE) {
  xarq = ifelse(cc, arq_pim_cc, arq_pim)
  xurl = ifelse(cc, url_pim_cc, url_pim)
  path = file.path(dir_dados, xarq)
  if(file.exists(path)) {
    if(redown_tru){ 
      download.file(xurl, path, mode = "wb")
      cat("Dowload do arquivo ", xarq, " da PIM-PF completo.", fill=T)
    } else cat("O arquivo",xarq,"atual já exite na pasta de download.",
               "Conforme a opção 'redown_tru', o download não será",
               "feito novamente.", fill=T)
  } else {
    download.file(xurl, path, mode = "wb")
    cat("Dowload do arquivo", xarq, "da PIM-PF completo.", fill=T)  
  }
  return(path)
}

