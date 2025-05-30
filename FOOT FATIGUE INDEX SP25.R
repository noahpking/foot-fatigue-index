set.seed(1)

library(dplyr)
library(ggplot2)

# Categories Definitions 

job_types <- c("warehouse_worker", "nurse", "bus_driver", "retail_worker",
               "restaurant_staff", "construction_worker")

shoe_types <- c("boot", "sneaker", "clog", "dress_shoe")

# Score Definitions 

job_strain <- c(
  restaurant_staff = 4.5,
  nurse = 4.8,
  warehouse_worker = 4.7,
  retail_worker = 4.2, 
  construction_worker = 3.5,
  bus_driver = 2.0
)

shoe_discomfort <- c(
  boot = 1.5, 
  sneaker = 0.2, 
  clog = 0.5, 
  dress_shoe = 1.2
)

standing_ratios <- c(
  restaurant_staff = 0.4,
  nurse = 0.5,
  warehouse_worker = 0.6,
  retail_worker = 0.85,
  construction_worker = 0.7,
  bus_driver = 0.1
)

# Assigns realstic shoe options for each type of job

job_shoes <- list(
  warehouse_worker = c("boot", "sneaker"),
  nurse = c("sneaker", "clog"),
  bus_driver = c("sneaker", "dress_shoe"),
  retail_worker = c("sneaker", "dress_shoe"),
  restaurant_staff = c("sneaker", "clog"),
  construction_worker = c("boot")
)

# Assigns realstic hours of on feet time for each type of job

avg_hours <- c(
  warehouse_worker = 8.5,
  nurse = 12,
  bus_driver = 6,
  retail_worker = 6,
  restaurant_staff = 8,
  construction_worker = 8
)

# Generate job_type for each worker

n <- 1000
job_type <- sample(job_types, n, replace = TRUE)

shoe_type <- rep(NA, n)
hours_on_feet <- rep(NA, n)
for (i in 1:n) {
  job <- job_type[i]
  valid_shoes <- job_shoes[[job]]
  shoe_type[i] <- sample(valid_shoes, 1)
  raw_hours <- rnorm(1, mean = avg_hours[job], sd = 1.5)
  hours_on_feet[i] <- max(2, min(13, raw_hours))
}

# Generating synthetic data

data <- data.frame(
  job_type = job_type,
  shoe_type = shoe_type,
  hours_on_feet = hours_on_feet,
  weight = rnorm(n, mean = 170, sd = 25),
  age = sample(20:65, n, replace = TRUE)
)

# Assign standing_ratio based on job_type

data$standing_ratio <- standing_ratios[data$job_type]

# Fatigue Score Calculation 

data$fatigue_score <- with(data, 
 (job_strain[job_type] * 
   (0.5 * hours_on_feet^1.2 + 
    0.4 * standing_ratio^1.5 * hours_on_feet + 
    0.3 * shoe_discomfort[shoe_type]^1.1 + 
    0.2 * (weight^1.05 / 175) + 
    0.1 * (age^1.1 / 50))
) + 
    rnorm(n, mean = 0, sd = 0.5)
)

data$fatigue_score <- round(data$fatigue_score, 2)

# Summarize data for plot

summary_stats <- data %>%
  group_by(job_type) %>%
  summarise(
    avg_fatigue = mean(fatigue_score),
    sd_fatigue = sd(fatigue_score)
  )

# Plot for the average fatigue score by job type

ggplot(summary_stats, aes(x = reorder(job_type, avg_fatigue), y = avg_fatigue)) +
  geom_col(fill = "steelblue") +
  geom_errorbar(aes(ymin = avg_fatigue - sd_fatigue, ymax = avg_fatigue + sd_fatigue),
                width = 0.2) +
  geom_text(aes(label = round(avg_fatigue, 1)), vjust = -0.5) +
  labs(
    title = "Average Fatigue Score by Job Type",
    x = "Job Type",
    y = "Fatigue Score"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 0, hjust = 0.5)
)

# Scatter plot: Age vs Fatigue Score, colored by Job Type
ggplot(data, aes(x = age, y = fatigue_score, color = job_type)) +
  geom_point(alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 0.8) +
  labs(
    title = "Fatigue Score vs Age by Job Type",
    x = "Age",
    y = "Fatigue Score",
    color = "Job Type"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "bottom"
)
