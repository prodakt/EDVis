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


# 6.2 Base R Plots ----

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
#png("fig6_2_1_height_hist.png", width = 1600, height = 1200, res = 300)
hist(
  eco$height_cm,
  breaks = 30,
  main   = "Distribution of plant height",
  xlab   = "Height (cm)",
  col    = "grey80",
  border = "white"
)
#dev.off()

# 6.2.3 Boxplot of height by site
#png("fig6_2_2_height_by_site.png", width = 1600, height = 1200, res = 300)
boxplot(
  height_cm ~ site,
  data  = eco,
  main  = "Plant height by site",
  xlab  = "Site",
  ylab  = "Height (cm)",
  col   = c("lightblue", "lightgreen", "lightpink", "lightyellow")
)
#dev.off()

# 6.2.4 Boxplot of chlorophyll content by habitat type
#png("fig6_2_3_chl_by_habitat.png", width = 1600, height = 1200, res = 300)
boxplot(
  chlorophyll_content ~ habitat_type,
  data  = eco,
  main  = "Chlorophyll content by habitat type",
  xlab  = "Habitat type",
  ylab  = "Chlorophyll content (SPAD units)",
  col   = c("darkolivegreen3", "goldenrod1", "skyblue2")
)
#dev.off()

# 6.2.5 Scatterplot of height vs leaf area
# Define a simple color palette for sites
site_cols <- c(A = "red", B = "blue", C = "darkgreen", D = "purple")

# png("fig6_2_4_height_vs_leafarea.png", width = 1600, height = 1200, res = 300)
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
# dev.off()


# 6.2.6 Scatterplot of soil nitrogen vs phosphorus
# Colors for habitat types
hab_cols <- c(forest = "darkolivegreen4",
              grassland = "goldenrod3",
              wetland = "steelblue3")

# Shapes for sites
site_pch <- c(A = 16, B = 17, C = 15, D = 18)

# png("fig6_2_5_nitrogen_vs_phosphorus.png", width = 1600, height = 1200, res = 300)
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
# dev.off()


# 6.2.7 Pairwise relationships between selected variables

vars_for_pairs <- c("height_cm", "biomass_g", "soil_moisture", "light_intensity")

site_cols <- c(A = "red", B = "blue", C = "darkgreen", D = "purple")

# png("fig6_2_6_pairs_selected_numeric.png", width = 2000, height = 2000, res = 300)
pairs(
  eco[, vars_for_pairs],
  col = site_cols[eco$site],   # kolorowanie punktów
  pch = 16,
  main = "Pairwise relationships between selected variables\n(colored by site)"
)
#dev.off()

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

# png("fig6_2_6_pairs_selected_numeric_pro.png", width = 2400, height = 2400, res = 300)
pairs(
  eco[, vars_for_pairs],
  upper.panel = panel.cor,
  diag.panel  = panel.hist,
  lower.panel = panel.scatter,
  main = "Pairwise relationships between selected variables\n(color = habitat type)"
)
# dev.off()

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

# /////////////////////////////////////////////////////////////////////////////
# 6.3 Graphic Devices ----
# 6.3 Graphic Devices in R (PNG, TIFF, PDF, SVG)

# 6.3.5 PNG — Best for screens, presentations, GitHub, and web
png("fig_example_png.png", width = 2000, height = 1600, res = 300)
plot(eco$height_cm, eco$leaf_area_cm2,
     main = "Height vs Leaf Area",
     xlab = "Height (cm)", ylab = "Leaf Area (cm²)")
dev.off()

# 6.3.6 TIFF — Required by many journals
tiff("fig_example_tiff.tiff",
     width = 2000, height = 1600,
     res = 300, compression = "lzw")
boxplot(height_cm ~ site, data = eco,
        main = "Plant Height by Site",
        xlab = "Site", ylab = "Height (cm)")
dev.off()

#6.3.7 PDF — Best for vector scientific figures
pdf("fig_example_pdf.pdf", width = 7, height = 5)
plot(eco$soil_moisture, eco$light_intensity,
     main = "Soil Moisture vs Light Intensity",
     xlab = "Soil Moisture", ylab = "Light Intensity")
dev.off()

# 6.3.8 SVG — For web, HTML, JavaScript interactivity
svg("fig_example_svg.svg", width = 7, height = 5)
hist(eco$nitrogen_ppm,
     main = "Distribution of Soil Nitrogen",
     xlab = "Nitrogen (ppm)")
