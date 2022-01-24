
#' @title get_tables
#'
#' @description A function that grabs all html tables found on a url and puts
#'     each table in a tibble, and all tibbles in a list.
#'
#' @param wikipediaurl A url on Wikipedia, including https://
#'
#' @return A list of tibbles
#'
#' @examples
#' list_of_tibbles <- get_tables("https://en.wikipedia.org/wiki/Kentucky_Derby")
#' my_tibble <- list_of_tibbles[[2]]
#'
#' @export
get_tables <- function(wikipediaurl) {
  htmlpage   <- rvest::read_html(wikipedia_url)
  htmltables <- rvest::html_table(x = htmlpage)
  if (class(htmltables) != "list") {
    if (class(htmltables) == c("tbl_df", "tbl", "data.frame")) {
      return(list(htmltables))
    } else {
      stop("Expected a list of tibbles or a tibble - got ", paste0(class(htmltable), collapse=", "))
    }
  }
  return(htmltables)
}

