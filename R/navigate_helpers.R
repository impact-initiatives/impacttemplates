#' Helper to look to guess uuid name
#'
#' @param dataset dataset to look from
#' @param name_to_search pattern to search, default is "uuid"
#'
#' @return text vector with the name to search. If there is 0 or 2 or more possible ansers, it will
#' give an error.
#' @export
#'
#' @examples
#'   test1_df <- data.frame(uuid = letters,
#'                          x = runif(26),
#'                          hello = LETTERS)
#'   detect_uuid(test1_df)
detect_uuid <- function(dataset, name_to_search = "uuid") {
  name_to_return <- grep(name_to_search, names(dataset), value = T)

  if(length(name_to_return) != 1) {
    msg <- glue::glue("Cannot identify a column with the pattern \"", name_to_search, "\". There are ",
                      length(name_to_return), " results from grep")
    stop(msg)
  }

  return(name_to_return)
}
