# Configuration options for benchmarking tools

# Please review the options carefully before running

# data paths
## These should be the base paths the the location on the filesystem where you'd
## like the test data to be written
disk_1_path <- "/path/to/disk_1"
disk_2_path <- "/path/to/disk_2"

# Name the disks
## You may optionally name the disks, for example, you might use EFS and EBS
disk_1_name <- "Disk 1"
disk_2_name <- "Disk 2"

# on disk data size
## FALSE = 10G
## TRUE = 100G
use_large_data <- FALSE

# Number of iterations - number of times to repeat the test
## Remember that using "use_large_data <- TRUE" with a a high number of
## terations on a disk with poor performance can be _very_ slow.
## Start small and build up from there.
iterations <- 1
