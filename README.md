# Foot Fatigue Index Model

This project simulates a Foot Fatigue Index that quantifies how physically fatigued a worker’s feet become based on their job, shoes, age, and weight. It was built as part of a data science challenge from Hike Medical, focused on real-world ergonomic risk modeling.

## How It's Made 

### Tech Used: R, dplyr, ggplot 2

I built model entirely in RStudio, simulating 1,000 synethethic workers profiles with varied job roles (nurses, construction workers, warehouse workers, resturaunt staff, retail workers, and bus drivers.) This model was designed to reflect real-world factors that include:

- Average hours on feet based on the person's jon
- Typical footwear worn by each worker
- Standing to walking ratio
- Age and weight-based fatigue adjustments

The model was built in a nonlinear formula using a weighted blend of all inputs listed above. 
