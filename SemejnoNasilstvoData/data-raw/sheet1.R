## code to prepare `sheet1` datasets goes here

paths <-
  c(
    "data-raw/semejno-za-open-data-od-januari-do-mart-2022.xlsx",
    "data-raw/1.semejno-za-open-data-vtor-kvartal-2022-.xls",
    "data-raw/semejno-nasilstvo-juli-septemvri-2022-god.-veb-sajt.xls"
  )

crimes_mk <- purrr::map_dfr(paths, get_crime_by_sector, lang = "mk", .id = "Квартал")
crimes_en <- purrr::map_dfr(paths, get_crime_by_sector, lang = "en", .id = "Quarter")
crimes_sq <- purrr::map_dfr(paths, get_crime_by_sector, lang = "sq", .id = "Tremujori")

usethis::use_data(crimes_mk, crimes_en, crimes_sq, overwrite = TRUE, internal = TRUE)
