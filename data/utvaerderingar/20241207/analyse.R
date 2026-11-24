#!/bin/env Rscript

t_grades <- readr::read_delim(
  file = "results.ssv",
  delim = ";"
)



ggplot2::ggplot(
  t_grades, ggplot2::aes(x = betyg)
) + ggplot2::geom_vline(xintercept = mean(t_grades$betyg), lty = "dashed") +
  ggplot2::geom_histogram(binwidth = 0.1) +
  ggplot2::scale_x_continuous(limits = c(0.0, 5.1)) +
  ggplot2::labs(
    title = "Grades",
    caption = paste0(
      "n: ", nrow(t_grades), " \n",
      "Vertical dashed line: average"
    )
    
  )
  
ggplot2::ggsave("grades.png", width = 7, height = 7)