dev.off()


# 6.3.10 Practical examples from this workshop
png("fig6_3_scatter_height_leafarea.png",
    width = 2400, height = 2000, res = 300)
plot(eco$height_cm, eco$leaf_area_cm2,
     col = "darkblue", pch = 16,
     main = "Height vs Leaf Area",
     xlab = "Height (cm)",
     ylab = "Leaf Area (cm²)")
dev.off()

tiff("fig6_3_chlorophyll_boxplot.tiff",
     width = 2400, height = 2000,
     res = 300, compression = "lzw")
boxplot(chlorophyll_content ~ habitat_type,
        data = eco,
        col = c("darkolivegreen3", "goldenrod1", "skyblue2"),
        main = "Chlorophyll Content by Habitat Type",
        xlab = "Habitat Type",
        ylab = "Chlorophyll Content (SPAD units)")
dev.off()

# ///////////////////////////////////////////////////////////////////////////////////
# 6.3.11 Example: IJMS-compliant PCA figure (TIFF)
# Load dataset (from local file or GitHub raw URL)
# eco <- read.csv("files/eco_measurements.csv", stringsAsFactors = FALSE)
# or:
# eco <- read.csv(
#   "https://raw.githubusercontent.com/prodakt/EDVis/main/files/eco_measurements.csv",
#   stringsAsFactors = FALSE
# )

# step 1
eco$site         <- factor(eco$site)
eco$habitat_type <- factor(eco$habitat_type)

# Select only numeric columns for PCA
num_cols <- sapply(eco, is.numeric)
eco_numeric <- eco[, num_cols]

# Run PCA with centering and scaling
pca <- prcomp(eco_numeric, center = TRUE, scale. = TRUE)

# Percentage of variance explained
var_exp <- (pca$sdev^2) / sum(pca$sdev^2)
pc1_var <- round(var_exp[1] * 100, 1)
pc2_var <- round(var_exp[2] * 100, 1)

# Build a data frame with PCA scores and grouping variables
pca_scores <- as.data.frame(pca$x)
pca_scores$habitat_type <- eco$habitat_type
pca_scores$site         <- eco$site


# step 2
library(ggplot2)

p_pca <- ggplot(
  pca_scores,
  aes(x = PC1, y = PC2,
      color = habitat_type,
      shape = site)
) +
  geom_point(alpha = 0.7, size = 2) +
  labs(
    title = "PCA of eco_measurements dataset",
    x = paste0("PC1 (", pc1_var, "%)"),
    y = paste0("PC2 (", pc2_var, "%)"),
    color = "Habitat type",
    shape = "Site"
  ) +
  theme_bw(base_size = 12) +
  theme(
    plot.title      = element_text(hjust = 0.5),
    legend.position = "right",
    panel.grid      = element_line(linewidth = 0.2)  # FIXED
  )

# Preview on screen (optional)
print(p_pca)


# step 3
# Export PCA plot as TIFF for IJMS
tiff(
  filename    = "fig_IJMS_PCA_eco.tiff",
  width       = 180,     # width in mm
  height      = 180,     # height in mm
  units       = "mm",
  res         = 300,     # 300 dpi, journal standard
  compression = "lzw"    # lossless compression
)

print(p_pca)

dev.off()



# ///////////////////////////////////////////////////////////////

# 6.4.3 Scatterplot basics (geom_point)
ggplot(eco, aes(x = height_cm, y = leaf_area_cm2)) +
  geom_point()


# 6.4.4 Adding color, shape, and transparency
ggplot(eco, aes(
  x = height_cm,
  y = leaf_area_cm2,
  color = habitat_type,
  shape = site
)) +
  geom_point(alpha = 0.7, size = 2) +
  labs(
    title = "Height vs Leaf Area",
    x = "Height (cm)",
    y = "Leaf Area (cm²)",
    color = "Habitat type",
    shape = "Site"
  ) +
  theme_bw()


