# Module UI
  
#' @title   mod_downloadImage_ui and mod_downloadImage_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_downloadImage
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_downloadImage_ui <- function(id){
  ns <- NS(id)
  tagList(
    selectInput("format","Choose file format",
                choices = list("pdf","png"))
  )
}
    
# Module Server
    
#' @rdname mod_downloadImage
#' @export
#' @keywords internal
    
mod_downloadImage_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_downloadImage_ui("downloadImage_ui_1")
    
## To be copied in the server
# callModule(mod_downloadImage_server, "downloadImage_ui_1")
 