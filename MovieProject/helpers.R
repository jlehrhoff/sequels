## TO DO: ARRANGE LEGEND BY RELEASE DATE!
## Fix pictures!


# DAILY GROUPS
ChasingMD <- temp %>% filter(., Title == "The Bourne Identity" | 
                          Title == "The Bourne Supremacy" | 
                            Title == "The Bourne Ultimatum" |
                            Title == "Elysium") %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
ChasingMD$Title = "Chasing Matt Damon"

SavingMD <- temp %>% filter(., Title == "The Martian" | 
                               Title == "Saving Private Ryan" | Title == "Interstellar") %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
SavingMD$Title = "Saving Matt Damon"

LOTR <- temp %>% filter(., Title == "The Lord of the Rings: The Return of the King" | 
                          Title == "The Lord of the Rings: The Two Towers" | 
                          Title == "The Lord of the Rings: The Fellowship of the Ring") %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
LOTR$Title = "The Lord of the Rings"

Hobbit <- temp %>% filter(., Title == "The Hobbit: An Unexpected Journey" | 
                          Title == "The Hobbit: The Battle of the Five Armies" | 
                          Title == "The Hobbit: The Desolation of Smaug") %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
Hobbit$Title = "The Hobbit"

HP <- temp %>% filter(., Title == "Harry Potter and the Chamber of Secrets" | 
                        Title == "Harry Potter and the Deathly Hallows Part 1" | 
                        Title == "Harry Potter and the Deathly Hallows Part 2" |
                        Title == "Harry Potter and the Goblet of Fire" | 
                        Title == "Harry Potter and the Half-Blood Prince" |
                        Title == "Harry Potter and the Sorcerer's Stone" | 
                        Title == "Harry Potter and the Order of the Phoenix" | 
                        Title == "Harry Potter and the Prisoner of Azkaban" ) %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
HP$Title = "Harry Potter"

Twilight <- temp %>% filter(., Title == "The Twilight Saga: Breaking Dawn Part 1" | 
                        Title == "The Twilight Saga: Breaking Dawn Part 2" | 
                        Title == "The Twilight Saga: Eclipse" |
                        Title == "The Twilight Saga: New Moon" | 
                        Title == "Twilight" ) %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
Twilight$Title = "Twilight"

Transformers <- temp %>% filter(., Title == "Transformers" | 
                              Title == "Transformers: Age of Extinction" | 
                              Title == "Transformers: Dark of the Moon" |
                              Title == "Transformers: Revenge of the Fallen" ) %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
Transformers$Title = "Transformers"

Batman <- temp %>% filter(., Title == "Batman Begins" | 
                                  Title == "The Dark Knight" |
                                  Title == "The Dark Knight Rises" ) %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
Batman$Title = "Batman"


Avengers <- temp %>% filter(., Title == "The Avengers: Age of Ultron" | 
                            Title == "The Avengers" ) %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
Avengers$Title = "Avengers"


HungerGames <- temp %>% filter(., Title == "The Hunger Games" | 
                            Title == "The Hunger Games: Catching Fire" |
                            Title == "The Hunger Games: Mockingjay - Part 1" ) %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
HungerGames$Title = "Hunger Games"


ChrisPratt <- temp %>% filter(., Title == "Guardians of the Galaxy" | 
                                 Title == "Jurassic World") %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
ChrisPratt$Title = "Chris Pratt"


Divergent <- temp %>% filter(., Title == "Divergent" | 
                                Title == "The Divergent Series: Insurgent") %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
Divergent$Title = "Divergent"


JLaw <- temp %>% filter(., Title == "The Hunger Games" | 
                          Title == "The Hunger Games: Catching Fire" |
                          Title == "The Hunger Games: Mockingjay - Part 1" |
                          Title == "American Hustle" |
                          Title == "Silver Linings Playbook" ) %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
JLaw$Title = "Jennifer Lawrence"
JLaw = JLaw[1:31,]

Shailene <- temp %>% filter(., Title == "Divergent" | 
                               Title == "The Divergent Series: Insurgent" |
                              Title == "The Fault in Our Stars" |
                              Title == "The Descendants") %>%
  group_by(., Days) %>% 
  summarise(., mean(Gross), mean(TotalGross), mean(as.numeric(Rank)))
Shailene$Title = "Shailene Woodley"
Shailene = Shailene[1:31,]


# TOTAL GROUPS
ChasingMD1 <- grossrating %>% filter(., Title == "The Bourne Identity" | 
                               Title == "The Bourne Supremacy" | 
                               Title == "The Bourne Ultimatum" |
                               Title == "Elysium") %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
ChasingMD1$Title = "Chasing Matt Damon"

SavingMD1 <- grossrating %>% filter(., Title == "The Martian" | 
                              Title == "Saving Private Ryan" | Title == "Interstellar") %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
