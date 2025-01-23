library(Rglpk)

?Rglpk::Rglpk_solve_LP


## maximize:    1 S + 2 D + 3 P        (Output)
## subject to:    S +   D +   P <= 8   (Arbeitsplätze)
##              5 S +18 D +25 P <= 120 (Finanzen)
##                S + 0 D + 0 P >= 2   (Mindestanzahl Studis)
##              0 S +   D + 0 P >= 2   (Mindestanzahl Docs)
##              0 S + 0 D +   P >= 2   (Mindestanzahl PostDocs)
##                S,    D,    P are integers

obj <- c(1, 2, 3)
mat <- matrix(c(1, 5, 1, 0, 0, 1, 18, 0, 1, 0, 1, 25, 0, 0, 1), nrow = 5)
dir <- c("<=", "<=", ">=", ">=", ">=")
rhs <- c(8, 120, 2, 2, 2)
types <- c("I", "I", "I")
max <- TRUE

Rglpk_solve_LP(obj, mat, dir, rhs, 
               types = types, max = max, 
               control = list("verbose" = TRUE, "canonicalize_status" = FALSE))

## Lösung
# 3 S, 3 D, 2 P; insgesamt 15 Publikationen