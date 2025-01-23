
library(eatGADS)

db_path <- system.file("extdata", "pisa.db", package = "eatGADS")

## Uebungsaufgabe
# ----------------------------------------------------------------------------------------
# Welche Variablen zum Thema elterliche Bildung sind in der Beispiel-DB enthalten?

all_meta <- extractMeta(db_path)
unique(all_meta[grepl("edu|parent", all_meta$varLabel, ignore.case = TRUE), c("varName", "varLabel")])

# Wie sind die Metadaten dieser Variablen strukturiert? (Wertelabel, Fehlende Werte, etc.)
extractMeta(db_path, vars = c("hisced", "pared"))

# Zieht diese Variablen zusammen mit der Geschlechtervariable 'gender' aus der Datenbank und betrachtet ihre univariaten und bivariaten Verteilungen.
gads <- getGADS(db_path, vSelect = c("pared", "hisced", "gender"))
dat <- extractData2(gads, labels2character = c("hisced", "gender"))

table(dat$pared)
table(dat$hisced)

table(dat$gender, dat$pared)
table(dat$gender, dat$hisced)

# Zieht nun diese drei Variablen zusammen mit den Kompetenzschätzer ('value') aus der Datenbank.
gads2 <- getGADS(db_path, vSelect = c("pared", "hisced", "gender", "value"))

# Können wir mithilfe der elterlichen Bildung die Mathematik-Kompetenz der Schüler:innen vorhersagen?
dat2 <- extractData2(gads2, labels2character = c("hisced", "gender", "dimension"))

dat_mat <- dat2[dat2$dimension == "ma", ]

out1 <- eatRep::repGlm(datL = dat_mat, type = "none", imp = "imp", ID = "idstud", 
                        formula = value ~ pared, na.rm = TRUE)
eatRep::report(out1)
eatRep::report2(out1)
