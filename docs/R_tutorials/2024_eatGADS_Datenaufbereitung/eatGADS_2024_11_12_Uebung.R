
library(eatGADS)

# Uebung 1
# ----------------------------------------------------------------------------------------

# Ladet den Datensatz `example_data.sav` aus dem [eatFDZ](https://github.com/beckerbenj/eatFDZ) Paket.

remotes::install_github("beckerbenj/eatFDZ")

sav_path <- system.file("extdata", "example_data.sav", package = "eatFDZ")
example_gads <- import_spss(sav_path)

# Inspiziert die Meta-Daten der Variable "books".

# Vergebt sinnvolle Wertelabel und Missingtags, wo diese bisher fehlen.

# Bildet eine neue, dichotome Schulvariable ("school_dich") mit 1 = "nicht-Gymnasium" und 2 = "Gymnasium".

# Rekodierung

# Anpassung Wertelabel


# Uebung 2
# ----------------------------------------------------------------------------------------

# Entfernt die Variablen `"ID_name"` und `"info"` aus Anonymisierungsgründen vollständig aus dem Datensatz.

# Bildet den Notendurchschnitt aus den bestehenden Notenvariablen (`"grade_<fach>"`).

# Uebung 3
# ----------------------------------------------------------------------------------------
# Überprüft die Vergabe von Missingtags im Beispieldatensatz mithilfe der Funktion `checkMissings()`.

# Überprüft, ob alle Wertelabels auch tatsächlich in den Daten vorkommen (`checkEmptyValLabels()`). Sollten diese Wertelabel aus den Daten entfernt werden?

# Überprüft, ob alle Werte auch tatsächlich gelabelet sind (`checkMissingValLabels()`).
