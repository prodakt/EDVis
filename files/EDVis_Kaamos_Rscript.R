# ////////////////////////////////////////////////////////////////////////
# The Kaamos workshop “Effective Data Visualization in Research"
# Kaamos Symposium 2-4.12.2025
# Oulu University / Finland
#
# dr. Jan Pawel Jastrzebski
# bioinformatyka@gmail.com
# ORCID ID: 0000-0001-8699-7742
# ////////////////////////////////////////////////////////////////////////

setwd("E://Praca/Staze_Szkolenia_Projekty_Konferencje/Fin/")

# ///

# load file directly form GitHub
eco <- read.csv(
  "https://raw.githubusercontent.com/prodakt/EDVis/main/files/eco_measurements.csv",
  stringsAsFactors = FALSE
)

# of from your computer
eco <- read.csv("eco_measurements.csv", stringsAsFactors = FALSE)
head(eco)

eco$site         <- factor(eco$site)
eco$habitat_type <- factor(eco$habitat_type)
eco$species      <- factor(eco$species)
eco$replicate    <- factor(eco$replicate)

str(eco)

# 6.2.2 Histogram of plant height
png("fig6_2_1_height_hist.png", width = 1600, height = 1200, res = 300)

hist(
  eco$height_cm,
  breaks = 30,
  main   = "Distribution of plant height",
  xlab   = "Height (cm)",
  col    = "grey80",
  border = "white"
)

dev.off()

# 6.2.3 Boxplot of height by site
png("fig6_2_2_height_by_site.png", width = 1600, height = 1200, res = 300)

boxplot(
  height_cm ~ site,
  data  = eco,
  main  = "Plant height by site",
  xlab  = "Site",
  ylab  = "Height (cm)",
  col   = c("lightblue", "lightgreen", "lightpink", "lightyellow")
)

dev.off()

# 6.2.4 Boxplot of chlorophyll content by habitat type
png("fig6_2_3_chl_by_habitat.png", width = 1600, height = 1200, res = 300)

boxplot(
  chlorophyll_content ~ habitat_type,
  data  = eco,
  main  = "Chlorophyll content by habitat type",
  xlab  = "Habitat type",
  ylab  = "Chlorophyll content (SPAD units)",
  col   = c("darkolivegreen3", "goldenrod1", "skyblue2")
)

dev.off()

# 6.2.5 Scatterplot of height vs leaf area
# Define a simple color palette for sites
site_cols <- c(A = "red", B = "blue", C = "darkgreen", D = "purple")

png("fig6_2_4_height_vs_leafarea.png", width = 1600, height = 1200, res = 300)

plot(
  eco$height_cm,
  eco$leaf_area_cm2,
  col  = site_cols[eco$site],
  pch  = 16,
  main = "Height vs leaf area (colored by site)",
  xlab = "Height (cm)",
  ylab = "Leaf area (cm²)"
)

legend(
  "topleft",
  legend = levels(eco$site),
  col    = site_cols[levels(eco$site)],
  pch    = 16,
  bty    = "n",
  title  = "Site"
)

dev.off()


# 6.2.6 Scatterplot of soil nitrogen vs phosphorus
# Colors for habitat types
hab_cols <- c(forest = "darkolivegreen4",
              grassland = "goldenrod3",
              wetland = "steelblue3")

# Shapes for sites
site_pch <- c(A = 16, B = 17, C = 15, D = 18)

png("fig6_2_5_nitrogen_vs_phosphorus.png", width = 1600, height = 1200, res = 300)

plot(
  eco$nitrogen_ppm,
  eco$phosphorus_ppm,
  col  = hab_cols[eco$habitat_type],
  pch  = site_pch[eco$site],
  main = "Soil nitrogen vs phosphorus",
  xlab = "Nitrogen (ppm)",
  ylab = "Phosphorus (ppm)"
)

legend(
  "topleft",
  legend = levels(eco$habitat_type),
  col    = hab_cols[levels(eco$habitat_type)],
  pch    = 16,
  bty    = "n",
  title  = "Habitat type"
)

legend(
  "bottomright",
  legend = levels(eco$site),
  pch    = site_pch[levels(eco$site)],
  bty    = "n",
  title  = "Site"
)

dev.off()


# 6.2.7 Pairwise relationships between selected variables

vars_for_pairs <- c("height_cm", "biomass_g", "soil_moisture", "light_intensity")

site_cols <- c(A = "red", B = "blue", C = "darkgreen", D = "purple")

png("fig6_2_6_pairs_selected_numeric.png", width = 2000, height = 2000, res = 300)

pairs(
  eco[, vars_for_pairs],
  col = site_cols[eco$site],   # kolorowanie punktów
  pch = 16,
  main = "Pairwise relationships between selected variables\n(colored by site)"
)

dev.off()

# ---
# pro
# plot
vars_for_pairs <- c("height_cm", "biomass_g", "soil_moisture", "light_intensity")

hab_cols <- c(
  forest    = "darkolivegreen4",
  grassland = "goldenrod3",
  wetland   = "steelblue3"
)

# Diagonal panel: histogram
panel.hist <- function(x, ...) {
  usr <- par("usr")
  par(usr = c(usr[1:2], 0, 1.5))
  hist(x, col = "grey80", border = "white", probability = TRUE, add = TRUE)
}

# Upper panel: correlation coefficient
panel.cor <- function(x, y, digits = 2, ...) {
  usr <- par("usr")
  par(usr = c(0, 1, 0, 1))
  r <- cor(x, y)
  txt <- format(r, digits = digits)
  text(0.5, 0.5, txt, cex = 1.5)
}

# Lower panel: scatter colored by habitat type
panel.scatter <- function(x, y, ...) {
  points(
    x, y,
    pch = 16,
    col = hab_cols[eco$habitat_type],
    ...
  )
}

png("fig6_2_6_pairs_selected_numeric_pro.png", width = 2400, height = 2400, res = 300)

pairs(
  eco[, vars_for_pairs],
  upper.panel = panel.cor,
  diag.panel  = panel.hist,
  lower.panel = panel.scatter,
  main = "Pairwise relationships between selected variables\n(color = habitat type)"
)

dev.off()

# legend for the plot
png("fig6_2_6_legend.png", width = 1200, height = 400, res = 300)

# Create an empty plot region
par(mar = c(0, 0, 0, 0))
plot(0, 0, type = "n", axes = FALSE, xlab = "", ylab = "")

legend(
  "center",
  legend = names(hab_cols),
  col    = hab_cols,
  pch    = 16,
  pt.cex = 3,
  bty    = "n",
  title  = "Habitat type",
  cex    = 1.5
)

dev.off()
