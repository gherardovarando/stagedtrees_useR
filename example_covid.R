library(stagedtrees)

data <- readRDS("data/simulated_covid_france.rds")

best <- search_best(data[sample(1:100000, size = 100000, replace = TRUE),], alg = stages_bhc,
                       search_criterion = BIC)     #\( x ) attr(logLik(x), "df") )

best <- stndnaming(best)
plot(best, col = "stages")
BIC(best)

par(mfrow = c(1,2))
plot(best, col = "stages")
barplot(best, "death")
