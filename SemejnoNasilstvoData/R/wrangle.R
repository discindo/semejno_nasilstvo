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
    dplyr::mutate(Сектор = sapply(Сектор, USE.NAMES = FALSE, function(x)
      get_translation(
        table = "sector",
        term = x,
        lang_in = "mk",
        lang_out = lang
      ))) %>%
    dplyr::mutate(`Законска инкриминација` = sapply(`Законска инкриминација`, USE.NAMES = FALSE, function(x)
      get_translation(
        table = "offense",
        term = x,
        lang_in = "mk",
        lang_out = lang
      ))) %>%
    dplyr::mutate(`Член од кривичен законик` = sapply(`Член од кривичен законик`, USE.NAMES = FALSE, function(x)
      get_translation(
        table = "article",
        term = x,
        lang_in = "mk",
        lang_out = lang
      )))

  new_col_names <-
    sapply(colnames(Y), USE.NAMES = FALSE, function(x)
      get_translation(
        table = "colnames",
        term = x,
        lang_in = "mk",
        lang_out = lang
      ))

  names(Y) <- new_col_names

  return(Y)
}

#' Get a translation
#' @param table the lookup table, options are: 'sector', 'article', 'offense', and 'colnames'
#' @param lang_in,lang_out from and to language. A 2-letter language code, "mk", "sq", or "en"
#' @param term the term to translate
#' @noRd

get_translation <- function(table, term, lang_in, lang_out) {

  target_table <- switch(table,
                         "sector" = svr_translation_table(),
                         "article" = article_translation_table(),
                         "offense" = offense_translation_table(),
                         "colnames" = colnames_translation_table()
  )

  target_table %>%
    dplyr::filter(!!rlang::sym(lang_in) == term) %>%
    dplyr::pull(lang_out)
}

#' @noRd
svr_translation_table <- function() {
  mk <-
    stringr::str_to_sentence(
      c(
        "Вкупно",
        "СКОПЈЕ",
        "БИТОЛА",
        "ВЕЛЕС",
        "КУМАНОВО",
        "ОХРИД",
        "СТРУМИЦА",
        "ТЕТОВО",
        "ШТИП"
      )
    )
  en <-
    stringr::str_to_sentence(
      c(
        "Total",
        "Skopje",
        "Bitola",
        "Veles",
        "Kumanovo",
        "Ohrid",
        "Strumica",
        "Tetovo",
        "Stip"
      )
    )
  sq <-
    stringr::str_to_sentence(
      c(
        "Total",
        "Shkup",
        "Manastir",
        "Veles",
        "Kumanovë",
        "Ohër",
        "Strumica",
        "Tetova",
        "Shtip"
      )
    )
  data.frame(mk, sq, en)
}

#' @noRd
article_translation_table <- function(lang) {
  mk <-
    stringr::str_to_sentence(
      c(
        "Член 123 став 2",
        "Член 123 став 2 во врска со член 19",
        "Член 130 став 2",
        "Член 131 став 2",
        "Член 139 став 2",
        "Член 144 став 2",
        "Член 140 став 2",
        "Член 189 став 2",
        "Член 191 став 3"
      )
    )

  sq <-
    stringr::str_to_sentence(
      c(
        "neni 123 paragrafi 2",
        "neni 123 paragrafi 2 në lidhje me nenin 19",
        "Neni 130 paragrafi 2",
        "neni 131 paragrafi 2",
        "neni 139 paragrafi 2",
        "Neni 144 paragrafi 2",
        "neni 140 paragrafi 2",
        "neni 189 paragrafi 2",
        "Neni 191 paragrafi 3"
      )
    )

  en <- stringr::str_to_sentence(
    c(
      "Article 123 paragraph 2",
      "Article 123 paragraph 2 in connection with Article 19",
      "Article 130 paragraph 2",
      "Article 131 paragraph 2",
      "Article 139 paragraph 2",
      "Article 144 paragraph 2",
      "Article 140 paragraph 2",
      "Article 189 paragraph 2",
      "Article 191 paragraph 3"
    )
  )

  data.frame(mk, sq, en)
}

#' @noRd
offense_translation_table <- function(lang) {
  mk <-
    stringr::str_to_sentence(
      c(
        "Убиство",
        "Телесна повреда",
        "Тешка телесна повреда",
        "Присилба",
        "Загрозување на сигурноста",
        "Противправно лишување од слобода",
        "Обљуба со злоупотреба на положба",
        "Посредување во вршење проституција"
      )
    )

  sq <- stringr::str_to_sentence(
    c(
      "Vrasje",
      "lëndim trupor",
      "Lëndim i rëndë trupor",
      "Detyrim",
      "Kërcënimi i sigurisë",
      "Heqja e paligjshme e lirisë",
      "Dashuri nga shpërdorimi i pozitës",
      "Ndërmjetësimi i prostitucionit"
    )
  )

  en <- stringr::str_to_sentence(
    c(
      "Murder",
      "bodily injury",
      "Grievous bodily harm",
      "Compulsion",
      "Security threat",
      "Unlawful deprivation of liberty",
      "Love by abuse of position",
      "Mediating prostitution"
    )
  )

  data.frame(mk, sq, en)
}

#' @noRd
colnames_translation_table <- function(lang) {
  mk <- stringr::str_to_sentence(c(
    "Член од кривичен законик",
    "Законска инкриминација",
    "Сектор",
    "Број"
  ))

  sq <- stringr::str_to_sentence(c("Neni i Kodit Penal",
                                   "Inkriminimi ligjor",
                                   "Sektor",
                                   "Numri"))

  en <- stringr::str_to_sentence(c(
    "Criminal Code Article",
    "Legal Incrimination",
    "Sector",
    "Number"
  ))

  data.frame(mk, sq, en)
}
