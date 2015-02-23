
pat <- "nes4x([1-4])s([1-2])rpop([[:digit:]]{4})"

wb_secteur <- loadWorkbook("~/Documents/csp_vote/data/pop-act2554-empl-sa-sexe-cd-6811.xls") 

rp_secteur_1982 <- readWorksheet(wb_secteur, sheet = "COM_1982", startRow = 16)  %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>%
  mutate(code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = secteur_sexe, value =  n, nes4x1s1rpop1982:nes4x4s2rpop1982) %>%
  mutate(
    secteur = sub(pattern = pat, replacement = "\\1", x = secteur_sexe), 
    sexe = sub(pattern = pat, replacement = "\\2", x = secteur_sexe), 
    annee = sub(pattern = pat, replacement = "\\3", x = secteur_sexe)   
  ) 

rp_secteur_1990 <- readWorksheet(wb_secteur, sheet = "COM_1990", startRow = 16)  %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>%
  mutate(code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = secteur_sexe, value =  n, nes4x1s1rpop1990:nes4x4s2rpop1990) %>%
  mutate(
    secteur = sub(pattern = pat, replacement = "\\1", x = secteur_sexe), 
    sexe = sub(pattern = pat, replacement = "\\2", x = secteur_sexe), 
    annee = sub(pattern = pat, replacement = "\\3", x = secteur_sexe)   
  ) 


rp_secteur_1999 <- readWorksheet(wb_secteur, sheet = "COM_1999", startRow = 16)  %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>%
  mutate(code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = secteur_sexe, value =  n, nes4x1s1rpop1999:nes4x4s2rpop1999) %>%
  mutate(
    secteur = sub(pattern = pat, replacement = "\\1", x = secteur_sexe), 
    sexe = sub(pattern = pat, replacement = "\\2", x = secteur_sexe), 
    annee = sub(pattern = pat, replacement = "\\3", x = secteur_sexe)   
  ) 


rp_secteur_2006 <- readWorksheet(wb_secteur, sheet = "COM_2006", startRow = 16)  %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>%
  mutate(code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = secteur_sexe, value =  n, nes4x1s1rpop2006:nes4x4s2rpop2006) %>%
  mutate(
    secteur = sub(pattern = pat, replacement = "\\1", x = secteur_sexe), 
    sexe = sub(pattern = pat, replacement = "\\2", x = secteur_sexe), 
    annee = sub(pattern = pat, replacement = "\\3", x = secteur_sexe)   
  ) 


rp_secteur_2011 <- readWorksheet(wb_secteur, sheet = "COM_2011", startRow = 16)  %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>%
  mutate(code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = secteur_sexe, value =  n, nes4x1s1rpop2011:nes4x4s2rpop2011) %>%
  mutate(
    secteur = sub(pattern = pat, replacement = "\\1", x = secteur_sexe), 
    sexe = sub(pattern = pat, replacement = "\\2", x = secteur_sexe), 
    annee = sub(pattern = pat, replacement = "\\3", x = secteur_sexe)   
  ) 


rp_secteur <- rbind(rp_secteur_1982, rp_secteur_1990, rp_secteur_1999, rp_secteur_2006, rp_secteur_2011)

rp_secteur2 <- rp_secteur %>% 
  group_by(annee, code_insee, secteur) %>% 
  summarise(n = sum(n, na.m = TRUE))

rp_secteur3 <- rp_secteur2 %>% 
  group_by(annee, code_insee) %>% 
  mutate(share = n / sum(n, na.rm = TRUE))


rp_secteur4 <- rp_secteur3 %>% 
  select(-n) %>% 
  spread(key = secteur, value = share) 
names(rp_secteur4) <- sub(pattern = "([1-4])", replacement = "sh\\1", x = names(rp_secteur4))

 rp_secteur5 <- reshape(data = data.frame(rp_secteur4), direction = "wide", idvar = "code_insee", timevar = "annee")

write.table(rp_secteur4, file = "data/rp_secteur4.csv", row.names = FALSE, sep = ",", dec = ".")

write.table(rp_secteur5, file = "data/rp_secteur5.csv", row.names = FALSE, sep = ",", dec = ".")
