# Module UI

#' @title   mod_displayTree_ui and mod_displayTree_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_displayTree
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_displayTree_ui <- function(id, label = "Display Tree"){
  ns <- NS(id)
  tagList(
    label,
    plotOutput(ns("treeDisplay"))
  )}

# Module Server

#' @rdname mod_displayTree
#' @export
#' @keywords internal

mod_displayTree_server <- function(input, output, session, treeFile, align, numscale, treeformat, font, node){
  ns <- session$ns
  
  make_tree <- reactive({
    ggtree::ggtree(treeFile(), layout = treeformat())+
      ggtree::geom_tiplab(align = align(), fontface = font()) + 
      ggtree::geom_treescale(width = numscale())+
      ggtree::geom_text2(ggtree::aes(label=label, subset=!is.na(as.numeric(label)) & label >node()), nudge_x = 0.0002)+
      ggtree::theme_tree()
  })
  
  output$treeDisplay <- renderPlot({
    make_tree()
  })
  
  annoated <- reactive({
    make_tree()
  })
  
  return(annoated)
}

## To be copied in the UI
# mod_displayTree_ui("displayTree_ui_1")

## To be copied in the server
# callModule(mod_displayTree_server, "displayTree_ui_1"