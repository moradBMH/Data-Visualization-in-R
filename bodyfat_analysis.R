library(ggplot2)
library(animint2)

data <- read.table("body.txt", header = TRUE)
data$Diabetes <- as.factor(data$Diabetes)
data$Age <- as.factor(data$Age)

p <- ggplot(data, aes(x = Weight, y = Bodyfat, color = Diabetes, size = Height, shape = Age)) +
  geom_point(alpha=0.7) +
  scale_color_manual(values = c("blue", "red")) +
  scale_size_continuous(range = c(1, 7)) +

  labs(title = "Bodyfat vs. Weight",
       shape = "Age class",
       x = "Weight (kg)",
       y = "Bodyfat (%)",
       color = "Diabetes Status",
       size = "Height (cm)") +
  theme_minimal() +
  theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5))

animint_object <- list(
  scatter = p,
  points = list(data = data, aes = aes(x = Weight, y = Bodyfat, color = Diabetes, size = Height, shape = Age))
)

animint2dir(animint_object, out.dir = "bodyfat_weight_animation")
