#' tipCheck UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tipCheck_ui <- function(id){
  ns <- NS(id)
  tagList(
    tags$table(width ="100%",
               tags$th("File Check Output", colspan="3", style="font-size:20px; color:#7ab567;")),
    htmlOutput(ns('fileChecking')),
    
    tags$hr(style="border-color: #99b6d8;"),
    tags$table(width ="100%",
               tags$th("Tree Display", colspan="3", style="font-size:20px; color:#7ab567;")),
    tags$hr(style="border-color: #99b6d8;")
  )
}

#' tipCheck Server Function
#'
#' @noRd 
mod_tipCheck_server <- function(input, output, session, metaFileOut, metaSep, geneFileOut, geneSep, treeFileOutTips){
  ns <- session$ns
  
  #this will render the output from the sanity function found in the golem_utils_server.R file
  #and takes in 5 reactive files - tree, genetic distance, genetic distance seperator, meta data, and meta data seperartor
  output$fileChecking <- renderUI({
    ns <- session$ns
    if (is.null(treeFileOutTips())) { 
      return(HTML('<span style="color:gray">Please upload a tree file</span>'))
    } else if (is.null(geneFileOut())){
      return(HTML('<span style="color:gray">Please upload a genetic distance file</span>'))
    } else if (is.null(metaFileOut())){
      return(HTML('<span style="color:gray">Please upload a meta data file</span>'))
      } else {
        sanity(
          impTree = treeFileOutTips(),
          impGene = geneFileOut(),
          genSep = geneSep(),
          impMeta = metaFileOut(),
          metSep = metaSep()
        )
      } 
  })
}

## To be copied in the UI
# mod_tipCheck_ui("tipCheck_ui_1")

## To be copied in the server
# callModule(mod_tipCheck_server, "tipCheck_ui_1")
