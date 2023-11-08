#' Create a project folder for analysis review
#'
#' @param folder_path Path for the new folder
#' @param ... Extra information collected from the RStudio wizard
#'
#' @return Folder with a copy of the analysis_review_template_folder
#'
#' @examples
#' \dontrun{
#' create_analysis_review_template("path/to/folder")
#' }
create_analysis_review_template <- function(folder_path, ...) {

  from <- system.file("analysis_review_template", package = "impacttemplates")
  fs::dir_copy(from, folder_path, overwrite = FALSE)

  from_css <- system.file("css", package = "impacttemplates")
  fs::dir_copy(from_css, paste0(folder_path, "\\utils"), overwrite = FALSE)
}
