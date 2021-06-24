# R Session suspend/resume performance

This repo provides a number of utility scripts to test performance of various methods for suspending and resuming an R session.

It can be useful for comparing session suspend and resume performance between two different file system types, for example AWS EFS vs EBS.


## Overview

R has a fantastic string cache that helps users minimise the amount of memory used when objects have repeating strings. R stores the individual strings in a cache and then uses a pointer in the object to refer to the string. This keeps memory usage very low for these types of objects.

Unfortunately, when those objects are serialised to disk they undergo a process of extreme inflation as the rds/RData serialiser does not perform the same optimisation. This means the objects that were very small in memory can become extremely large on disk.

This repo contains tools to compare the performance of two disks (for example network storage vs local storage) when writing these extremely large datasets.

As we leverage this feature of R, it is not necessary to perform these tests on a super-powerful machine, however, you will require a substantial amount of disk space.

## Using these tools

The tests are driven by the `config.R` file, which contains all the necessary configuration options to use the tools on your own systems.

Please ensure you carefully review these options _before_ starting a test run.

## Running the tests

Once you have carefully reviewed and edited the test configuration, you're ready to run the tests.

Steps:

1. review `config.R` and edit as as appropriate for your environment
2. open `run-benchmarks.R` in the RStudio IDE
3. Go to the "Jobs" tab of the IDE
4. Click the "Start Local Job" button
5. Make sure the R Script is set to `run-benchmarks.R` and the working directory is set to the current directory.
6. Click "Start"

The job should run to completion. Remember, if you have a slow disk, or a high number of iterations this can take many hours, even days, to run. Be patient.

You should see job information scrolling past in the jobs pane.

When the job is complete, check the "outputs" directory for the reports that have been written. Each report contains the specific timings of the operations carried out.
