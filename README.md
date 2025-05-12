# Foot Fatigue Index Model

This project simulates a Foot Fatigue Index that quantifies how physically fatigued a worker’s feet become based on their job, shoes, age, and weight. It was built as part of a data science challenge from Hike Medical, focused on real-world ergonomic risk modeling.

## How It's Made 

### Tech Used: R, dplyr, ggplot 2

I built model entirely in RStudio, simulating 1,000 synethethic workers profiles with varied job roles (nurses, construction workers, warehouse workers, resturaunt staff, retail workers, and bus drivers) This model was designed to reflect real-world factors that include:

- Average hours on feet based on the person's jon
- Typical footwear worn by each worker
- Standing to walking ratio
- Age and weight-based fatigue adjustments

The model was built in a nonlinear formula using a weighted blend of all inputs listed above. The weight of each input was based on publicily available ergonomic and occupational health research, which are cited at the end of this file. 

## Optimizations 

- Restricted random values to stay within realistic ranges (2 - 12 hours on feet)
- Assigned realistic shoe types per job to avoid unrealstic worker profiles in the synthetic dataset (e.g., nurses in boots, construction workers in sneakers)

## Findings 

1. Highest risk Categories
Nurses and warehouse workers scored the highest on average fatigue, indicating consistent physical strain due to prolonged time on feet and demandig shifts.

2. Fatigue risk Varies Greatly by Job Type

3. Fatigue for high and low impact jobs remain consistent throughout age groups

It was found that for high impact jobs (nurses and warehouse workers) that the fatigue scored remained constantly high regardless of age, highlighting the importance of job based ergonmoic support, not just age-based interventions. 

Contrary, low impact jobs (bus drivers) showed consistently low fatigue scores across all age groups, reinforcing the model's ability to distinguihs betweeen job-level and individual-level fatigue factors.

5. Variation within roles suggests individual risk factors matter





