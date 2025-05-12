# Foot Fatigue Index Model

This project simulates a Foot Fatigue Index that quantifies how physically fatigued a worker’s feet become based on their job, shoes, age, and weight. It was built as part of a data science challenge from Hike Medical, focused on real-world ergonomic risk modeling.

## How It's Made 

### Tech Used: R, dplyr, ggplot 2

I built a model entirely in RStudio, simulating 1,000 synthetic workers profiles with varied job roles (nurses, construction workers, warehouse workers, restaurant staff, retail workers, and bus drivers) This model was designed to reflect real-world factors that include:

- Average hours on feet based on the person's job
- Typical footwear worn by each worker
- Standing to walking ratio
- Age and weight-based fatigue adjustments

The model was built in a nonlinear formula using a weighted blend of all inputs listed above. The weight of each input was based on publicly available ergonomic and occupational health research, which are cited at the end of this file. 

## Optimizations 

- Restricted random values to stay within realistic ranges (2 - 12 hours on feet)
- Assigned realistic shoe types per job to avoid unrealistic worker profiles in the synthetic dataset (e.g., nurses in boots, construction workers in sneakers)

## Findings 

1. Highest Risk Categories

Nurses and warehouse workers scored the highest on average fatigue, indicating consistent physical strain due to prolonged time on feet and demanding shifts. These findings suggest that targeted interventions should prioritize workers in high-intensity roles where fatigue risk is persistently.

2. Fatigue Risk Varies Greatly by Job Type
 
These findings have shown that fatigue levels are strongly influenced by the nature of the job itself, with roles involving prolonged standing, movement, and physical labor resulting in significantly higher fatigue scores compared to more sedentary positions.

3. Fatigue for High and Low Impact Jobs Remain Consistent Throughout Age Groups
  
It was found that for high impact jobs (nurses and warehouse workers) that the fatigue score remained constantly high regardless of age or weight highlighting the importance of job based ergonomic support, not just age-based interventions. 

On the contrary, low impact jobs (bus drivers) showed consistently low fatigue scores across all age groups, reinforcing the model's ability to distinguish between job-level and individual-level fatigue factors.

4. The Model Accurately Captures Both Job-Level and Individual-Level Risk

Fatigue scores vary across individuals within the same job type, showing that the model successfully integrates personal attributes alongside job demands—creating a more precise, realistic risk profile for each worker.


These findings support the idea that job type is the dominant driver of fatigue risk, while age and weight serve more as modifiers than primary determinants. This highlights a key opportunity: targeting high-strain jobs like nursing and warehouse work with supportive interventions—such as high-performance insoles—could make the most difference. Since workers in these roles experience consistently high fatigue regardless of personal traits, focusing on the job itself is likely to deliver the greatest impact.





