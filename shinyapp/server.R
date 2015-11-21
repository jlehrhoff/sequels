############
## Server ##
############

shinyServer(function(input,output) {
  
  ###########
  ## Tab 1 ##
  ###########
  
  output$intro <- renderPlot({
    switch(input$summary, "They\'re just better!" = ggplot(data=summary, aes(y=rating, x=Sequel, fill=Sequel)) + 
             geom_bar(stat = 'identity', position = 'dodge') +
             theme_bw() + ylab('Rotten Tomatoes Rating (0-100)') + 
             scale_fill_manual(values = c('indianred3','darkolivegreen3')) +
             theme(axis.title = element_text(size = 24), axis.text = element_text(size=18), #title = element_text(size=30),
                   legend.position="none"),
 
           input$summary, "More people see them" = ggplot(data=summary, aes(y=gross, x=Sequel, fill=Sequel)) + 
             geom_bar(stat = 'identity', position = 'dodge') +
             theme_bw() + ylab('Lifetime Gross (Millions of $)') + 
             scale_fill_manual(values = c('indianred3','darkolivegreen3')) +
             theme(axis.title = element_text(size = 24), axis.text = element_text(size=18), #title = element_text(size=30),
                   legend.position="none")     
           
            )}, height = 580, width = 740)
    
  
  ########### 
  ## Tab 2 ##
  ###########
  
  ###############
  ## Select DF ##
  ############### 
  
  data <- reactive({switch(input$data,
                           "daily" = movies,
                           "lifetime" = grossrating)
  })
  
  ###################
  ## Filter Movies ##
  ###################
  
  moviefilter <- reactive({
    if (!is.null(input$movie) && input$movie != "") {
      return(filter(data(), Title %in% as.vector(input$movie)) %>% as.data.frame(.)) }
    else 
      {return(data()) }
    })
  
  #####################################
  ## Output Graph Based on Selection ##
  #####################################
  
  ###########
  ## Daily ##
  ###########
  
  output$totals <- renderPlot({
    if (input$data == "daily") {
      if (input$measure1 == "Daily Gross") {
        ggplot(data = moviefilter(), aes(x=Days, y=Gross, color = Title)) +
          geom_point(size = 4) +
          geom_line(size = 1) +
          theme_bw() + xlab('Days in Theaters') + ylab('Daily Gross (Millions of $)') +
          theme(legend.direction = "vertical", legend.position = "bottom") +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.text = element_text(size = 20), legend.title = element_blank()) +
          scale_x_continuous(breaks=seq(1,31,7)) }

      else if ((input$measure1 == "Total Gross")) {   
        ggplot(data = moviefilter(), aes(x=Days, y=TotalGross, color = Title)) +
          geom_point(size = 4) +
          geom_line(size = 1) +
          theme_bw() + xlab('Days in Theaters') + ylab('Total Gross (Millions of $)') +
          theme(legend.direction = "vertical", legend.position = "bottom") +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.text = element_text(size = 20), legend.title = element_blank()) +
          scale_x_continuous(breaks=seq(1,31,7)) }

      else {
        ggplot(data = moviefilter(), aes(x=Days, y=Rank, color = Title)) +
          geom_point(size = 4) +
          geom_line(size = 1) +
          theme_bw() + xlab('Days in Theaters') + ylab('Box Office Rank') +
          theme(legend.direction = "vertical", legend.position = "bottom") +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.text = element_text(size = 20), legend.title = element_blank()) +
          scale_x_continuous(breaks=seq(1,31,7)) }
    }
    
    ##############
    ## Lifetime ##
    ##############
    
    else {

    if (input$measure2 == "Lifetime Gross") {
      ggplot(data=moviefilter(), aes(x=Title, y=Lifetime.Gross, fill = Title)) +
        geom_bar(stat = 'identity', position = 'dodge') +
        theme_bw() + ylab('Lifetime Gross (Millions of $)') +
        theme(axis.title.y = element_text(size = 24), axis.title.x = element_blank(), 
              axis.text.x = element_text(size=14, angle = 45, hjust = 1),
              axis.text.y = element_text(size=14), legend.position = "none") }
    
    else if ((input$measure2 == "Rating")) {   
    ggplot(data=moviefilter(), aes(x=Title, y=Rating, fill = Title)) +
        geom_bar(stat = 'identity', position = 'dodge') +
        theme_bw() + ylab('Rotten Tomatoes Rating (0-100)') +
        theme(axis.title.y = element_text(size = 24), axis.title.x = element_blank(), 
              axis.text.x = element_text(size=14, angle = 45, hjust = 1),
              axis.text.y = element_text(size=14), legend.position = "none") }
    
    else {
      ggplot(data=moviefilter(), aes(x=Rating, y=Lifetime.Gross, color = Title)) +
        geom_point(size=6) +
        theme_bw() + ylab("Lifetime Gross (Millions of $)") + xlab('Rotten Tomatoes Rating (0-100)') +
        theme(legend.direction = "vertical", legend.position = "bottom") +
        theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
              legend.text = element_text(size = 20), legend.title = element_blank()) +
        xlim(c(0,100)) + ylim(0,500)}
      }
  }, height = 700)

  
  ###########
  ## Tab 3 ##
  ###########
  
  ###############################
  ## Select DF of Grouped Data ##
  ###############################
  
  groupfile <- reactive({switch(input$groupfile,
                           "daily" = moviegroups,
                           "lifetime" = moviegroupstotals)
  })
  
  ##################################
  ## Filter DF for desired groups ##
  ##################################
  
  groupfilter <- reactive({
    if (!is.null(input$moviegroup1) && input$moviegroup1 != "" &&
        !is.null(input$moviegroup2) && input$moviegroup2 != "") {
      return(filter(groupfile(), Title %in% 
                      c(as.vector(input$moviegroup1), as.vector(input$moviegroup2))) 
             %>% as.data.frame(.)) }
    else 
    {return(groupfile()) }
  })
  
  #################
  ## Group 1 Pic ##
  #################
  
  pic1 <- reactive({switch(input$moviegroup1,
                          "Shailene Woodley" = "Divergent.jpg",
                          "Jennifer Lawrence" = "HungerGames.png",
                          "Divergent" = "Divergent.jpg",
                          "Chris Pratt" = "ChrisPratt.jpg",
                          "Hunger Games" = "HungerGames.png",
                          "Avengers" = "Avengers.jpg",
                          "Batman" = "Batman.jpg",
                          "Transformers" = "Transformers.jpg",
                          "Twilight" = "Twilight.jpg",
                          "Harry Potter" = "HarryPotter.jpg",
                          "The Hobbit" = "Hobbit.jpg",
                          "The Lord of the Rings" = "LOTR.jpg",
                          "Saving Matt Damon" = "Martian.jpg",
                          "Chasing Matt Damon" = "Bourne.jpg"
                          )})
  
  #################
  ## Group 1 Pic ##
  ################# 
  
  pic2 <- reactive({switch(input$moviegroup2,
                           "Shailene Woodley" = "Divergent.jpg",
                           "Jennifer Lawrence" = "HungerGames.png",
                           "Divergent" = "Divergent.jpg",
                           "Chris Pratt" = "ChrisPratt.jpg",
                           "Hunger Games" = "HungerGames.png",
                           "Avengers" = "Avengers.jpg",
                           "Batman" = "Batman.jpg",
                           "Transformers" = "Transformers.jpg",
                           "Twilight" = "Twilight.jpg",
                           "Harry Potter" = "HarryPotter.jpg",
                           "The Hobbit" = "Hobbit.jpg",
                           "The Lord of the Rings" = "LOTR.jpg",
                           "Saving Matt Damon" = "Martian.jpg",
                           "Chasing Matt Damon" = "Bourne.jpg"
  )})
  
  ##################################################
  ## Render Plots of Grouped DF by Data Selection ##
  ##################################################
  
  output$grouptotals <- renderPlot({
    if (input$groupfile == "daily") {
      if (input$measure1group == "Daily Gross") {
        ggplot(data = groupfilter(), aes(x=Days, y=mean.Gross., color = Title)) +
          geom_point(size = 4) +
          geom_line(size = 1) +
          theme_bw() + xlab('Days in Theaters') + ylab('Daily Gross (Millions of $)') +
          theme(legend.direction = "vertical", legend.position = "bottom") +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.text = element_text(size = 20), legend.title = element_blank()) +
          scale_x_continuous(breaks=seq(1,31,7)) + 
          labs(title = paste("Team", input$moviegroup1, "vs.", "Team", input$moviegroup2))}
      
      else if ((input$measure1group == "Total Gross")) {   
        ggplot(data = groupfilter(), aes(x=Days, y=mean.TotalGross., color = Title)) +
          geom_point(size = 4) +
          geom_line(size = 1) +
          theme_bw() + xlab('Days in Theaters') + ylab('Total Gross (Millions of $)') +
          theme(legend.direction = "vertical", legend.position = "bottom") +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.text = element_text(size = 20), legend.title = element_blank(),
                title = element_text(size = 20)) +
          scale_x_continuous(breaks=seq(1,31,7)) + 
          labs(title = paste("Team", input$moviegroup1, "vs.", "Team", input$moviegroup2))}
      
      ## TO DO!! Turn this into barplot of days in 1st, 2nd, 3rd, etc in box office rank
      else {
        ggplot(data = groupfilter(), aes(x=Days, y=mean.as.numeric.Rank.., color = Title)) +
          geom_point(size = 4) +
          geom_line(size = 1) +
          theme_bw() + xlab('Days in Theaters') + ylab('Box Office Rank') +
          theme(legend.direction = "vertical", legend.position = "bottom") +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.text = element_text(size = 20), legend.title = element_blank(),
                title = element_text(size = 20)) +
          scale_x_continuous(breaks=seq(1,31,7)) + 
          labs(title = paste("Team", input$moviegroup1, "vs.", "Team", input$moviegroup2))}
    }
    else {
      
      if (input$measure2group == "Lifetime Gross") {
        ggplot(data=groupfilter(), aes(x=Title, y=mean.Lifetime.Gross., fill = Title)) +
          geom_bar(stat = 'identity', position = 'dodge') +
          theme_bw() + ylab('Lifetime Gross (Millions of $)') +
          theme(axis.title.y = element_text(size = 24), axis.text = element_text(size=14), 
                axis.title.x = element_blank(), legend.position = "none") }
      
      else if ((input$measure2group == "Rating")) {   
        ggplot(data=groupfilter(), aes(x=Title, y=mean.Rating., fill = Title)) +
          geom_bar(stat = 'identity', position = 'dodge') +
          theme_bw() + ylab('Rotten Tomatoes Rating (0-100)') +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.position = "none", axis.title.x = element_blank()) }
      
      else {
        ggplot(data=groupfilter(), aes(x=mean.Rating., y=mean.Lifetime.Gross., color = Title)) +
          geom_point(size=6) +
          theme_bw() + ylab("Lifetime Gross (Millions of $)") + xlab('Rotten Tomatoes Rating (0-100)') +
          theme(axis.title = element_text(size = 24), axis.text = element_text(size=14), 
                legend.text = element_text(size = 20), legend.title = element_blank()) +
          theme(legend.direction = "vertical", legend.position = "bottom") +
          xlim(c(0,100)) + ylim(c(0,500))
          }
    }
  }, height = 700)
  
  ###############################
  ## Output Pictures And Names ##
  ###############################
  
  output$team1 <- renderText({ paste("Team", input$moviegroup1)
  })
  
  output$pic1 <- renderImage({
    filename <- normalizePath(file.path('./www', pic1()))
    list(src = filename,
         alt = pic1())
  }, deleteFile = FALSE)
 
  output$team2 <- renderText({ paste("Team", input$moviegroup2)
  })
  
  output$pic2 <- renderImage({
    filename <- normalizePath(file.path('./www', pic2()))
    list(src = filename,
         alt = pic2())
  }, deleteFile = FALSE)
  
    })
