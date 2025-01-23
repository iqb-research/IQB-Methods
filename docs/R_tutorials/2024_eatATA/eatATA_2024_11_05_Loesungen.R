
library(eatATA)

# Itempool
str(items_mini)

# haeufig genutzte Konstanten
nForms <- 1

# Objective Function
Btime <- minObjective(nForms, itemValues = items_mini$time, itemIDs = items_mini$item)

# Constraints
Blength <- itemsPerFormConstraint(nForms, nItems = nrow(items_mini), targetValue = 10,
                                  operator = "=", itemIDs = items_mini$item)
Bcat <- itemCategoryConstraint(nForms, as.factor(items_mini$format),
                               targetValues = c(4, 3, 3),
                               itemIDs = items_mini$item)

# Use Solver
solver_out <- useSolver(list(Btime, Blength, Bcat))

# Loesung inspizieren
inspectSolution(solver_out, items = items_mini, idCol = "item")

appendSolution(solver_out,
  items = items_mini, idCol = "item")



## Uebungsaufgabe
# ----------------------------------------------------------------------------------------
# Erstellt 2 Bloecke mit folgenden Testspezifikationen:
# -> beide Blocke Testzeit so nah wie moeglich an 450 Sekunden (via minimaxObjective() Funktion)
# -> ein Item darf nur in einem Block vorkommen (via itemUsageConstraint() Funktion)
# -> jedes Itemformat sollte mindestens 3 Mal pro Block vorkommen (via itemCategoryMinConstraint() Funktion)
# Setzt dabei dem Solver ein Zeitlimit von 10 Sekunden!


# haeufig genutzte Konstanten
nForms2 <- 2

# Objective Function
Btime2 <- minimaxObjective(nForms2, itemValues = items_mini$time,
                          targetValue = 450, itemIDs = items_mini$item)

# Constraints
Busage2 <- itemUsageConstraint(nForms2, nItems = nrow(items_mini), targetValue = 1,
                                  operator = "<=", itemIDs = items_mini$item)
Bopen <- itemCategoryMinConstraint(nForms2, itemCategories = as.factor(items_mini$format), 
                                    min = c(3, 3, 3),
                                    itemIDs = items_mini$item)

# Use Solver
solver_out2 <- useSolver(list(Btime2, Busage2, Bopen), timeLimit = 10)

# Loesung inspizieren
inspectSolution(solver_out2, items = items_mini, idCol = "item")

appendSolution(solver_out2,
               items = items_mini, idCol = "item")
