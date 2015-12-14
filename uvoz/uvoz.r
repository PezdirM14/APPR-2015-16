# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozi.podatke <- function() {
  return(tabela_vozači<-read.csv2("vozaci.csv", skip=1,na.strings = "-", stringsAsFactors = FALSE,
                                  fileEncoding = "UTF-8", col.names = c("Vrsta prevoza","Leto in mesec", "Število potnikov")))
}

# Zapišimo podatke v razpredelnico druzine.

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.