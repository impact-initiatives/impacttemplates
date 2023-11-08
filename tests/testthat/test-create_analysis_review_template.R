test_that("Test that folders strucure is correct", {
  skip("Skip because pathways are different with the github actions")
  #comment the skip and to be run manually with devtools::test()
  temp_dir_to_test <- withr::local_tempdir(fileext = "test")

  create_analysis_review_template(temp_dir_to_test)

  exact_test_folder <- paste0(temp_dir_to_test, "/analysis_review_template/")

  expect_equal(list.files(exact_test_folder),
               c("analysis_review_template.qmd", "inputs", "outputs", "utils"))
})
test_that("Test that outputs is the same", {
  skip("Skip as it needs quarto.exe")
  #comment the skip and to be run manually with devtools::test()
  temp_dir_to_test <- withr::local_tempdir(fileext = "test")

  create_analysis_review_template(temp_dir_to_test)

  exact_test_folder <- paste0(temp_dir_to_test, "/analysis_review_template/")

  quarto::quarto_render(paste0(exact_test_folder, "analysis_review_template.qmd"))
  expect_snapshot_file(paste0(exact_test_folder, "analysis_review_template.html"), "analysis_review_template.html")

})


