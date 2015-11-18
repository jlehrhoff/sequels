shinyUI(navbarPage("Hollywood's Sequel Problem",
                   tabPanel("Overview",
                            fluidPage(theme = shinytheme("cosmo"),
                                      sidebarLayout(
                                        sidebarPanel(h1("What's the deal with sequels?", align = 'center'),
                                                     h3("Who's looking forward to the new Star Wars?", align = 'center'),
                                                     h3("Would you happily pay $20 to see another Avengers movie in IMAX 3D?", align = 'center'),
                                                     h3("Does anyone really think Ben Affleck will make a halfway decent Batman?", align = 'center'),
                                                     br(),
                                                     #br(),
                                                     selectInput("summary", h4(strong("Seriously, what's the deal?")),
                                                                 choices = list("","They\'re just better!","More people see them"),
                                                                 selected = "")),
                                        mainPanel(
                                          conditionalPanel(condition = 'input.summary == "They\'re just better!"',
                                                           h2("Better? That's straight up insane.", align='center')),
                                          conditionalPanel(condition = 'input.summary == "More people see them"',
                                                           h2("Yep. People", em("LOVE"), "sequels.", align = 'center')),
                                          plotOutput("intro"),
                                          br(),
                                          br(),
                                          br(),
                                          br(),
                                          br(),
                                          br(),
                                          br(),
                                          br(),
                                          conditionalPanel(condition = 'input.summary == "They\'re just better!"',
                                                           h5("* Sample 55 recent movies")),
                                          conditionalPanel(condition = 'input.summary == "More people see them"',
                                                           h5("* Sample 55 recent movies"))
                                        )))),
                   
                   tabPanel("Lifetime Gross",
                            fluidPage(theme = shinytheme("cosmo"),
                                      
                                      sidebarLayout(
                                        sidebarPanel(
                                          h2("Movies to Compare"),
                                          
                                          selectizeInput(
                                            'movie', 'Movies', choices = grossrating$Title, multiple = TRUE,
                                            selected = c("The Lord of the Rings: The Fellowship of the Ring",
                                                         "The Lord of the Rings: The Two Towers",
                                                         "The Lord of the Rings: The Return of the King")),
                                          
                                          radioButtons("data", "Data: Daily vs. Lifetime",
                                                       choices = list("daily", "lifetime")),
                                          
                                          conditionalPanel(condition = "input.data == 'daily'",
                                                           radioButtons("measure1",
                                                                        "Measure",
                                                                        choices = list(
                                                                          "Total Gross","Daily Gross", "Box Office Rank"))
                                          ),
                                          conditionalPanel(condition = "input.data == 'lifetime'",
                                                           radioButtons("measure2",
                                                                        "Measure",
                                                                        choices = list(
                                                                          "Lifetime Gross","Rating", "Both")))
                                          
                                        ),
                                        
                                        mainPanel(
                                          plotOutput('totals',
                                                     hover = "plot_hover"))
                                      ))),
                                        


                                        tabPanel("Franchise Fights",
                                                 fluidPage(theme = shinytheme("cosmo"),
                                                           
                                                           sidebarLayout(
                                                             sidebarPanel(
                                                               h2("Franchise Fights"),
                                                               
                                                               selectizeInput(
                                                                 'moviegroup1', 'Team 1', choices = moviegroupstotals$Title, 
                                                                 multiple = TRUE, options = list(maxItems = 1),
                                                                 selected = "Saving Matt Damon"),
                                                             
                                                               selectizeInput(
                                                                 'moviegroup2', 'Team 2', choices = moviegroupstotals$Title, 
                                                                 multiple = TRUE, options = list(maxItems = 1),
                                                                 selected = "Chasing Matt Damon"),
                                                               
                                                             radioButtons("groupfile", "Data: Daily vs. Lifetime",
                                                                          choices = list("daily", "lifetime")),
                                                             
                                                             conditionalPanel(condition = "input.groupfile == 'daily'",
                                                                              radioButtons("measure1group",
                                                                                           "Measure",
                                                                                           choices = list(
                                                                                             "Total Gross","Daily Gross", "Box Office Rank"))
                                                             ),
                                                             conditionalPanel(condition = "input.groupfile == 'lifetime'",
                                                                              radioButtons("measure2group",
                                                                                           "Measure",
                                                                                           choices = list(
                                                                                             "Lifetime Gross","Rating", "Both")))
                                                             
                                                             
                                                           ),
                                                           
                                                           mainPanel(
                                                             plotOutput('grouptotals'),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             br(),
                                                             fluidRow(
                                                               column(1,
                                                                      p()),
                                                               column(8,
                                                                      imageOutput('pic1')),
                                                               column(1,
                                                                      imageOutput('pic2'))
                                                                      )
                                                             )

                                                           )
                                                 )))
)