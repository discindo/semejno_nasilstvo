% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrangle.R
\name{get_victims_by_sector}
\alias{get_victims_by_sector}
\title{Wrangle `Сторители и жртви на КД по СВР`}
\usage{
get_victims_by_sector(path, lang)
}
\arguments{
\item{path}{path (local or url) to the excel file}

\item{lang}{A 2-letter language code, "mk", "sq", or "en"}
}
\description{
Wrangle `Сторители и жртви на КД по СВР`
}
\details{
This is the second sheet in the quarterly report in excel file
published by the Macedonian Ministry of Internal Affairs
}
\examples{
\dontrun{
  path <- "../data-raw/semejno-za-open-data-od-januari-do-mart-2022.xlsx"
  get_victims_by_sector(path = path, lang = "sq")
  get_victims_by_sector(path = path, lang = "mk")
  get_victims_by_sector(path = path, lang = "en")
}

}
