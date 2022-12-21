# Les packages
library(readxl)
library(fs)
library(lubridate)
library(tidyverse)
library(countrycode)
library(skimr)
library(ggplot2)
library(ggthemes)
library(arsenal)
library(vtable)
library(patchwork)
library(rstatix)
theme <- theme_light()


base_path <- path("data", "raw")

URL <- "https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv"
fname <- paste(today(),"owid-co2-data.csv" ,sep= "_")
fpath<- path(base_path,
             fname)

destfile <- './owid-co2-data.csv'


# download data/delete quotidien
list.files(path = "data/raw/", pattern = "csv",full.names = T)
if(!file.exists(fname))print(fname) else(file.remove('./owid-co2-data.csv'))+ download.file(url = URL,
                                                                                            destfile = fpath)

fnamex <- paste(today(), "_GM-Life Expectancy- Dataset - v12.xlsx", sep= "_")
fpathx <- path(base_path, fnamex)
destfilex <- './_GM-Life Expectancy- Dataset - v12.xlsx'
URL_excel <- "https://docs.google.com/spreadsheets/d/1RheSon1-q4vFc3AGyupVPH6ptEByE-VtnjOCselU0PE/export?format=xlsx"

#download data/delete quotidien mensuel
list.files(path = "data/raw/", pattern = "xlsx",full.names = T)
if(!file.exists(fnamex))print(fnamex) else(file.remove('./_GM-Life Expectancy- Dataset - v12.xlsx'))+ download.file(url = URL_excel,
                                                                                                                    destfilex = fpathx,mode="wb")


dat<- read.csv(fpath)

dat_exp1 <-  read_excel(fpathx, sheet = 4)

#Les datas
dat <- dat |> mutate( gdp_per_capita = gdp / population)

# Création d'une nouvelle variable pour le continent

dat$continent <- countrycode(sourcevar = dat[, "country"],
                             origin = "country.name",
                             destination = "continent")


dat_exp1$continent <- countrycode(sourcevar = dat_exp1[["name"]],
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


base_path2 <- (file.path("data", "processed"))

write.csv(dat_1955, "data/processed/dat_1955.csv")
write.csv(dat_1975, "data/processed/dat_1975.csv")
write.csv(dat_1995, "data/processed/dat_1995.csv")
write.csv(dat_2015, "data/processed/dat_2015.csv")
write.csv(dat_continent, "data/processed/dat_continent.csv")
write.csv(dat_exp1, "data/processed/dat_exp1.csv")


.libPaths("D:\\R-4.2.1\\library")
