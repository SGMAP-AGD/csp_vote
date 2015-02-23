pr <- read.dta("hackathon_baseselec.dta")
all <- merge(rp_secteur5, pr , by = "code_insee", all.x = TRUE, all.y = FALSE)

png("output/voteps_shareindustrie_1981.png", width = 420, height = 380)
all %>% 
  filter(!is.na(ps_81t1)) %>% 
  ggplot(aes(x = sh2.1982, y = ps_81t1)) + 
  geom_point(color = "grey") + 
  geom_smooth(method = "lm") + 
  theme_blaquans() + 
  labs(title = "Vote PS et part d'actifs dans l'industrie 1981", x = "Part d'actifs employés dans l'industrie en 1982", y = "Part du vote PS en 1981 1er tour")
dev.off()

png("output/voteps_shareindustrie_2012.png", width = 420, height = 380)
all %>% 
  filter(!is.na(ps_81t1)) %>% 
  ggplot(aes(x = sh2.2011, y = ps_12t1)) + 
  geom_point(color = "grey") + 
  geom_smooth(method = "lm") + 
  theme_blaquans() + 
  labs(title = "Vote PS et part d'actifs dans l'industrie 2012", x = "Part d'actifs employés dans l'industrie en 2011", y = "Part du vote PS en 2012 1er tour")
dev.off()
