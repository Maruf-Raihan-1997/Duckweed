# Load required package

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


# Factor for desired group order
data_liver$Group <- factor(data_liver$Group, levels = c("HDG", "MED", "Green MED"))


# Define the colors
group_colors <- c("HDG" = "#d55e00", "MED" = "#4682B4", "Green MED" = "#00C853")


# Plot 

ggplot(data_liver, aes(x = Marker, y = MeanChange, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black") +
  geom_errorbar(aes(ymin = MeanChange - SE, ymax = MeanChange + SE),
                position = position_dodge(width = 0.8), width = 0.25) +
  scale_fill_manual(values = group_colors) +
  labs(title = "Liver function",
       y = "Mean Change",
       x = "Biomarkers") +
  theme_minimal() +
  theme(
    legend.title = element_blank(),
    legend.position = "top",
    legend.justification = "center",
    legend.direction = "horizontal"
  )



