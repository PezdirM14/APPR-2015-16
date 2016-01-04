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

#Podatki za Slovenijo

         tabela_vozači_SLO<-read.csv2("podatki/vozaci.csv", skip=1,na.strings = "-", stringsAsFactors = FALSE,
                                  fileEncoding = "UTF-8", col.names = c("Vrsta prevoza","Leto in mesec", "Število potnikov"))
  
         tabela_registracije_SLO<-read.csv2("podatki/registracije.csv",na.strings = "-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names = c("Leto","2004", "2005","2006","2007","2008","2009","2010","2011","2012","2013","2014"))
         names(tabela_registracije_SLO)<-gsub("X","",names(tabela_registracije_SLO))
         tabela_registracije_SLO<-melt(tabela_registracije_SLO, na.rm=FALSE,"Leto")
         names(tabela_registracije_SLO)<-c("","Leto","Stevilo")
         
         
         tabela_indeks_cen_mot_voz_SLO<-read.csv2("podatki/indeks_cen_mot_voz_SLO.csv",skip=1,na.strings="-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250",col.names = c("","Leto in mesec","Tekoči mesec na isti mesec prejšnjega leta"))
        
         tabela_prometne_nesrece_SLO<-tabela_prometne_nesrece_SLO<-read.csv2("podatki/prometne_nesrece_SLO.csv",na.strings="-",stringsAsFactors = FALSE,
                                  fileEncoding = "Windows-1250")
         names(tabela_prometne_nesrece_SLO)<-gsub("X","",names(tabela_prometne_nesrece_SLO))
         tabela_prometne_nesrece_SLO<-melt(tabela_prometne_nesrece_SLO, na.rm=FALSE,"")
         names(tabela_prometne_nesrece_SLO)<-c("","Leto","Kolicina")
         
         
        
         tabela_dolzina_cest_SLO<-read.csv2("podatki/dolzina_cest_SLO.csv",na.strings="-",stringsAsFactors = FALSE,fileEncoding = "Windows-1250")
         
         
         tabela_Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni_SLO<-read.csv2("podatki/Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni.csv",
                                                                                  na.strings="-",stringsAsFactors = FALSE, fileEncoding = "Windows-1250",
                                                                                  col.names=c("Leto","Potniki v 1000","Potniški kilometri v mio"))
         
         tabela_prve_reg_vrsta_vozila_SLO_vsa<-read.csv2("podatki/prve_reg_vrsta_vozila_SLO.csv",na.strings="-",stringsAsFactors = FALSE,
                                                     fileEncoding = "Windows-1250")
         
         tabela_vozila_na_gorivo_SLO<-read.csv2("podatki/vozila_na_gorivo.csv",na.strings="",stringsAsFactors = FALSE,
                                            fileEncoding = "Windows-1250")
         names(tabela_vozila_na_gorivo_SLO)<-gsub("X","",names(tabela_vozila_na_gorivo_SLO))
         tabela_vozila_na_gorivo_SLO<-melt(tabela_vozila_na_gorivo_SLO, na.rm=FALSE,c("",".1",".2"))
         names(tabela_vozila_na_gorivo_SLO)<-c("Tip vozila","Gorivo","Dan","Leto","Kolicina")
         
         
         
         tabela_starost_vozil_SLO<-read.csv2("podatki/starost_vozil_SLO.csv",na.strings="",stringsAsFactors = FALSE,
                                             fileEncoding = "windows-1250")
         names(tabela_starost_vozil_SLO)<-gsub("X","",names(tabela_starost_vozil_SLO))
         tabela_starost_vozil_SLO<-melt(tabela_starost_vozil_SLO, na.rm=FALSE,c("",".1"))
         names(tabela_starost_vozil_SLO)<-c("Tip vozila","Starost","Leto","Kolicina")
         
#Podatki za Eu
         
         tabela_EU_registracije_avtomobili<-read.csv2("podatki/EU_registracije.csv",na.strings=":",stringsAsFactors = FALSE, 
                                           fileEncoding = "windows-1250")
         
         
         names(tabela_EU_registracije_avtomobili)<-gsub("X","",names(tabela_EU_registracije_avtomobili))
         tabela_EU_registracije_avtomobili<-melt(tabela_EU_registracije_avtomobili, na.rm=FALSE,"GEO.TIME")
         names(tabela_EU_registracije_avtomobili)<-c("Drzava","Leto","Stevilo registracij")
         
         
         tabela_EU_registracije_ostalo<-read.csv2("podatki/EU_registracije_ostalo.csv",na.strings=":",stringsAsFactors = FALSE, 
                                                      fileEncoding = "windows-1250")
         names(tabela_EU_registracije_ostalo)<-gsub("X","",names(tabela_EU_registracije_ostalo))
         tabela_EU_registracije_ostalo<-melt(tabela_EU_registracije_ostalo, na.rm=FALSE,"GEO.TIME")
         names(tabela_EU_registracije_ostalo)<-c("Drzava","Leto","Registracije ostalih vozil")
        
         
         tabela_EU_prevozeni_km<-read.csv2("podatki/EU_prevozeni_km.csv",na.strings=":",stringsAsFactors = FALSE, 
                                                  fileEncoding = "windows-1250")
         names(tabela_EU_prevozeni_km)<-gsub("X","",names(tabela_EU_prevozeni_km))
         tabela_EU_prevozeni_km<-melt(tabela_EU_prevozeni_km, na.rm=FALSE,"GEO.TIME")
         names(tabela_EU_prevozeni_km)<-c("Drzava","Leto","Prevozeni km")
         
         
         
         tabela_EU_vozaci<-read.csv2("podatki/EU_vozaci.csv",na.strings=":",stringsAsFactors = FALSE, 
                                           fileEncoding = "windows-1250")
         names(tabela_EU_vozaci)<-gsub("X","",names(tabela_EU_vozaci))
         tabela_EU_vozaci<-melt(tabela_EU_vozaci, na.rm=FALSE,"GEO.TIME")
         names(tabela_EU_vozaci)<-c("Drzava","Leto","Stevilo vozacev")
         tabela_EU_vozaci<-tabela_EU_vozaci[ !tabela_EU_vozaci$Drzava %in% c(""),]
         
           
         tabela_EU_stevilo_umrlih_prometne_nesrece<-read.csv2("podatki/EU_stevilo_umrlih_prometne_nesrece.csv",na.strings=":",stringsAsFactors = FALSE, 
                                                              fileEncoding = "windows-1250")
         names(tabela_EU_stevilo_umrlih_prometne_nesrece)<-gsub("X","",names(tabela_EU_stevilo_umrlih_prometne_nesrece))
         tabela_EU_stevilo_umrlih_prometne_nesrece<-melt(tabela_EU_stevilo_umrlih_prometne_nesrece, na.rm=FALSE,"geo.time")
         names(tabela_EU_stevilo_umrlih_prometne_nesrece)<-c("Drzava","Leto","Stevilo umrlih")
         tabela_EU_stevilo_umrlih_prometne_nesrece<-tabela_EU_stevilo_umrlih_prometne_nesrece[ !tabela_EU_stevilo_umrlih_prometne_nesrece$Drzava %in% c(""),]
         
         
         Leto<-tabela_Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni_SLO$Leto
         Število.v.tisočih<-tabela_Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni_SLO$Potniki.v.1000
         
         Vozaci<-ggplot(tabela_Cestni_javni_linijski_prevoz_medkrajevni_in_mednarodni_SLO)+
           aes(x=Leto,y=Število.v.tisočih)+
           geom_line(colour="red")+
           ggtitle("Vozači v javnem linijskem prevozu(medkrajevni in mednarodni) ")+
           theme(plot.title = element_text(lineheight=.8, face="bold"))
         

         
         
         
         
         
 #html

         
         url<-'http://left-lane.com/european-car-sales-data/audi/'
         
         stran <- html_session(url) %>% read_html(encoding = "Windows-1250")
         Audi_prodaja<- stran %>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Audi_prodaja<-Audi_prodaja[-1,]
         names(Audi_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Audi_prodaja$Mesec <- factor(Audi_prodaja$Mesec, levels =Audi_prodaja$Mesec,
                                       Audi_prodaja$Mesec, ordered = TRUE)
         Audi_prodaja[-1] <- apply(Audi_prodaja[-1], 2, as.numeric)
         Audi_prodaja$Povprečno <- apply(Audi_prodaja[-1], 1, mean, na.rm = TRUE)
         Audi_prodaja$Povprečno<-round(Audi_prodaja$Povprečno,3)
         Audi_prodaja$Proizvajalec <- "Audi"

         
         url2<-'http://left-lane.com/european-car-sales-data/bmw/'
         stran2<-html_session(url2) %>% read_html(encoding = "Windows-1250")
         
         Bmw_prodaja<-stran2%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         names(Bmw_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Bmw_prodaja<-Bmw_prodaja[-1,]
         Bmw_prodaja$Mesec <- factor(Bmw_prodaja$Mesec, levels =
                                        Bmw_prodaja$Mesec, ordered = TRUE)
         Bmw_prodaja[-1] <- apply(Bmw_prodaja[-1], 2, as.numeric)
         Bmw_prodaja$Povprečno <- apply(Bmw_prodaja[-1], 1, mean, na.rm = TRUE)
         Bmw_prodaja$Povprečno<-round(Bmw_prodaja$Povprečno,3)
         Bmw_prodaja$Proizvajalec <- "Bmw"
         
         url3<-'http://left-lane.com/european-car-sales-data/citroen/'
         stran3<-html_session(url3) %>% read_html(encoding = "Windows-1250")
         Citroen_prodaja<-stran3%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Citroen_prodaja<-Citroen_prodaja[-1,]
         names(Citroen_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Citroen_prodaja$Povprečno<-round((as.numeric(Citroen_prodaja$`2012`)+as.numeric(Citroen_prodaja$`2013`)+as.numeric(Citroen_prodaja$`2014`)+as.numeric(Citroen_prodaja$`2015`))/4,3)
         Citroen_prodaja$Mesec <- factor(Citroen_prodaja$Mesec, levels =
                                       Citroen_prodaja$Mesec, ordered = TRUE)
         Citroen_prodaja[-1] <- apply(Citroen_prodaja[-1], 2, as.numeric)
         Citroen_prodaja$Povprečno <- apply(Citroen_prodaja[-1], 1, mean, na.rm = TRUE)
         Citroen_prodaja$Povprečno<-round(Citroen_prodaja$Povprečno,3)
         Citroen_prodaja$Proizvajalec <- "Citroen"
         
         url4<-'http://left-lane.com/european-car-sales-data/ford/'
         stran4<-html_session(url4) %>% read_html(encoding = "Windows-1250")
         Ford_prodaja<-stran4%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Ford_prodaja<-Ford_prodaja[-1,]
         names(Ford_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Ford_prodaja$Povprečno<-round((as.numeric(Ford_prodaja$`2012`)+as.numeric(Ford_prodaja$`2013`)+as.numeric(Ford_prodaja$`2014`)+as.numeric(Ford_prodaja$`2015`))/4,3)
         Ford_prodaja$Mesec <- factor(Ford_prodaja$Mesec, levels =
                                       Ford_prodaja$Mesec, ordered = TRUE)
         Ford_prodaja[-1] <- apply(Ford_prodaja[-1], 2, as.numeric)
         Ford_prodaja$Povprečno <- apply(Ford_prodaja[-1], 1, mean, na.rm = TRUE)
         Ford_prodaja$Povprečno<-round(Ford_prodaja$Povprečno,3)
         Ford_prodaja$Proizvajalec <- "Ford"
         
         url5<-'http://left-lane.com/european-car-sales-data/fiat/'
         stran5<-html_session(url5) %>% read_html(encoding = "Windows-1250")
         Fiat_prodaja<-stran5%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Fiat_prodaja<-Fiat_prodaja[-1,]
         names(Fiat_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Fiat_prodaja$Povprečno<-round((as.numeric(Fiat_prodaja$`2012`)+as.numeric(Fiat_prodaja$`2013`)+as.numeric(Fiat_prodaja$`2014`)+as.numeric(Fiat_prodaja$`2015`))/4,3)
         Fiat_prodaja$Mesec <- factor(Fiat_prodaja$Mesec, levels =
                                       Fiat_prodaja$Mesec, ordered = TRUE)
         Fiat_prodaja[-1] <- apply(Fiat_prodaja[-1], 2, as.numeric)
         Fiat_prodaja$Povprečno <- apply(Fiat_prodaja[-1], 1, mean, na.rm = TRUE)
         Fiat_prodaja$Povprečno<-round(Fiat_prodaja$Povprečno,3)
         Fiat_prodaja$Proizvajalec <- "Fiat"
         
         url6<-'http://left-lane.com/european-car-sales-data/mazda/'
         stran6<-html_session(url6) %>% read_html(encoding = "Windows-1250")
         Mazda_prodaja<-stran6%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Mazda_prodaja<-Mazda_prodaja[-1,]
         names(Mazda_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Mazda_prodaja$Povprečno<-round((as.numeric(Mazda_prodaja$`2012`)+as.numeric(Mazda_prodaja$`2013`)+as.numeric(Mazda_prodaja$`2014`)+as.numeric(Mazda_prodaja$`2015`))/4,3)
         Mazda_prodaja$Mesec <- factor(Mazda_prodaja$Mesec, levels =
                                       Mazda_prodaja$Mesec, ordered = TRUE)
         Mazda_prodaja[-1] <- apply(Mazda_prodaja[-1], 2, as.numeric)
         Mazda_prodaja$Povprečno <- apply(Mazda_prodaja[-1], 1, mean, na.rm = TRUE)
         Mazda_prodaja$Povprečno<-round(Mazda_prodaja$Povprečno,3)
         Mazda_prodaja$Proizvajalec <- "Mazda"
         
         url7<-'http://left-lane.com/european-car-sales-data/peugeot/'
         stran7<-html_session(url7) %>% read_html(encoding = "Windows-1250")
         Peugeot_prodaja<-stran7%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Peugeot_prodaja<-Peugeot_prodaja[-1,]
         names(Peugeot_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Peugeot_prodaja$Povprečno<-round((as.numeric(Peugeot_prodaja$`2012`)+as.numeric(Peugeot_prodaja$`2013`)+as.numeric(Peugeot_prodaja$`2014`)+as.numeric(Peugeot_prodaja$`2015`))/4,3)
         Peugeot_prodaja$Mesec <- factor(Peugeot_prodaja$Mesec, levels =
                                       Peugeot_prodaja$Mesec, ordered = TRUE)
         Peugeot_prodaja[-1] <- apply(Peugeot_prodaja[-1], 2, as.numeric)
         Peugeot_prodaja$Povprečno <- apply(Peugeot_prodaja[-1], 1, mean, na.rm = TRUE)
         Peugeot_prodaja$Povprečno<-round(Peugeot_prodaja$Povprečno,3)
         Peugeot_prodaja$Proizvajalec <- "Peugeot"
         
         url8<-'http://left-lane.com/european-car-sales-data/renault/'
         stran8<-html_session(url8) %>% read_html(encoding = "Windows-1250")
         Renault_prodaja<-stran8%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Renault_prodaja<-Renault_prodaja[-1,]
         names(Renault_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Renault_prodaja$Povprečno<-round((as.numeric(Renault_prodaja$`2012`)+as.numeric(Renault_prodaja$`2013`)+as.numeric(Renault_prodaja$`2014`)+as.numeric(Renault_prodaja$`2015`))/4,3)
         Renault_prodaja$Mesec <- factor(Renault_prodaja$Mesec, levels =
                                       Renault_prodaja$Mesec, ordered = TRUE)
         Renault_prodaja[-1] <- apply(Renault_prodaja[-1], 2, as.numeric)
         Renault_prodaja$Povprečno <- apply(Renault_prodaja[-1], 1, mean, na.rm = TRUE)
         Renault_prodaja$Povprečno<-round(Renault_prodaja$Povprečno,3)
         Renault_prodaja$Proizvajalec <- "Renault"
         
         url9<-'http://left-lane.com/european-car-sales-data/opel-vauxhall/'
         stran9<-html_session(url9) %>% read_html(encoding = "Windows-1250")
         Opel_prodaja<-stran9%>% html_nodes(xpath ="//table") %>% .[[1]]%>% html_table(fill=TRUE)
         Opel_prodaja<-Opel_prodaja[-1,]
         names(Opel_prodaja)<-c("Mesec","2012","2013","2014","2015")
         Opel_prodaja$Povprečno<-round((as.numeric(Opel_prodaja$`2012`)+as.numeric(Opel_prodaja$`2013`)+as.numeric(Opel_prodaja$`2014`)+as.numeric(Opel_prodaja$`2015`))/4,3)
         Opel_prodaja$Mesec <- factor(Opel_prodaja$Mesec, levels =
                                       Opel_prodaja$Mesec, ordered = TRUE)
         Opel_prodaja[-1] <- apply(Opel_prodaja[-1], 2, as.numeric)
         Opel_prodaja$Povprečno <- apply(Opel_prodaja[-1], 1, mean, na.rm = TRUE)
         Opel_prodaja$Povprečno<-round(Opel_prodaja$Povprečno,3)
         Opel_prodaja$Proizvajalec <- "Opel"
         

         graf_Mazda<-ggplot(Mazda_prodaja, aes(x=Mesec, y=Povprečno, group=1)) + geom_line(colour="red")+
                               ggtitle("Povprečna prodaja avtomobilov\nznamke Mazda(2012-2015) v tisočih po mesecih")+
                               theme(plot.title = element_text(lineheight=.8, face="bold"),axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) 
  
         
         graf_Ford<-ggplot(Ford_prodaja, aes(x=Mesec, y=Povprečno, group=1)) + geom_line(colour="blue")+
                               ggtitle("Povprečna prodaja avtomobilov\nznamke Ford(2012-2015) v tisočih po mesecih")+
                               theme(plot.title = element_text(lineheight=.8, face="bold"),axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
        
         Prodaja <- rbind(Audi_prodaja, Bmw_prodaja,Citroen_prodaja,Ford_prodaja,Fiat_prodaja,Mazda_prodaja,Peugeot_prodaja,Renault_prodaja,Opel_prodaja) 
         skupni_graf<-ggplot(Prodaja, aes(x=Mesec, y=Povprečno, group=Proizvajalec, color =
                               Proizvajalec)) + geom_line() +
                               ggtitle("Povprečna prodaja avtomobilov po\nznamkah(2012-2015) v Europi po mesecih v tisočih")+
                               theme(plot.title = element_text(lineheight=.8, face="bold"),axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
         
         Prodaja<-melt(Prodaja,c("Mesec","Povprečno","Proizvajalec"))
         names(Prodaja)<-c("Mesec","Povprečno","Proizvajalec","Leto","Kolicina prodanih vozil")
         
         
         