
library(eatGADS)

# Uebung 1
# ----------------------------------------------------------------------------------------

# Ladet den Datensatz `example_data.sav` aus dem [eatFDZ](https://github.com/beckerbenj/eatFDZ) Paket.

remotes::install_github("beckerbenj/eatFDZ")

sav_path <- system.file("extdata", "example_data.sav", package = "eatFDZ")
example_gads <- import_spss(sav_path)

# Inspiziert die Meta-Daten der Variable "books".
extractMeta(example_gads, vars = "books")

# Vergebt sinnvolle Wertelabel und Missingtags, wo diese bisher fehlen.
example_gads2 <- changeValLabels(example_gads, varName = "books", 
                                 value = 5, valLabel = "201-500 books")
example_gads2 <- changeMissings(example_gads2, varName = "books", 
                                 value = -99, missings = "miss")
extractMeta(example_gads2, vars = "books")

# Bildet eine neue, dichotome Schulvariable ("school_dich") mit 1 = "nicht-Gymnasium" und 2 = "Gymnasium".
example_gads3 <- cloneVariable(example_gads2, varName = "school",
                       new_varName = "school_dich")

# Rekodierung
example_gads3 <- recodeGADS(example_gads3, varName = "school_dich",
                    oldValues = c(1, 2, 3, 4),
                    newValues = c(1, 1, 1, 2),
                    existingMeta = "drop")

# Anpassung Wertelabel
example_gads3 <- changeValLabels(example_gads3, varName = "school_dich",
                         value = c(1, 2), valLabel = c("Nicht-Gymnasium", "Gymnasium"))


# Uebung 2
# ----------------------------------------------------------------------------------------

# Entfernt die Variablen `"ID_name"` und `"info"` aus Anonymisierungsgründen vollständig aus dem Datensatz.
example_gads4 <- removeVars(example_gads3, vars = c("ID_name", "info"))
namesGADS(example_gads4)

# Bildet den Notendurchschnitt aus den bestehenden Notenvariablen (`"grade_<fach>"`).
example_gads5 <- calculateScale(example_gads4, items = c("grade_math", "grade_germ", "grade_eng"), 
                                scale = "average_grade", reportDescr = TRUE)
example_gads5$dat[, grep("grade", namesGADS(example_gads5))]

# Uebung 3
# ----------------------------------------------------------------------------------------
# Überprüft die Vergabe von Missingtags im Beispieldatensatz mithilfe der Funktion `checkMissings()`.
example_gads6 <- checkMissings(example_gads5, missingLabel = "miss|omitted|unclear|unknown")
example_gads6 <- checkMissingsByValues(example_gads5)

# Überprüft, ob alle Wertelabels auch tatsächlich in den Daten vorkommen (`checkEmptyValLabels()`). Sollten diese Wertelabel aus den Daten entfernt werden?
checkEmptyValLabels(example_gads6)

# Überprüft, ob alle Werte auch tatsächlich gelabelet sind (`checkMissingValLabels()`).
checkMissingValLabels(example_gads6)
