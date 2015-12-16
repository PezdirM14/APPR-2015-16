# 2. faza: Uvoz podatkov


# Funkcija, ki uvozi podatke iz datoteke druzine.csv
#uvozi.druzine <- function() {
 # return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
  #                  row.names = 1,
   #                 col.names = c("obcina", "en", "dva", "tri", "stiri"),
    #                fileEncoding = "Windows-1250"))
#}

# Zapišimo podatke v razpredelnico druzine.
#druzine <- uvozi.druzine()

#obcine <- uvozi.obcine()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

# Funkcija, ki uvozi podatke iz datoteke druzine.csv

         tabela_vozači_SLO<-read.csv2("podatki/vozaci.csv", skip=1,na.strings = "-", stringsAsFactors = FALSE,
                                  fileEncoding = "UTF-8", col.names = c("Vrsta prevoza","Leto in mesec", "Število potnikov"))
  
         tabela_registracije_SLO<-read.csv2("podatki/registracije.csv",na.strings = "-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names = c("Leto","2004", "2005","2006","2007","2008","2009","2010","2011","2012","2013","2014"))

         tabela_indeks_cen_mot_voz_SLO<-read.csv2("podatki/indeks_cen_mot_voz_SLO.csv",skip=1,na.strings="-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names = c("","Leto in mesec","Tekoči mesec na isti mesec prejšnjega leta"))
        
         tabela_prometne_nesrece_SLO<-tabela_prometne_nesrece_SLO<-read.csv2("podatki/prometne_nesrece_SLO.csv",na.strings="-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names =c("Leto","2004", "2005","2006","2007","2008","2009","2010","2011","2012","2013","2014"))

         tabela_dolzina_cest_SLO<-read.csv2("podatki/dolzina_cest_SLO.csv",na.strings="-",stringsAsFactors = FALSE,fileEncoding = "Windows-1250")
         
         tabela_Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni_SLO<-read.csv2("podatki/Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni.csv",
                                                                                  na.strings="-",stringsAsFactors = FALSE, fileEncoding = "Windows-1250")
         
         tabela_prve_reg_vrsta_vozila_SLO_vsa<-read.csv2("podatki/prve_reg_vrsta_vozila_SLO.csv",na.strings="-",stringsAsFactors = FALSE,
                                                     fileEncoding = "Windows-1250")
         
         tabela_vozila_na_gorivo_SLO<-read.csv2("podatki/vozila_na_gorivo.csv",na.strings="",stringsAsFactors = FALSE,
                                            fileEncoding = "Windows-1250")
         
         tabela_starost_vozil_SLO<-read.csv2("podatki/starost_vozil_SLO.csv",na.strings="",stringsAsFactors = FALSE,
                                             fileEncoding = "windows-1250")
         
         tabela_EU_registracije_avtomobili<-read.csv2("podatki/EU_registracije.csv",na.strings=":",stringsAsFactors = FALSE, 
                                           fileEncoding = "windows-1250")
         
         tabela_EU_registracije_ostalo<-read.csv2("podatki/EU_registracije_ostalo.csv",na.strings=":",stringsAsFactors = FALSE, 
                                                      fileEncoding = "windows-1250")
         
         tabela_EU_prevozeni_km<-read.csv2("podatki/EU_prevozeni_km.csv",na.strings=":",stringsAsFactors = FALSE, 
                                                  fileEncoding = "windows-1250")
        
         tabela_EU_vozaci<-read.csv2("podatki/EU_vozaci.csv",na.strings=":",stringsAsFactors = FALSE, 
                                           fileEncoding = "windows-1250")
           
         tabela_EU_stevilo_umrlih_prometne_nesrece<-read.csv2("podatki/EU_stevilo_umrlih_prometne_nesrece.csv",na.strings=":",stringsAsFactors = FALSE, 
                                                              fileEncoding = "windows-1250")

 #html
         require(dplyr)
         require(rvest)
         require(gsubfn)
         
         url<-'http://left-lane.com/european-car-sales-data/audi/'
         
         stran <- html_session(url) %>% read_html(encoding = "Windows-1250")
         Audi_prodaja<- stran %>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Audi_prodaja<-Audi_prodaja[-1,]
         
         url2<-'http://left-lane.com/european-car-sales-data/bmw/'
         stran2<-html_session(url2) %>% read_html(encoding = "Windows-1250")
         Bmw_prodaja<-stran2%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Bmw_prodaja<-Bmw_prodaja[-1,]
# Zapišimo podatke v razpredelnico druzine.

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.