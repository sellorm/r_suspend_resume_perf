# Global functions and such

## Make our big data frame
make_df <- function(nrow, ncol) {
  cbind(
    as.data.frame(matrix(
      runif(nrow * ncol), nrow = nrow, ncol = ncol
    )),
    rep(
      'THIS IS A VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE THIS IS A VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE',
      nrow
    ),
    rep(
      'THIS IS A DIFFERENT VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE THIS IS A VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE',
      nrow
    )
  )
}

## Make our big data frame
make_df_factors <- function(nrow, ncol) {
  cbind(
    as.data.frame(matrix(
      runif(nrow * ncol), nrow = nrow, ncol = ncol
    )),
    rep(
      'THIS IS A VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE THIS IS A VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE',
      nrow
    ),
    rep(
      'THIS IS A DIFFERENT VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE THIS IS A VERY LONG TEXT STRING TO TEST A THEORY ABOUT THE STRING CACHE',
      nrow
    ), stringsAsFactors = TRUE)
}


create_data <- function(large = FALSE, stringsAsFactors = FALSE){
  if (isFALSE(large)){
    rows_needed <- 1638010
  } else {
    rows_needed <- 16380102
  }

  if(isFALSE(stringsAsFactors)){
    df <- make_df(nrow = rows_needed, ncol = 3)
  } else {
    df <- make_df_factors(nrow = rows_needed, ncol = 3)
  }

  for (i in 1:20) {
    assign(paste0("df", i), df, envir = .GlobalEnv)
  }
}
