# no nested json values

jsonValuesToColumns = function(d) {

  dd = d %>%
    pull(value) %>%
    map(~ jsonlite::fromJSON(.x)) %>% # convert JSON string into R list
    map(~ tibble::enframe(.x)) %>% # convert into tibble
    map(~ tidyr::spread(.x,name,value)) %>% # rearrange tibble
    plyr::rbind.fill() %>%
    cbind(d,.)

  dd
}

