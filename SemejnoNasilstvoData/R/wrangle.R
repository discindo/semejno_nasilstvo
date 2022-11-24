#' Get a translation
#' @param table the translation lookup table, options are: 'sector', 'article', 'offense',
#' 'colnames', 'type', 'group', ...
#' @param lang_in,lang_out from and to language. A 2-letter language code, "mk", "sq", or "en"
#' @param term the term to translate
#' @noRd
get_translation <- function(table, term, lang_in, lang_out) {
  if (is.na(term)) {
    return(NA_character_)
  }

  target_table <- base::get(paste(table, "_tt", sep = ""))

  target <- target_table %>%
    dplyr::filter(!!rlang::sym(lang_in) == term)

  if (nrow(target) == 0) {
    return(NA_character_)
  } else {
    return(dplyr::pull(target, lang_out))
  }

}

bulk_translate_from_mk <- function(vec, tab, lang) {
  purrr::map_chr(vec, function(x)
    get_translation(
      table = tab,
      term = x,
      lang_in = "mk",
      lang_out = lang
    ))
}


#' Wrangle `КД по СВР` (Кривични дела по сектор за внатрешни работи)
#'
#' @details This is the first sheet in the quarterly report in excel file
#' published by the Macedonian Ministry of Internal Affairs
#'
#' @param path path (local or url) to the excel file
#' @param lang A 2-letter language code, "mk", "sq", or "en"
#'
#' @examples
#' path <- "../data-raw/semejno-za-open-data-od-januari-do-mart-2022.xlsx"
#' get_crime_by_sector(path = path, lang = "sq")
#' get_crime_by_sector(path = path, lang = "mk")
#' get_crime_by_sector(path = path, lang = "en")
#'
#' @export
get_crime_by_sector <- function(path, lang) {
  X <- readxl::read_excel(path = path,
                          sheet = 1,
                          range = "A2:K11")
  colnames(X)[1:3] <- c("Член од кривичен законик", "Законска инкриминација", "Вкупно")

  Y <- X %>%
    tidyr::pivot_longer(cols = -(1:2),
                        names_to = "Сектор",
                        values_to = "Број") %>%
    dplyr::mutate(Сектор = stringr::str_to_sentence(stringr::str_remove(Сектор, "СВР "))) %>%
    dplyr::mutate(`Законска инкриминација` = stringr::str_to_sentence(`Законска инкриминација`)) %>%
    dplyr::mutate(`Член од кривичен законик` = stringr::str_to_sentence(`Член од кривичен законик`)) %>%
    dplyr::mutate(Сектор = bulk_translate_from_mk(vec = Сектор, tab = "sector", lang = lang)) %>%
    dplyr::mutate(`Законска инкриминација` = bulk_translate_from_mk(vec = `Законска инкриминација`, tab = "offense", lang = lang)) %>%
    dplyr::mutate(`Член од кривичен законик` = bulk_translate_from_mk(vec = `Член од кривичен законик`, tab = "article", lang = lang))

  new_col_names <- bulk_translate_from_mk(vec = colnames(Y), tab = "colnames", lang = lang)

  names(Y) <- new_col_names

  return(Y)
}

#' Wrangle `Сторители и жртви на КД по СВР`
#'
#' @details This is the second sheet in the quarterly report in excel file
#' published by the Macedonian Ministry of Internal Affairs
#'
#' @param path path (local or url) to the excel file
#' @param lang A 2-letter language code, "mk", "sq", or "en"
#'
#' @examples
#' path <- "../data-raw/semejno-za-open-data-od-januari-do-mart-2022.xlsx"
#' get_victims_by_sector(path = path, lang = "sq")
#' get_victims_by_sector(path = path, lang = "mk")
#' get_victims_by_sector(path = path, lang = "en")
#'
#' @export
get_victims_by_sector <- function(path, lang) {
  X <- readxl::read_excel(path = path,
                          sheet = 2,
                          range = "A2:AE10")

  colnames(X)[[1]] <- "Сектор"

  Y <- X %>% tidyr::pivot_longer(cols = -1, names_to = "Група", values_to = "Број") %>%
    dplyr::mutate(Сектор = stringr::str_to_sentence(stringr::str_remove(Сектор, "СВР "))) %>%
    dplyr::mutate(Група = stringr::str_to_sentence(Група)) %>%
    tidyr::separate(Група, into = c("Тип", "Група"), sep = " - ", fill = "right") %>%
    # again different content, same column name
    dplyr::mutate(Група = stringr::str_to_sentence(Група)) %>%
    dplyr::mutate(Група = tidyr::replace_na(data = Група, replace = "NA")) %>%
    dplyr::mutate(Сектор = bulk_translate_from_mk(vec = Сектор, tab = "sector", lang = lang)) %>%
    dplyr::mutate(Тип = bulk_translate_from_mk(vec = Тип, tab = "type", lang = lang)) %>%
    dplyr::mutate(Група = bulk_translate_from_mk(vec = Група, tab = "group", lang = lang))

  new_col_names <- bulk_translate_from_mk(vec = colnames(Y), tab = "colnames", lang = lang)

  names(Y) <- new_col_names

  return(Y)
}

