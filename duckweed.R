library(ggplot2)

# Markers for Liver Function Tests
markers_liver <- c("ALT (UL)", "AST (UL)", "ALKP (UL)")

# Mean changes for groups
hdg_means_liver <- c(-4.85, -1.42, -1.65)
hdg_errors_liver <- c(14.8, 6.9, 9.4)

med_means_liver <- c(-6.32, -2.32, -4.11)
med_errors_liver <- c(11.8, 6.9, 8.0)

green_med_means_liver <- c(-7.36, -1.97, -5.51)
green_med_errors_liver <- c(16.7, 7.5, 13.3)

# Create long format data frame
data_liver <- data.frame(
  Marker = rep(markers_liver, 3),
  MeanChange = c(hdg_means_liver, med_means_liver, green_med_means_liver),
  SE = c(hdg_errors_liver, med_errors_liver, green_med_errors_liver),
  Group = rep(c("HDG", "MED", "Green MED"), each = length(markers_liver))
)

# Factor grouping order
data_liver$Group <- factor(data_liver$Group, levels = c("HDG", "MED", "Green MED"))

# Define the colors
group_colors <- c("HDG" = "#d55e00", "MED" = "#4682B4", "Green MED" = "#00C853")

# Plot
ggplot(data_liver, aes(x = Marker, y = MeanChange, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black") +
  geom_errorbar(aes(ymin = MeanChange - SE, ymax = MeanChange + SE),
                position = position_dodge(width = 0.8), width = 0.25) +
  geom_text(aes(label = round(MeanChange, 2)),
            position = position_dodge(width = 0.8),
            vjust = -0.5, size = 3) + scale_fill_manual(values = group_colors) +
  labs(title = "Changes in Liver Function Tests by Diet Group",
       x = "Marker",
       y = "Mean Change") +
  theme_minimal() +
  theme(legend.title = element_blank())


# Lipid profile

library(ggplot2)

# Markers
markers_lipid <- c("LDL-C (mg/dL)", "HDL-C (mg/dL)", "Triglycerides (mg/dL)")

# Mean changes for groups
hdg_means_lipid <- c(-0.21, -2.0, -13.9)
hdg_errors_lipid <- c(21.6, 16.0, 53.0)

med_means_lipid <- c(-1.81, -2.98, -26.0)
med_errors_lipid <- c(19.7, 6.3, 45.4)

green_med_means_lipid <- c(-2.34, -3.7, -22.1)
green_med_errors_lipid <- c(18.0, 6.7, 50.0)

# Create long format data frame
data_lipid <- data.frame(
  Marker = rep(markers_lipid, 3),
  MeanChange = c(hdg_means_lipid, med_means_lipid, green_med_means_lipid),
  SE = c(hdg_errors_lipid, med_errors_lipid, green_med_errors_lipid),
  Group = rep(c("HDG", "MED", "Green MED"), each = length(markers_lipid))
)

# Factor for desired group order
data_lipid$Group <- factor(data_lipid$Group, levels = c("HDG", "MED", "Green MED"))

# Define the colors for groups
group_colors <- c("HDG" = "#d55e00", "MED" = "#4682B4", "Green MED" = "#00C853")

# Plot
ggplot(data_lipid, aes(x = Marker, y = MeanChange, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black") +
  geom_errorbar(aes(ymin = MeanChange - SE, ymax = MeanChange + SE),
                position = position_dodge(width = 0.8), width = 0.25) +
  geom_text(aes(label = round(MeanChange, 2)),
            position = position_dodge(width = 0.8),
            vjust = -0.5, size = 3) +
  scale_fill_manual(values = group_colors) +
  labs(title = "Changes in Lipid Profile by Diet Group",
       x = "Marker",
       y = "Mean Change") +
  theme_minimal() +
  theme(legend.title = element_blank())


# Glycemic response

library(ggplot2)

# Markers for glucose metabolism
markers <- c("Glucose (mg/dL)", "Fasting Insulin (IU/mL)", "HOMA-IR")

# Mean changes for groups
hdg_means <- c(-2.5, -0.54, -0.27)
hdg_errors <- c(13.2, 5.6, 2.0)

med_means <- c(-2.29, -1.63, -0.46)
med_errors <- c(9.6, 9.23, 2.6)

green_med_means <- c(-5.09, -2.55, -0.77)
green_med_errors <- c(15.8, 5.7, 1.6)

# Create long format data frame
data_gly <- data.frame(
  Marker = rep(markers, 3),
  MeanChange = c(hdg_means, med_means, green_med_means),
  SE = c(hdg_errors, med_errors, green_med_errors),
  Group = rep(c("HDG", "MED", "Green MED"), each = length(markers))
)

# Factor for group order
data_gly$Group <- factor(data_gly$Group, levels = c("HDG", "MED", "Green MED"))

# Define colors for groups
group_colors <- c("HDG" = "#d55e00", "MED" = "#4682B4", "Green MED" = "#00C853")

# Plot
ggplot(data_gly, aes(x = Marker, y = MeanChange, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black") +
  geom_errorbar(aes(ymin = MeanChange - SE, ymax = MeanChange + SE),
                position = position_dodge(width = 0.8), width = 0.25) +
  geom_text(aes(label = round(MeanChange, 2)),
            position = position_dodge(width = 0.8),
            vjust = -0.5, size = 3) +
  scale_fill_manual(values = group_colors) +
  labs(title = "Changes in Glucose Metabolism by Diet Group",
       x = "Marker",
       y = "Mean Change") +
  theme_minimal() +
  theme(legend.title = element_blank())

