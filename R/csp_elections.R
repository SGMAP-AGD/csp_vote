
pr <- read.dta("hackathon_baseselec.dta")

prcsv <- merge(csp5, pr , by = "code_insee", all.x = TRUE, all.y = FALSE)

png("output/ouvriers_ps_1981.png", width = 420, height = 380)
prcsv %>% 
  filter(!is.na(ps_81t1)) %>% 
  ggplot(aes(x = csp_sh6.1982, y = ps_81t1)) + 
  geom_point(color = "grey") + 
  geom_smooth(method = "lm") + 
  theme_blaquans() + 
  labs(title = "Vote PS et part des ouvriers (1981)", x = "Part d'ouvriers dans la population active en 1982", y = "Part de vote du PS au 1er tour, 1981")
dev.off()

png("output/ouvriers_ps_1988.png", width = 420, height = 380)
prcsv %>% 
  filter(!is.na(ps_81t1)) %>% 
  ggplot(aes(x = csp_sh6.1990, y = ps_88t1)) + 
  geom_point(color = "grey") + 
  geom_smooth(method = "lm") + 
  theme_blaquans() + 
  labs(title = "Vote PS et part des ouvriers (1988)", x = "Part d'ouvriers dans la population active en 1990", y = "Part de vote du PS au 1er tour, 1988")
dev.off()

png("output/ouvriers_ps_2002.png", width = 420, height = 380)
prcsv %>% 
  filter(!is.na(ps_81t1)) %>% 
  ggplot(aes(x = csp_sh6.1999, y = ps_02t1)) + 
  geom_point(color = "grey") + 
  geom_smooth(method = "lm") + 
  theme_blaquans() + 
  labs(title = "Vote PS et part des ouvriers (2002)", x = "Part d'ouvriers dans la population active en 1999", y = "Part de vote du PS au 1er tour, 2002")
dev.off()

png("output/ouvriers_ps_2007.png", width = 420, height = 380)
prcsv %>% 
  filter(!is.na(ps_81t1)) %>% 
  ggplot(aes(x = csp_sh6.2006, y = ps_07t1)) + 
  geom_point(color = "grey") + 
  geom_smooth(method = "lm") + 
  theme_blaquans() + 
  labs(title = "Vote PS et part des ouvriers (2007)", x = "Part d'ouvriers dans la population active en 2006", y = "Part de vote du PS au 1er tour, 2007")
dev.off()

png("output/ouvriers_ps_2012.png", width = 420, height = 380)
prcsv %>% 
  filter(!is.na(ps_81t1)) %>% 
  ggplot(aes(x = csp_sh6.2011, y = ps_12t1)) + 
  geom_point(color = "grey") + 
  geom_smooth(method = "lm") + 
  theme_blaquans() + 
  labs(title = "Vote PS et part des ouvriers (2012)", x = "Part d'ouvriers dans la population active en 2011", y = "Part de vote du PS au 1er tour, 2012")
dev.off()