SavingMD1$Title = "Saving Matt Damon"

LOTR1 <- grossrating %>% filter(., Title == "The Lord of the Rings: The Return of the King" | 
                          Title == "The Lord of the Rings: The Two Towers" | 
                          Title == "The Lord of the Rings: The Fellowship of the Ring") %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
LOTR1$Title = "The Lord of the Rings"

Hobbit1 <- grossrating %>% filter(., Title == "The Hobbit: An Unexpected Journey" | 
                            Title == "The Hobbit: The Battle of the Five Armies" | 
                            Title == "The Hobbit: The Desolation of Smaug") %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
Hobbit1$Title = "The Hobbit"

HP1 <- grossrating %>% filter(., Title == "Harry Potter and the Chamber of Secrets" | 
                        Title == "Harry Potter and the Deathly Hallows Part 1" | 
                        Title == "Harry Potter and the Deathly Hallows Part 2" |
                        Title == "Harry Potter and the Goblet of Fire" | 
                        Title == "Harry Potter and the Half-Blood Prince" |
                        Title == "Harry Potter and the Sorcerer's Stone" | 
                        Title == "Harry Potter and the Order of the Phoenix" | 
                        Title == "Harry Potter and the Prisoner of Azkaban" ) %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
HP1$Title = "Harry Potter"

Twilight1 <- grossrating %>% filter(., Title == "The Twilight Saga: Breaking Dawn Part 1" | 
                              Title == "The Twilight Saga: Breaking Dawn Part 2" | 
                              Title == "The Twilight Saga: Eclipse" |
                              Title == "The Twilight Saga: New Moon" | 
                              Title == "Twilight" ) %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
Twilight1$Title = "Twilight"

Transformers1 <- grossrating %>% filter(., Title == "Transformers" | 
                                  Title == "Transformers: Age of Extinction" | 
                                  Title == "Transformers: Dark of the Moon" |
                                  Title == "Transformers: Revenge of the Fallen" ) %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
Transformers1$Title = "Transformers"

Batman1 <- grossrating %>% filter(., Title == "Batman Begins" | 
                            Title == "The Dark Knight" |
                            Title == "The Dark Knight Rises" ) %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
Batman1$Title = "Batman"

Avengers1 <- grossrating %>% filter(., Title == "Avengers: Age of Ultron" | 
                              Title == "Marval's The Avengers" ) %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
Avengers1$Title = "Avengers"


HungerGames1 <- grossrating %>% filter(., Title == "The Hunger Games" | 
                                 Title == "The Hunger Games: Catching Fire" |
                                 Title == "The Hunger Games: Mockingjay - Part 1" ) %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
HungerGames1$Title = "Hunger Games"


ChrisPratt1 <- grossrating %>% filter(., Title == "Guardians of the Galaxy" | 
                                Title == "Jurassic World") %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
ChrisPratt1$Title = "Chris Pratt"


Divergent1 <- grossrating %>% filter(., Title == "Divergent" | 
                               Title == "The Divergent Series: Insurgent") %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
Divergent1$Title = "Divergent"


JLaw1 <- grossrating %>% filter(., Title == "The Hunger Games" | 
                          Title == "The Hunger Games: Catching Fire" |
                          Title == "The Hunger Games: Mockingjay - Part 1" |
                          Title == "American Hustle" |
                          Title == "Silver Linings Playbook" ) %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
JLaw1$Title = "Jennifer Lawrence"

Shailene1 <- grossrating %>% filter(., Title == "Divergent" | 
                              Title == "The Divergent Series: Insurgent" |
                              Title == "The Fault in Our Stars" |
                              Title == "The Descendants") %>%
  summarise(., mean(Lifetime.Gross), mean(Rating))
Shailene1$Title = "Shailene Woodley"


moviegroups = rbind(Shailene, JLaw, Divergent, ChrisPratt,HungerGames, Avengers,
                    Batman,Transformers,Twilight, HP,Hobbit, LOTR,SavingMD,ChasingMD)
moviegroupstotals = rbind(Shailene1, JLaw1, Divergent1, ChrisPratt1,HungerGames1, Avengers1,
                          Batman1,Transformers1,Twilight1, HP1,Hobbit1, LOTR1,SavingMD1,ChasingMD1)

moviegroups = mutate(moviegroups, mean.TotalGross. = mean.TotalGross./1000000)
movies = mutate(movies, TotalGross = TotalGross/1000000)

write.table(movies, file = "Desktop/MovieProject/data/movies.csv", sep = ',')
write.table(moviegroups, file = "Desktop/MovieProject/data/moviegroups.csv", sep = ',')
write.table(moviegroupstotals, file = "Desktop/MovieProject/data/moviegroupstotals.csv", sep = ',')
