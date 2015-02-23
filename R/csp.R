str(csp1982)
patrick <- "csx_rec([[:digit:]])taxtypac_rec([[:digit:]])rpop([[:digit:]]{4})"  

csp1982 <- read.csv("data/pop-act2554-csp-cd-6811_1982.csv", skip = 43, stringsAsFactors = FALSE) %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>% 
  mutate(CR = str_pad(string = CR, width = 3, side = "left", pad = "0"), 
         code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = csp_cho, value =  n, csx_rec1taxtypac_rec1rpop1982:csx_rec6taxtypac_rec2rpop1982) %>%
  mutate(
    csp = sub(pattern = patrick, replacement = "\\1", x = csp_cho), 
    emploi = sub(pattern = patrick, replacement = "\\2", x = csp_cho), 
    annee = sub(pattern = patrick, replacement = "\\3", x = csp_cho)   
  ) 

csp1990 <- read.csv("data/pop-act2554-csp-cd-6811_1990.csv", skip = 43, stringsAsFactors = FALSE) %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>% 
  mutate(CR = str_pad(string = CR, width = 3, side = "left", pad = "0"), 
         code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = csp_cho, value =  n, csx_rec1taxtypac_rec1rpop1990:csx_rec6taxtypac_rec2rpop1990) %>%
  mutate(
    csp = sub(pattern = patrick, replacement = "\\1", x = csp_cho), 
    emploi = sub(pattern = patrick, replacement = "\\2", x = csp_cho), 
    annee = sub(pattern = patrick, replacement = "\\3", x = csp_cho)   
  ) 

csp1999 <- read.csv("data/pop-act2554-csp-cd-6811_1999.csv", skip = 43, stringsAsFactors = FALSE) %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>% 
  mutate(CR = str_pad(string = CR, width = 3, side = "left", pad = "0"), 
         code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = csp_cho, value =  n, csx_rec1taxtypac_rec1rpop1999:csx_rec6taxtypac_rec2rpop1999) %>%
  mutate(
    csp = sub(pattern = patrick, replacement = "\\1", x = csp_cho), 
    emploi = sub(pattern = patrick, replacement = "\\2", x = csp_cho), 
    annee = sub(pattern = patrick, replacement = "\\3", x = csp_cho)   
  ) 


csp2006 <- read.csv("data/pop-act2554-csp-cd-6811_2006.csv", skip = 43, stringsAsFactors = FALSE) %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>% 
  mutate(CR = str_pad(string = CR, width = 3, side = "left", pad = "0"), 
         code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = csp_cho, value =  n, csx_rec1taxtypac_rec1rpop2006:csx_rec6taxtypac_rec2rpop2006) %>%
  mutate(
    csp = sub(pattern = patrick, replacement = "\\1", x = csp_cho), 
    emploi = sub(pattern = patrick, replacement = "\\2", x = csp_cho), 
    annee = sub(pattern = patrick, replacement = "\\3", x = csp_cho)   
  ) 



csp2011 <- read.csv("data/pop-act2554-csp-cd-6811_2011.csv", skip = 43, stringsAsFactors = FALSE) %>% 
  select(-RR,-STABLE,-DR13,-LIBELLE) %>% 
  mutate(CR = str_pad(string = CR, width = 3, side = "left", pad = "0"), 
         code_insee = paste0(DR,CR)) %>% 
  select(-DR, -CR) %>%
  gather(key = csp_cho, value =  n, csx_rec1taxtypac_rec1rpop2011:csx_rec6taxtypac_rec2rpop2011) %>%
  mutate(
    csp = sub(pattern = patrick, replacement = "\\1", x = csp_cho), 
    emploi = sub(pattern = patrick, replacement = "\\2", x = csp_cho), 
    annee = sub(pattern = patrick, replacement = "\\3", x = csp_cho)   
  ) 

csp <- rbind(csp1982, csp1990, csp1999, csp2006, csp2011)

csp$n <- as.numeric(csp$n)

csp2 <- csp %>% 
  group_by(annee, code_insee, csp) %>% 
  summarise(n = sum(n, na.rm = TRUE))

csp3 <- csp2 %>% 
  group_by(annee, code_insee) %>% 
  mutate(share = n / sum(n, na.rm = TRUE))

csp4 <- csp3 %>% 
  select(-n) %>% 
  spread(key = csp, value = share) 

names(csp4) <- sub(pattern = "([1-6])", replacement = "csp_sh\\1", x = names(csp4))

csp5 <- reshape(data = data.frame(csp4), direction = "wide", idvar = "code_insee", timevar = "annee")

write.table(csp4, file = "data/csp4.csv", row.names = FALSE, sep = ",", dec = ".")
write.table(csp5, file = "data/csp5.csv", row.names = FALSE, sep = ",", dec = ".")
