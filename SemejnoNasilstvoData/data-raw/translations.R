##### --- Translation tables --- #####

colnames_translation_table <- function() {
  mk <- stringr::str_to_sentence(c(
    "Член од кривичен законик",
    "Законска инкриминација",
    "Сектор",
    "Број",
    "Тип",
    "Група",
    "Член од прекршочен законик",
    "Прекршок",
    "Категорија",
    "Поплака"
  ))

  sq <- stringr::str_to_sentence(c("Neni i Kodit Penal",
                                   "Inkriminimi ligjor",
                                   "Sektor",
                                   "Numri",
                                   "Lloji",
                                   "Grupi",
                                   "Neni i Kodit të Kundërvajtjes",
                                   "Fyerje",
                                   "Kategori",
                                   "Ankesa"))

  en <- stringr::str_to_sentence(c(
    "Criminal Code Article",
    "Legal Incrimination",
    "Sector",
    "Number",
    "Type",
    "Group",
    "Misdemeanor Code Article ",
    "Misdemeanor",
    "Category",
    "Complaint"
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

misdemeanor_translation_table <- function() {

  mk <- stringr::str_to_sentence(
    c(
      "Малтретирање на друг во стан",
      "Физички напад",
      "Учество во тепачка",
      "Карање и викање на јавно место",
      "Оддавање на пијанство на јавно место"
    )
  )

  sq <- stringr::str_to_sentence(
    c(
      "Ngacmimi i një tjetri në një apartament",
      "Sulm fizik",
      "Pjesëmarrja në një luftë",
      "Qortimi dhe bërtitja në një vend publik",
      "Të kënaqesh me dehjen në një vend publik"
    )
  )

  en <- stringr::str_to_sentence(
    c(
      "Harassment of another in an apartment",
      "Physical Assault",
      "Participation in a fight",
      "Scolding and shouting in a public place",
      "Indulging in drunkenness in a public place"
    )
  )

  data.frame(mk, sq, en)
}

misdemeanor_tt <- misdemeanor_translation_table()

misdemeanor_article_translation_table <- function() {
  mk <- stringr::str_to_sentence(c(
    "член 7",
    "член 12",
    "член 11",
    "член 4",
    "член 6",
    "Останати прекршоци"
  ))

  sq <- stringr::str_to_sentence(c(
    "Neni 7",
    "Neni 12",
    "Neni 11",
    "Neni 4",
    "Neni 6",
    "Shkëlqime të tjera"
  ))

  en <- stringr::str_to_sentence(c(
    "Article 7",
    "Article 12",
    "Article 11",
    "Article 4",
    "Article 6",
    "Other misdemeanos"
  ))

  data.frame(mk, sq, en)
}

misdemeanor_article_tt <- misdemeanor_article_translation_table()

violation_category_translation_table <- function() {
  mk <- stringr::str_to_sentence(
    c("Вкупен број на прекршоци во врска со семејно насилство од јануари до март 2022 година",
      "Скопје", "Битола", "Велес", "Куманово",
      "Охрид", "Струмица", "Тетово", "Штип",
      "Сторители", "Сторители - мажи", "Сторители - жени",
      "Жртви", "Жртви - мажи", "Жртви - жени",
      "Жртвата е сопруга на сторителот",
      "Жртвата е сопруг на сторителот", "Жртвата е дете на сторителот",
      "Жртвата е родител на сторителот",
      "Жртвата е поранешен брачен другар на сторителот",
      "Жртвата е лице во вонбрачна заедница со сторителот",
      "Жртви - останати (мажи и жени)", "Прекршокот  е извршен со огнено оружје",
      "Прекршокот  е извршен со ладно оружје",
      "Прекршокот  е извршен со физичка сила",
      "Останати начини на извршување на прекршокот"
    )
  )

  sq <- stringr::str_to_sentence(
    c("Numri i përgjithshëm i veprave penale të dhunës në familje nga janari deri në mars 2022",
      "Shkup", "Manastir", "Veles", "Kumanovë",
      "Ohri", "Strumicë", "Tetova", "Shtip",
      "Autorët", "Autorët - Mashkull", "Autorët - Femër",
      "Viktimat", "Viktimat - Mashkull", "Viktimat - Femra",
      "Viktima është gruaja e autorit",
      "Viktima është bashkëshorti i autorit",
      "Viktima është fëmija i autorit",
      "Viktima është prindi i autorit",
      "Viktima është ish-bashkëshortja e autorit",
      "Viktima është person në bashkësi jashtëmartesore me autorin",
      "Viktimat - të tjerë (burra dhe gra)", "Vepra penale është kryer me armë zjarri",
      "Veprimi është kryer me armë të ftohtë",
      "Veprimi është kryer me forcë fizike",
      "Mënyra të tjera të kryerjes së veprës penale"
    )
  )

  en <- stringr::str_to_sentence(
    c("Total number of domestic violence offenses from January to March 2022",
      "Skopje", "Bitola", "Veles", "Kumanovo",
      "Ohrid", "Strumica", "Tetovo", "Stip",
      "Perpetrators", "Perpetrators - Male", "Perpetrators - Female",
      "Victims", "Victims - Male", "Victims - Female",
      "The victim is the perpetrator's wife",
      "The victim is the perpetrator's husband",
      "The victim is the perpetrator's child",
      "The victim is the parent of the perpetrator",
      "The victim is the ex-spouse of the perpetrator",
      "The victim is a person in an extramarital union with the perpetrator",
      "Victims - others (men and women)", "The offense was committed with a firearm",
      "The offense was committed with a cold weapon",
      "The offense was committed with physical force",
      "Other ways of committing the offense"
    )
  )

  data.frame(mk, sq, en)
}

violation_category_tt <- violation_category_translation_table()

complaint_translation_table <- function() {

  mk <- stringr::str_to_sentence(c("Вкупен број на поплаки од јануари до март 2022 година",
          "Физичко малтретирање", "Психичко малтретирање",
          "Економско малтретирање", "Вкупен број на сторители",
          "Сторители - мажи", "Сторители - жени",
          "Сторителот бил под дејство на алкохол",
          "Сторителот бил под дејство на дрога",
          "Сторителот бил под дејство на растројство",
          "Вкупен број на жртви", "Жртви - мажи",
          "Жртви - жени", "Жртвата е сопруга на сторителот",
          "Жртвата е сопруг на сторителот", "Жртвата е дете на сторителот",
          "Жртвата е родител на сторителот",
          "Жртвата е поранешен брачен другар на сторителот",
          "Жртвата е лице во вонбрачна заедница со сторителот",
          "Жртви - останати (мажи и жени)"))

  sq <-
    stringr::str_to_sentence(
      c(
        "Numri total i ankesave nga janari deri në mars 2022",
        "Abuzim fizik",
        "Abuzim mendor",
        "Ngacmim ekonomik",
        "Numri total i autorëve",
        "Autorët - meshkuj",
        "Autorët - femra",
        "Autori ka qenë nën efektin e alkoolit",
        "Autori ka qenë nën efektin e drogës",
        "Autori ka qenë nën ndikimin e çrregullimit",
        "Numri i përgjithshëm i viktimave",
        "Viktimat - burra",
        "Viktimat – femra",
        "Viktima është gruaja e autorit",
        "Viktima është bashkëshorti i autorit",
        "Viktima është fëmija i autorit",
        "Viktima është prindi i autorit",
        "Viktima është ish - bashkëshortja e autorit",
        "Viktima është person në bashkësi jashtëmartesore me autorin",
        "Viktimat - Të tjera (Mashkull dhe Femra)"
      )
    )

  en <-
    stringr::str_to_sentence(
      c(
        "Total number of complaints from January to March 2022",
        "Physical abuse",
        "Mental abuse",
        "Economic harassment",
        "Total number of perpetrators",
        "Perpetrators - men",
        "Perpetrators - women",
        "The perpetrator was under the influence of alcohol",
        "The perpetrator was under the influence of drugs",
        "The perpetrator was under the influence of a disorder",
        "Total number of victims",
        "Victims - men",
        "Victims - women",
        "The victim is the perpetrator's wife",
        "The victim is the perpetrator's husband",
        "The victim is the perpetrator's child",
        "The victim is the parent of the perpetrator",
        "The victim is the ex-spouse of the perpetrator",
        "The victim is a person in an extramarital union with the perpetrator",
        "Victims - Other (Male and Female)"
      )
    )

  data.frame(mk, sq, en)
}

complaint_tt <- complaint_translation_table()

##### --- Collate the data --- #####

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

###### --- Translations of the third sheet --- #####

misdemeanors_mk <- purrr::map_dfr(paths, get_misdemeanors_by_sector, lang = "mk", .id = "Квартал")
misdemeanors_en <- purrr::map_dfr(paths, get_misdemeanors_by_sector, lang = "en", .id = "Quarter")
misdemeanors_sq <- purrr::map_dfr(paths, get_misdemeanors_by_sector, lang = "sq", .id = "Tremujori")

###### --- Translations of the fourth sheet --- #####

complaints_mk <- purrr::map_dfr(paths, get_complaints_by_sector, lang = "mk", .id = "Квартал")
complaints_en <- purrr::map_dfr(paths, get_complaints_by_sector, lang = "en", .id = "Quarter")
complaints_sq <- purrr::map_dfr(paths, get_complaints_by_sector, lang = "sq", .id = "Tremujori")

##### --- Use it! --- #####

usethis::use_data(
  sector_tt,
  article_tt,
  offense_tt,
  colnames_tt,

  type_tt,
  group_tt,
  misdemeanor_tt,
  misdemeanor_article_tt,
  violation_tt,
  violation_article_tt,
  violation_category_tt,

  complaint_tt,

  crimes_mk,
  crimes_en,
  crimes_sq,

  victims_mk,
  victims_en,
  victims_sq,

  misdemeanors_mk,
  misdemeanors_en,
  misdemeanors_sq,

  complaints_mk,
  complaints_en,
  complaints_sq,

  overwrite = TRUE,
  internal = TRUE
)

