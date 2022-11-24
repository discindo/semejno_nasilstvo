##### --- Translation tables --- #####

colnames_translation_table <- function() {
  mk <- stringr::str_to_sentence(c(
    "Член од кривичен законик",
    "Законска инкриминација",
    "Сектор",
    "Број",
    "Тип",
    "Група"
  ))

  sq <- stringr::str_to_sentence(c("Neni i Kodit Penal",
                                   "Inkriminimi ligjor",
                                   "Sektor",
                                   "Numri",
                                   "Lloji",
                                   "Grupi"))

  en <- stringr::str_to_sentence(c(
    "Criminal Code Article",
    "Legal Incrimination",
    "Sector",
    "Number",
    "Type",
    "Group"
  ))

  data.frame(mk, sq, en)
}

colnames_tt <- colnames_translation_table()

sector_translation_table <- function() {
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

sector_tt <- sector_translation_table()

article_translation_table <- function() {
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

article_tt <- article_translation_table()

offense_translation_table <- function() {
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

offense_tt <- offense_translation_table()

type_translation_table <- function() {
  mk <- stringr::str_to_sentence(c(
    "Кривични дела",
    "Сторители",
    "Сторител",
    "Вкупно",
    "Жртви",
    "Жртва"
  ))

  en <- stringr::str_to_sentence(c(
    "Crimes",
    "Perpetrators",
    "Perpetrator",
    "Total",
    "Victims",
    "Victim"
  ))

  sq <- stringr::str_to_sentence(c("Krimet",
                                   "Autorët",
                                   "Autori",
                                   "Total",
                                   "Viktimat",
                                   "viktima"))

  data.frame(mk, sq, en)
}

type_tt <- type_translation_table()

group_translation_table <- function() {
  mk <- stringr::str_to_sentence(
    c("Мажи", "Жени", "Сопруг", "Сопруга",
      "Син", "Ќерка", "Мајка", "Татко", "Поранешен сопруг",
      "Поранешна сопруга", "Маж во вонбрачна заедница",
      "Жена во вонбрачна заедница", "Останати мажи",
      "Останати жени", "Жртви")
  )

  en <- stringr::str_to_sentence(
    c("Men", "Women", "Husband", "Wife",
      "Son", "Daughter", "Mother", "Father", "Ex-Husband",
      "Ex-wife", "Man in extra-marital union",
      "Woman in extramarital union", "Other men",
      "Other Women", "Victims")
  )

  sq <- stringr::str_to_sentence(
    c("Burrat", "Gratë", "Burri", "Gruaja",
      "Djali", "Bija", "Nëna", "Babai", "Ish-Burri",
      "Ish-gruaja", "Burri në bashkim jashtëmartesor",
      "Gruaja në bashkim jashtëmartesor", "Burra të tjerë",
      "Gra të tjera", "Viktima")
  )

  data.frame(mk, sq, en)
}

group_tt <- group_translation_table()



paths <-
  c(
    "data-raw/semejno-za-open-data-od-januari-do-mart-2022.xlsx",
    "data-raw/1.semejno-za-open-data-vtor-kvartal-2022-.xls",
    "data-raw/semejno-nasilstvo-juli-septemvri-2022-god.-veb-sajt.xls"
  )

###### --- Translations of the first sheet --- #####

crimes_mk <- purrr::map_dfr(paths, get_crime_by_sector, lang = "mk", .id = "Квартал")
crimes_en <- purrr::map_dfr(paths, get_crime_by_sector, lang = "en", .id = "Quarter")
crimes_sq <- purrr::map_dfr(paths, get_crime_by_sector, lang = "sq", .id = "Tremujori")

###### --- Translations of the second sheet --- #####

victims_mk <- purrr::map_dfr(paths, get_victims_by_sector, lang = "mk", .id = "Квартал")
victims_en <- purrr::map_dfr(paths, get_victims_by_sector, lang = "en", .id = "Quarter")
victims_sq <- purrr::map_dfr(paths, get_victims_by_sector, lang = "sq", .id = "Tremujori")

##### --- Use it! --- #####

usethis::use_data(
  sector_tt,
  article_tt,
  offense_tt,
  colnames_tt,
  type_tt,
  group_tt,

  crimes_mk,
  crimes_en,
  crimes_sq,

  victims_mk,
  victims_en,
  victims_sq,

  overwrite = TRUE,
  internal = TRUE
)






