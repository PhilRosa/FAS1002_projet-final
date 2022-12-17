URL <- "https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv"

base_path <- path("data", "raw")

fname <- paste(today(),"owid-co2-data.csv" ,sep= "_")

fpath<- path(base_path,
             fname)
destfile <- './owid-co2-data.csv'
if (!file.exists(destfile))
    
    download.file(url = URL,
                  destfile = fpath)
?download.file
dat<-  read.csv(fpath)


# Les packages

library(fs)
library(lubridate)
library(tidyverse)
library(countrycode)
library(skimr)
library(ggthemes)
library(arsenal)
library(vtable)
library(patchwork)
library(rstatix)

#Les datas
dat <- dat |> mutate( gdp_per_capita = gdp / population)

# Création d'une nouvelle variable pour le continent

dat$continent <- countrycode(sourcevar = dat[, "country"],
                             origin = "country.name",
                             destination = "continent")

### Traduction des continents en français
dat <- dat |>  mutate(continent =
                          recode(continent,
                                 "Americas" = "Amérique",
                                 "Asia"="Asie",
                                 "Oceania"="Océanie",
                                 "Africa"="Afrique"))
#Création data set de 2015, 1995, 1975 et 1955

dat_2015 <- dat |> filter(year==2015)
dat_2015 <- dat_2015 |> drop_na(continent)
dat_1975 <- dat |> filter(year==1975)
dat_1975 <- dat_1975 |> drop_na(continent)
dat_1995 <- dat |> filter(year==1995)
dat_1995 <- dat_1995 |> drop_na(continent)
dat_1955 <- dat |> filter(year==1955)
dat_1955 <- dat_1955 |> drop_na(continent)

summary(dat_2015$population)
summary(dat_2015$gdp)



#Création d'une base de données avec seulement les continents comme données

target <- c("Asia","Africa", "North America", "South America", "Europe", "Oceania")
dat_continent <- filter(dat, country %in% target)
unique(dat_continent$country)

# Traduction des continents 
dat_continent <- dat_continent |>  mutate(country =
                                              recode(country,
                                                     "Americas" = "Amérique",
                                                     "Asia"="Asie",
                                                     "Oceania"="Océanie",
                                                     "Africa"="Afrique",
                                                     "North America" = "Amérique du Nord",
                                                     "South America"="Amérique du Sud"))
