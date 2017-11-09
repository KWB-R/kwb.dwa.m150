# read_xml_dwa_m150 ------------------------------------------------------------

#' Read XML file coded as described in DWA-M 150
#' 
#' @param xml path to XML file
#' @param encoding encoding used in the XML file, passed to
#'   \code{\link[xml2]{read_xml}}
#'   
#' @return list with elements \code{fd}, \code{hg}, \code{hi}, \code{hz}, each
#'  of which is a data frame containing the corresponding data as described
#'  in DWA-M150
#' 
#' @export
#' 
#' @examples
#' xml <- system.file("extdata/example.xml", package = "kwb.dwa.m150")
#' content <- read_xml_dwa_m150(xml)
#' 
#' str(content)
#' 
read_xml_dwa_m150 <- function(xml, encoding = "ISO-8859-1")
{
  x <- xml2::read_xml(xml, encoding = encoding)
  
  fd_data <- get_as_data_frame(x, xpath = "./FD", get_field_names("fd"))
  hg_data <- get_as_data_frame(x, xpath = "./HG", get_field_names("hg"))
  hi_data <- get_as_data_frame(x, xpath = "./HG/HI", get_field_names("hi"))
  hz_data <- get_as_data_frame(x, xpath = "./HG/HI/HZ", get_field_names("hz"))
  
  list(
    fd = fd_data, 
    hg = set_id_columns(data = hg_data, key_types <- "hg"), 
    hi = set_id_columns(data = hi_data, key_types <- "hg"), 
    hz = set_id_columns(data = hz_data, key_types <- c("hg", "hz"))
  )
}

# set_id_columns ---------------------------------------------------------------
set_id_columns <- function(data, key_types)
{
  id_list <- lapply(
    key_types, 
    extract_index, 
    text = kwb.utils::selectColumns(data, "xpath")
  )
  
  names(id_list) <- paste0(key_types, "_id")
  
  do.call(cbind, c(id_list, list(kwb.utils::removeColumns(data, "xpath"))))
}

# extract_index ----------------------------------------------------------------
extract_index <- function(text, type)
{
  matches <- kwb.utils::subExpressionMatches(
    regularExpression = paste0(toupper(type), "\\[(\\d+)\\]"),
    text = text
  )
  
  as.integer(sapply(matches, getElement, 1))
}

# get_as_data_frame ------------------------------------------------------------
get_as_data_frame <- function(x, xpath, fields)
{
  result <- lapply(kwb.utils::toNamedList(fields), function(field) {
    nodes <- xml2::xml_find_all(x, paste0(xpath, "/", field))
    xml2::xml_text(nodes)
  })
  
  result <- do.call(data.frame, c(result, stringsAsFactors = FALSE))
  
  xpaths <- xml2::xml_path(xml2::xml_find_all(x, xpath))
  
  data.frame(xpath = xpaths, result, stringsAsFactors = FALSE)
}

# get_field_names --------------------------------------------------------------
get_field_names <- function(type = NULL)
{
  fields <- list(
    
    fd = c(
      "FD001", "FD002"
    ),
    
    hg = c(
      "HG001", "HG003", "HG004", "HG101", "HG102", "HG103", "HG104", "HG106", 
      "HG301", "HG302", "HG304", "HG305", "HG306", "HG307", "HG308", "HG309", 
      "HG310", "HG313", "HG314", "HG315", "HG316", "HG401", "HG404", "HG407", 
      "HG999"
    ),
    
    hi = c(
      "HI001", "HI002", "HI004", "HI005", "HI006", "HI007", "HI008", "HI101", 
      "HI102", "HI103", "HI104", "HI105", "HI107", "HI109", "HI111", "HI112", 
      "HI113", "HI114", "HI115", "HI116", "HI117", "HI201", "HI202", "HI203", 
      "HI999"
    ),
    
    hz = c(
      "HZ001", "HZ002", "HZ014", "HZ015", "HZ003", "HZ004", "HZ005", "HZ006",
      "HZ007", "HZ008", "HZ009", "HZ010", "HZ011", "HZ017", "HZ201", "HZ202",
      "HZ203", "HZ999"
    )
  )
  
  if (is.null(type)) {
    
    fields
    
  } else {
    
    kwb.utils::selectElements(fields, type)
  }
}
