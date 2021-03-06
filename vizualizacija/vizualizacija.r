# 3. faza: Izdelava zemljevida

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
#                             "OB/OB", encoding = "Windows-1250")

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
#druzine <- preuredi(druzine, zemljevid, "OB_UIME", c("Ankaran", "Mirna"))

# Izračunamo povprečno velikost družine.
#druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
#min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
#max.povprecje <- max(druzine$povprecje, na.rm=TRUE)




source("lib/uvozi.zemljevid.r", encoding = "UTF-8")
library(ggplot2)
library(dplyr)

pretvori.zemljevid <- function(zemljevid,pogoj=TRUE) {
  fo <- fortify(zemljevid[pogoj,])
  data <- zemljevid@data
  data$id <- as.character(0:(nrow(data)-1))
  return(inner_join(fo, data, by="id"))
}

svet<-uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                      "ne_110m_admin_0_countries")

izbrano_leto<-tabela_EU_registracije_avtomobili %>% filter(Leto == 2009)
m <- match(svet$name_sort, izbrano_leto$Drzava)
svet$izbrano_leto <- izbrano_leto$`Stevilo_registracij`[m]
svet$izbrano_leto<-round(svet$izbrano_leto/1000000,2)
evropa<-pretvori.zemljevid(svet, svet$continent=="Europe")

leto_2009<-ggplot()+geom_polygon(data=evropa, aes(x=long, y=lat, group= group,fill=izbrano_leto),
                      color= "grey") + xlim(-10,50) + ylim(34,72)+scale_fill_gradientn(colours=RColorBrewer::brewer.pal(n = 11, name = "Spectral"))+ ggtitle("Število novih registracij avtomobilov leta 2009 v Evropi, v milijonih")+ theme(legend.title=element_blank())



povezava_avtomobili_vozaci<-ggplot(tabela_EU_registracije_avtomobili,aes(x=Stevilo_registracij/1000000, y=vozaci/1000000)) +
                                          geom_point(na.rm = TRUE) + geom_smooth(method="lm", na.rm = TRUE)+xlab("Število registracij avtomobilov v mio")+ylab("Število vozačev v mio")+ggtitle("Povezava med številom registracij avtomobilov ter številom vozačev")


povezava_smrti_avtomobili<-ggplot(tabela_EU_registracije_avtomobili,aes(x=Stevilo_registracij/1000000, y=nesrece/1000000))+
                                          geom_point(na.rm = TRUE) + geom_smooth(method="lm",formula= y~x+I(x^2)+I(x^3)+I(x^4) , na.rm = TRUE)+ylab("Število nesreč v mio")+xlab("Število registracij avtomobilov v mio")+ggtitle("Povezava med številom registracij avtomobilov ter številom nesreč")

 















































# # 1. Slovenske občine
# 
# obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
#                           "OB/OB", encoding = "Windows-1250")
# obcine$povrsina <- obcine$POVRSINA / 1000000
# ob <- pretvori.zemljevid(obcine)
# 
# ## Zemljevid z barvami za površino
# zem <- ggplot() + geom_polygon(data = ob, aes(x=long, y=lat, group=group,
#                                               fill=povrsina),
#                                color = "grey") +
#   scale_fill_gradient(low="#3F7F3F", high="#00FF00") +
#   guides(fill = guide_colorbar(title = "Površina"))
# print(zem)
# 
#  ## Dodamo pike za mesta po tipu občine
# zem2 <- zem + geom_point(data = obcine@data, aes(x = Y_C, y = X_C, color = OB_TIP)) +
#   scale_color_manual(name="Tip", breaks = c("D", "N"),
#                      labels = c("Mestna občina", "Občina"),
#                      values = c("red", "blue"))
# print(zem2)
# 
# ## Dodamo imena glavnih mest mestnih občin
# zem3 <- zem2 + geom_text(data = obcine@data %>% filter(OB_TIP == "D"),
#                          aes(x = Y_C, y = X_C, label = OB_UIME),
#                          size = 3, vjust = 2)
# print(zem3)
# 
# # 2. Zvezne države ZDA
# 
# zda <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/states_21basic.zip", "states")
# capitals <- read.csv("podatki/uscapitals.csv")
# row.names(capitals) <- capitals$state
# capitals <- preuredi(capitals, zda, "STATE_NAME")
# capitals$US.capital <- capitals$capital == "Washington"
# 
# ## Dodamo podatke o predsedniških volitvah v zemljevid
# zda$vote.2012 <- capitals$vote.2012
# zda$electoral.votes <- capitals$electoral.votes
# usa <- pretvori.zemljevid(zda)
# 
# # Zemljevid elektorskih glasov
# map1 <- ggplot() + geom_polygon(data = usa, aes(x = long, y = lat, group = group,
#                                                 fill = electoral.votes))
# print(map1)
# 
# usa.cont <- usa %>% filter(! STATE_NAME %in% c("Alaska", "Hawaii"))
# capitals.cont <- capitals %>% filter(! state %in% c("Alaska", "Hawaii"))
# 
# map2 <- ggplot() + geom_polygon(data = usa.cont,
#                                 aes(x = long, y = lat,
#                                     group = group, fill = vote.2012)) +
#   scale_fill_manual(values = c("blue", "red")) +
#   guides(fill = guide_legend("Volitve 2012"))
# print(map2)
# 
# map3 <- map2 + geom_polygon(data = usa.cont, fill = "black",
#                             aes(x = long, y = lat, group = group,
#                                 alpha = electoral.votes)) +
#   scale_alpha(range = c(0.4, 0)) +
#   guides(alpha = guide_legend("Elektorski glasovi"))
# print(map3)
# 
# map4 <- map3 + geom_polygon(data = usa.cont, alpha = 0, color = "gray",
#                             aes(x = long, y = lat, group = group))
# print(map4)
# 
# map5 <- map4 + geom_point(data = capitals.cont, color = "green",
#                           aes(x = long, y = lat,
#                               shape = US.capital, size = US.capital)) +
#   geom_text(data = capitals.cont,
#             aes(x = long, y = lat, label = capital,
#                 vjust = US.capital, size = US.capital)) +
#   scale_shape_manual(values = c(20, 15), guide = FALSE) +
#   scale_size_manual(values = c(3, 5), guide = FALSE) +
#   discrete_scale(aesthetics = "vjust", scale_name = NULL,
#                  palette = . %>% c(0, 2), guide = FALSE)
# print(map5)
# 
# 
