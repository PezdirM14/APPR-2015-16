# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv

         tabela_vozači_SLO<-read.csv2("vozaci.csv", skip=1,na.strings = "-", stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250", col.names = c("Vrsta prevoza","Leto in mesec", "Število potnikov"))
  
         tabela_registracije_SLO<-read.csv2("registracije.csv",na.strings = "-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names = c("Leto","2004", "2005","2006","2007","2008","2009","2010","2011","2012","2013","2014"))

         tabela_indeks_cen_mot_voz_SLO<-read.csv2("indeks_cen_mot_voz_SLO.csv",skip=1,na.strings="-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names = c("","Leto in mesec","Tekoči mesec na isti mesec prejšnjega leta"))
        
         tabela_prometne_nesrece_SLO<-tabela_prometne_nesrece_SLO<-read.csv2("prometne_nesrece_SLO.csv",na.strings="-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names =c("Leto","2004", "2005","2006","2007","2008","2009","2010","2011","2012","2013","2014"))

         tabela_dolzina_cest_SLO<-read.csv2("dolzina_cest_SLO.csv",na.strings="-",stringsAsFactors = FALSE,fileEncoding = "Windows-1250")
         
         tabela_Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni<-read.csv2("Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni.csv",
                                                                                  na.strings="-",stringsAsFactors = FALSE, fileEncoding = "Windows-1250")
         
         tabela_prve_reg_vrsta_vozila_SLO<-read.csv2("prve_reg_vrsta_vozila_SLO.csv",na.strings="-",stringsAsFactors = FALSE,
                                                     fileEncoding = "Windows-1250")
         
         tabela_vozila_na_gorivo<-read.csv2("vozila_na_gorivo.csv",na.strings="",stringsAsFactors = FALSE,
                                            fileEncoding = "Windows-1250")
          
         tabela_vozila_na_gorivo<-read.csv2("vozila_na_gorivo.csv",na.strings="-",stringsAsFactors = FALSE,
                                            fileEncoding = "windows-1250")
         
         tabela_starost_vozil_SLO<-read.csv2("starost_vozil_SLO.csv",na.strings="",stringsAsFactors = FALSE,
                                             fileEncoding = "windows-1250")
         
         
         
        
          


# Zapišimo podatke v razpredelnico druzine.

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.