## ============================================================
## The Kaamos workshop “Effective Data Visualization in Research"
## Kaamos Symposium 2-4.12.2025
## Oulu University / Finland
##
## Synthetic ecological dataset for the workshop
## File to be created: eco_measurements.csv
##
## dr Jan Pawel Jastrzebski
## bioinformatyka@gmail.com
## ORCID ID: 0000-0001-8699-7742
## Reproducible thanks to set.seed()
## ============================================================

# setting working directory
setwd("E://Praca/Staze_Szkolenia_Projekty_Konferencje/Fin/")
set.seed(1234)

## Define factors -------------------------------------------------------------

sites        <- c("A", "B", "C", "D")
habitats     <- c("forest", "grassland", "wetland")
species      <- c("species1", "species2", "species3")
replicates   <- 1:5
n_per_combo  <- 6   # number of individuals per site × habitat × species × replicate

# Full factorial design
design <- expand.grid(
  site         = sites,
  habitat_type = habitats,
  species      = species,
  replicate    = replicates,
  obs          = seq_len(n_per_combo),
  KEEP.OUT.ATTRS = FALSE,
  stringsAsFactors = FALSE
)

n <- nrow(design)
n
# 4 sites × 3 habitats × 3 species × 5 reps × 6 obs = 1080 rows


## Effects for sites / habitats / species ------------------------------------

# Height effects (cm)
site_height_effect <- c(A = 10, B = 0, C = -5, D = 3)
hab_height_effect  <- c(forest = 8, grassland = 0, wetland = -3)
sp_height_effect   <- c(species1 = 0, species2 = 5, species3 = -2)

# Soil moisture effects (0–1 scale)
hab_moisture_base <- c(forest = 0.6, grassland = 0.4, wetland = 0.8)
site_moisture_adj <- c(A = 0.05, B = 0, C = -0.05, D = 0.02)

# Temperature (°C) effects by site (A warmest, C coolest)
site_temp_mean <- c(A = 23, B = 21, C = 19, D = 20)

# Nitrogen base by site and habitat (ppm)
site_N_base   <- c(A = 40, B = 35, C = 30, D = 25)
hab_N_adjust  <- c(forest = 10, grassland = 0, wetland = 5)

# Chlorophyll by species and habitat
sp_chl_base   <- c(species1 = 40, species2 = 45, species3 = 50)
hab_chl_adj   <- c(forest = 5, grassland = 0, wetland = -3)


## Generate numeric variables -------------------------------------------------

# 5. height_cm: roughly normal, affected by site, habitat, species
height_cm <- with(design,
                  50 +
                    site_height_effect[site] +
                    hab_height_effect[habitat_type] +
                    sp_height_effect[species] +
                    rnorm(n, mean = 0, sd = 5)
)
height_cm[height_cm < 5] <- 5  # avoid zero/negative

# 6. leaf_area_cm2: correlated with height (roughly linear + noise)
leaf_area_cm2 <- 0.8 * height_cm + rnorm(n, mean = 0, sd = 10)
leaf_area_cm2[leaf_area_cm2 < 1] <- 1

# 7. biomass_g: non-linear function of height + noise
biomass_g <- 0.12 * (height_cm ^ 1.15) + rnorm(n, mean = 0, sd = 5)
biomass_g[biomass_g < 0.5] <- 0.5

# 8. chlorophyll_content: species + habitat effects + moderate noise
chlorophyll_content <- with(design,
                            sp_chl_base[species] +
                              hab_chl_adj[habitat_type] +
                              rnorm(n, mean = 0, sd = 3)
)
chlorophyll_content[chlorophyll_content < 10] <- 10

# 9. soil_moisture: strong habitat effect + site adjustment + noise
soil_moisture <- with(design,
                      hab_moisture_base[habitat_type] +
                        site_moisture_adj[site] +
                        rnorm(n, mean = 0, sd = 0.05)
)
soil_moisture <- pmin(pmax(soil_moisture, 0.1), 0.95)  # clamp 0.1–0.95