# 6.4.5 Histogram and density plots
ggplot(eco, aes(x = nitrogen_ppm)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(
    title = "Distribution of Soil Nitrogen",
    x = "Nitrogen (ppm)",
    y = "Count"
  ) +
  theme_bw()

ggplot(eco, aes(x = nitrogen_ppm, fill = habitat_type)) +
  geom_density(alpha = 0.5) +
  labs(
    title = "Density of Soil Nitrogen by Habitat Type",
    x = "Nitrogen (ppm)",
    y = "Density"
  ) +
  theme_bw()


# 6.4.6 Boxplots
ggplot(eco, aes(x = habitat_type, y = chlorophyll_content, fill = habitat_type)) +
  geom_boxplot() +
  labs(
    title = "Chlorophyll Content by Habitat Type",
    x = "Habitat type",
    y = "Chlorophyll content (SPAD units)"
  ) +
  theme_bw() +
  theme(legend.position = "none")

# 6.4.7 Faceting (small multiples)
ggplot(eco, aes(x = height_cm, y = leaf_area_cm2, color = habitat_type)) +
  geom_point(alpha = 0.6) +
  facet_wrap(~ species) +
  labs(
    title = "Height vs Leaf Area, Faceted by Species",
    x = "Height (cm)",
    y = "Leaf Area (cm²)"
  ) +
  theme_bw()


# 6.4.8 Using scales (colors, shapes, limits, transformations)
ggplot(eco, aes(x = height_cm, y = biomass_g, color = habitat_type)) +
  geom_point(alpha = 0.7) +
  scale_color_manual(
    values = c(
      forest    = "darkgreen",
      grassland = "goldenrod2",
      wetland   = "steelblue"
    )
  ) +
  theme_bw()

ggplot(eco, aes(x = height_cm, y = biomass_g)) +
  geom_point(alpha = 0.6) +
  scale_y_log10() +
  labs(
    y = "Biomass (g, log10 scale)"
  ) +
  theme_bw()


# 6.4.9 Themes: refining figure appearance
ggplot(eco, aes(x = height_cm, y = biomass_g, color = habitat_type)) +
  geom_point() +
  theme_classic(base_size = 14)

ggplot(eco, aes(x = soil_ph, fill = habitat_type)) +
  geom_histogram(position = "identity", alpha = 0.5, bins = 30) +
  theme_minimal(base_size = 14)


# 6.4.10 Multi-layer plotting
ggplot(eco, aes(x = height_cm, y = biomass_g, color = habitat_type)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 0.8) +
  theme_bw()


# ////////////////////////////////////////////////////////////////////////////////

## /////////////////////////////////////////////////////////////
## Section 6.5
## Files are saved into the "files/" directory:
##  - fig6_5_1_height_hist.png
##  - fig6_5_1_height_strip.png
##  - fig6_5_2_height_leafarea_2d.png
##  - fig6_5_3_height_leafarea_color3d.png
##  - fig6_5_4_height_leafarea_4d.png
##  - fig6_5_5_height_leafarea_5d.png
## /////////////////////////////////////////////////////////////

library(ggplot2)

## Load dataset (adjust path if needed)
## Option 1: from local files/ directory
eco <- read.csv("files/eco_measurements.csv", stringsAsFactors = FALSE)

## Option 2: directly from GitHub (uncomment if preferred)
# eco <- read.csv(
#   "https://raw.githubusercontent.com/prodakt/EDVis/main/files/eco_measurements.csv",
#   stringsAsFactors = FALSE
# )

eco$site         <- factor(eco$site)
eco$habitat_type <- factor(eco$habitat_type)
eco$species      <- factor(eco$species)
eco$replicate    <- factor(eco$replicate)

## Ensure output directory exists
if (!dir.exists("files")) dir.create("files")

## 6.5.1A Histogram of plant height -----------------------------

p_6_5_1_hist <- ggplot(eco, aes(x = height_cm)) +
  geom_histogram(bins = 30, fill = "darkseagreen3", color = "white") +
  labs(
    title = "Distribution of Plant Height",
    x = "Height (cm)",
    y = "Count"
  ) +
  theme_bw()

png("files/fig6_5_1_height_hist.png", width = 1600, height = 1200, res = 300)
print(p_6_5_1_hist)
dev.off()

## 6.5.1B Stripchart (1D scatter) -------------------------------

p_6_5_1_strip <- ggplot(eco, aes(x = 1, y = height_cm)) +
  geom_jitter(width = 0.15, alpha = 0.5, color = "darkgreen") +
  labs(
    title = "Individual Heights (1D Scatter)",
    x = "",
    y = "Height (cm)"
  ) +
  theme_bw() +
  theme(axis.text.x = element_blank())

png("files/fig6_5_1_height_strip.png", width = 1600, height = 1200, res = 300)
print(p_6_5_1_strip)
dev.off()

## 6.5.2 2D scatterplot: height vs leaf area --------------------

p_6_5_2_2d <- ggplot(eco, aes(x = height_cm, y = leaf_area_cm2)) +
  geom_point(alpha = 0.7, color = "steelblue") +
  labs(
    title = "2D Scatterplot: Height vs Leaf Area",
    x = "Height (cm)",
    y = "Leaf Area (cm²)"
  ) +
  theme_bw()

png("files/fig6_5_2_height_leafarea_2d.png", width = 1600, height = 1200, res = 300)
print(p_6_5_2_2d)
dev.off()

## 6.5.3A – interactive 3D (Plotly) + PNG snapshot -----------------

library(plotly)

p_6_5_3_plotly3d <- plot_ly(
  eco,
  x     = ~height_cm,
  y     = ~leaf_area_cm2,
  z     = ~soil_moisture,
  color = ~habitat_type,
  colors = c("forest" = "darkgreen",
             "grassland" = "goldenrod2",
             "wetland" = "steelblue"),
  type   = "scatter3d",
  mode   = "markers",
  marker = list(size = 3, opacity = 0.7)
)

# To view interactively:
p_6_5_3_plotly3d

# ---- Option 1: Export to PNG using orca() (recommended if available) ----
# Requires: plotly >= 4.9 and the orca command-line utility installed.
# install.packages("plotly")          # if not installed
# Then follow: https://plotly.com/r/static-image-export/

# see instructions how to install ORCA
# https://github.com/plotly/orca#installation
orca(p_6_5_3_plotly3d, "files/fig6_5_3A_height_leafarea_plotly3d.png",
      width = 1600, height = 1200)

# OR

# To have `{reticulate}` install Python for you, `reticulate::install_python()`.
# reticulate::install_python()
save_image(p_6_5_3_plotly3d, "files/fig6_5_3A_height_leafarea_plotly3d.png",
           width = 1600, height = 1200)

# OR 

# ---- Option 2 (simple): manual screenshot ----
# 1. Print p_6_5_3_plotly3d in RStudio or browser.
# 2. Take a screenshot.
# 3. Crop the image.
# 4. Save it as:filename.png


## 6.5.3B Pseudo-3D: color = habitat type ----------------------

p_6_5_3_color3d <- ggplot(eco, aes(
  x     = height_cm,
  y     = leaf_area_cm2,
  color = habitat_type
)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Pseudo-3D Scatterplot (Third Dimension = Color)",
    x = "Height (cm)",
    y = "Leaf Area (cm²)",
    color = "Habitat type"
  ) +
  theme_bw()

png("files/fig6_5_3_height_leafarea_color3d.png", width = 1600, height = 1200, res = 300)
print(p_6_5_3_color3d)
dev.off()

## 6.5.4 4D: color = habitat, shape = site ----------------------

p_6_5_4_4d <- ggplot(eco, aes(
  x     = height_cm,
  y     = leaf_area_cm2,
  color = habitat_type,
  shape = site
)) +
  geom_point(size = 2, alpha = 0.7) +
  labs(
    title = "4D Scatterplot: Adding Shape",
    x = "Height (cm)",
    y = "Leaf Area (cm²)",
    color = "Habitat type",
    shape = "Site"
  ) +
  theme_bw()

png("files/fig6_5_4_height_leafarea_4d.png", width = 1600, height = 1200, res = 300)
print(p_6_5_4_4d)
dev.off()

## 6.5.5 5D: + size = biomass_g ---------------------------------

p_6_5_5_5d <- ggplot(eco, aes(
  x     = height_cm,
  y     = leaf_area_cm2,
  color = habitat_type,
  shape = site,
  size  = biomass_g
)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "5D Scatterplot: Adding Size",
    x = "Height (cm)",
    y = "Leaf Area (cm²)",
    color = "Habitat type",
    shape = "Site",
    size  = "Biomass (g)"
  ) +
  theme_bw() +
  scale_size_continuous(range = c(1.5, 6))

png("files/fig6_5_5_height_leafarea_5d.png", width = 1600, height = 1200, res = 300)
print(p_6_5_5_5d)
dev.off()

## Note: the interactive 3D Plotly figure from 6.5.3A is not exported as PNG here.

