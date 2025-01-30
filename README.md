# Simulation Modelling Project

## Overview
The **Simulation Modelling Project** is an R-based project that focuses on simulation modeling and optimization techniques. This repository contains scripts and data files related to distance matrices, genetic algorithms, and location-based calculations.

## Features
- 📊 **Distance Matrix Calculations**: Scripts for calculating distance matrices from geographical coordinates.
- 🧬 **Genetic Algorithm Implementation**: Optimization using genetic algorithms.
- 📍 **Geographical Data Processing**: Working with latitude and longitude data for simulations.

## Installation & Setup
### Prerequisites
Ensure you have the following installed:
- R (latest version)
- R packages: `tidyverse`, `ggplot2`, `dplyr`

### Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/adityapatil484/Simulation-Modelling-Project.git
   ```
2. Navigate to the project directory:
   ```sh
   cd Simulation-Modelling-Project
   ```
3. Open RStudio or run R in your terminal and install required packages:
   ```r
   install.packages(c("tidyverse", "ggplot2", "dplyr"))
   ```

## Usage
### Running Distance Matrix Calculation
Run the `distance_matirx_final_proj.R` script to compute the distance matrix:
```r
source("distance_matirx_final_proj.R")
```

### Running Genetic Algorithm Code
To execute the genetic algorithm for optimization, run:
```r
source("Final_GA_code.r")
```

## Directory Structure
```
Simulation-Modelling-Project/
│-- Final_GA_code.r                  # Genetic algorithm script
│-- dist_matrix.csv                   # Distance matrix data
│-- distance_matirx_final_proj.R      # Distance matrix calculation script
│-- long_lat.csv                      # Latitude & longitude dataset
│-- .RData                             # R data file
│-- .Rhistory                          # R session history
```

## Contribution
Contributions are welcome! Follow these steps to contribute:
1. **Fork** the repository.
2. **Create a new branch** (`feature-branch`).
3. **Commit your changes**.
4. **Open a pull request**.

## License
This project is licensed under the MIT License.

## Contact
For questions or suggestions, reach out:
- **Author**: Aditya Patil
- **GitHub**: adityapatil484

---
🚀 Happy Coding!