# 10. soil_ph: relatively random in 4.5–7.5, slight site effect
site_ph_shift <- c(A = 0.3, B = 0, C = -0.2, D = 0.1)
soil_ph <- with(design,
                6 + site_ph_shift[site] + rnorm(n, mean = 0, sd = 0.4)
)
soil_ph <- pmin(pmax(soil_ph, 4.5), 7.5)

# 11. temperature_C: mostly site-driven
temperature_C <- with(design,
                      site_temp_mean[site] + rnorm(n, mean = 0, sd = 1)
)

# 12. light_intensity: lower in forest, higher in grassland/wetland
hab_light_base <- c(forest = 200, grassland = 600, wetland = 400)
site_light_adj <- c(A = 50, B = 0, C = -50, D = 30)

light_intensity <- with(design,
                        hab_light_base[habitat_type] +
                          site_light_adj[site] +
                          rnorm(n, mean = 0, sd = 80)
)
light_intensity[light_intensity < 50] <- 50

# 13. nitrogen_ppm: strong site + habitat effect
nitrogen_ppm <- with(design,
                     site_N_base[site] +
                       hab_N_adjust[habitat_type] +
                       rnorm(n, mean = 0, sd = 5)
)
nitrogen_ppm[nitrogen_ppm < 1] <- 1

# 14. phosphorus_ppm: moderately correlated with nitrogen
phosphorus_ppm <- 0.5 * nitrogen_ppm + rnorm(n, mean = 0, sd = 3)
phosphorus_ppm[phosphorus_ppm < 0.5] <- 0.5

# 15. potassium_ppm: mostly random, with mild habitat trends
hab_K_shift <- c(forest = 5, grassland = 0, wetland = 3)
potassium_ppm <- with(design,
                      30 + hab_K_shift[habitat_type] + rnorm(n, mean = 0, sd = 4)
)
potassium_ppm[potassium_ppm < 5] <- 5

# 16. growth_rate_cm_week: depends on height & soil_moisture + noise
growth_rate_cm_week <- 0.05 * height_cm +
  2.0 * soil_moisture +
  rnorm(n, mean = 0, sd = 1.5)
growth_rate_cm_week[growth_rate_cm_week < 0] <- 0


## Build final data frame ----------------------------------------------------

eco_measurements <- data.frame(
  site                = factor(design$site, levels = sites),
  habitat_type        = factor(design$habitat_type, levels = habitats),
  species             = factor(design$species, levels = species),
  replicate           = factor(design$replicate),
  height_cm           = round(height_cm, 2),
  leaf_area_cm2       = round(leaf_area_cm2, 2),
  biomass_g           = round(biomass_g, 2),
  chlorophyll_content = round(chlorophyll_content, 2),
  soil_moisture       = round(soil_moisture, 3),
  soil_ph             = round(soil_ph, 2),
  temperature_C       = round(temperature_C, 2),
  light_intensity     = round(light_intensity, 1),
  nitrogen_ppm        = round(nitrogen_ppm, 2),
  phosphorus_ppm      = round(phosphorus_ppm, 2),
  potassium_ppm       = round(potassium_ppm, 2),
  growth_rate_cm_week = round(growth_rate_cm_week, 3)
)

str(eco_measurements)
summary(eco_measurements)


## Optional: quick PCA check (for you, not for students yet) -----------------

# Only numeric columns:
num_cols <- sapply(eco_measurements, is.numeric)
eco_numeric <- eco_measurements[, num_cols]

pca <- prcomp(scale(eco_numeric), center = TRUE, scale. = TRUE)

# Quick diagnostic plot: PC1 vs PC2 colored by habitat / site
# (You can later turn this into a ggplot example in the tutorial)
plot(
  pca$x[,1], pca$x[,2],
  col = eco_measurements$habitat_type,
  pch = as.numeric(eco_measurements$site),
  xlab = "PC1", ylab = "PC2",
  main = "PCA of eco_measurements (color = habitat, shape = site)"
)
legend("topright", legend = levels(eco_measurements$habitat_type),
       col = 1:length(levels(eco_measurements$habitat_type)), pch = 16, bty = "n")

## Save to CSV ---------------------------------------------------------------

write.csv(eco_measurements, file = "eco_measurements.csv", row.names = FALSE)
