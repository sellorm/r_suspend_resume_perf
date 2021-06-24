# Run all the benchmarks

source("config.R")

if (file.exists("~/.disk_benchmarks.rds")){
  stop("The ~/.disk_benchmarks.rds file already exists. Is another job running?")
}

outputs_dir <- paste0("outputs/", format(Sys.time(), "%Y-%m-%d_-_%H-%M-%S"))

# Save the outputs_dir so we can read it again after we've cleared the environment
saveRDS(outputs_dir, file="~/.disk_benchmarks.rds")

dir.create(outputs_dir, recursive = TRUE)

cat("-- 01_save_image.Rmd --\n")
for( current_iteration in seq(iterations)){
  cat(paste0("1 - save image full - Iteration: ", sprintf("%03d", current_iteration), "\n"))

  outputs_dir <- readRDS("~/.disk_benchmarks.rds")

  rmarkdown::render("01_save_image.Rmd",
                    output_file = paste0(outputs_dir,
                                         "/01_save_image_",
                                         current_iteration,
                                         ".html"))
}

cat("-- 02_save_image_compressed.Rmd --\n")

for( current_iteration in seq(iterations)){
  cat(paste0("2 - save image compressed - Iteration: ", sprintf("%03d", current_iteration), "\n"))

  outputs_dir <- readRDS("~/.disk_benchmarks.rds")

  rmarkdown::render("02_save_image_compressed.Rmd",
                    output_file = paste0(outputs_dir,
                                         "/02_save_image_compressed_",
                                         current_iteration,
                                         ".html"))
}

## 3 - save image factors
cat("-- 03_save_image_factors.Rmd --\n")

outputs_dir <- readRDS("~/.disk_benchmarks.rds")

for( current_iteration in seq(iterations)){
  cat(paste0("3 - save image factors - Iteration: ", sprintf("%03d", current_iteration), "\n"))

  outputs_dir <- readRDS("~/.disk_benchmarks.rds")

  rmarkdown::render("03_save_image_factors.Rmd",
                    output_file = paste0(outputs_dir,
                                         "/03_save_image_factors_",
                                         current_iteration,
                                         ".html"))
}


# ## 4 - save image qs
# cat("-- 04_qsave_image.Rmd --\n")
#
# outputs_dir <- readRDS("~/.disk_benchmarks.rds")
#
# for( current_iteration in seq(iterations)){
#   cat(paste0("4 - save as qs - Iteration: ", sprintf("%03d", current_iteration), "\n"))
#
#   outputs_dir <- readRDS("~/.disk_benchmarks.rds")
#
#   rmarkdown::render("04_qsave_image.Rmd",
#                     output_file = paste0(outputs_dir,
#                                          "/04_qsave_image_",
#                                          current_iteration,
#                                          ".html"))
# }
#


# remove the outputs_dir config file at the end
unlink("~/.disk_benchmarks.rds")
