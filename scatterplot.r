# Load the ggplot2 package
library(ggplot2)

# Load the Iris dataset
data(iris)

# Create a scatter plot
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species)) +
  geom_point(size = 4) +  # Add points
  labs(title = "Scatter Plot of Sepal Length vs. Sepal Width",
       x = "Sepal Length",
       y = "Sepal Width") +  # Add labels
  theme_minimal() +  # Use a minimal theme
  scale_color_manual(values = c("setosa" = "red", "versicolor" = "green", "virginica" = "blue")) +  # Customize colors
  scale_shape_manual(values = c("setosa" = 1, "versicolor" = 2, "virginica" = 3))  # Customize shapes

