#!/usr/bin/env Rscript

library(stringr)
library(readr)

frameworks <- c("cgi", "handy", "lighttp", "serverino")

connections <- c("64". "256", "512")

platforms <- c("linux", "macos")

system_info <- c() # uname -a

# Reading file
file_str <- read_file("https://raw.githubusercontent.com/cyrusmsk/d_http_benchmark/main/results/linux/arch_512")
rows <- unlist(stringr::str_split(file_str, "\\n"))

# Preparing data

# Plotting data
