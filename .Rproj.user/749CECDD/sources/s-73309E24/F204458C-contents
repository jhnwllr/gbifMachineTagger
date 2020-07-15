
# get machine tag data

getMachineTagData = function(namespace=NULL,api="http://api.gbif.org/v1/dataset?") {

  # http://api.gbif-uat.org/v1/dataset?
  # "http://api.gbif.org/v1/dataset?"
  url = api %+% "machineTagNamespace=" %+% namespace

  L = gbifapi::page_api(url,pluck="results",Step=1000,maxPages=30,verbose=FALSE) # long nested list of dataset info

  datasetkey = L %>%
    map_chr(~ .x$key)

  # Start processing maching tags
  machineTags = L %>%
    map(~ .x$machineTags)

  # get nested data
  key = namespace_source = machineTags %>%
    map(~ .x %>% map(~ .x$key))

  namespace_source = machineTags %>%
    map(~ .x %>% map(~ .x$namespace))

  value = machineTags %>%
    map(~ .x %>% map(~ .x$value))

  name = machineTags %>%
    map(~ .x %>% map(~ .x$name))

  createdBy = machineTags %>%
    map(~ .x %>% map(~ .x$createdBy))

  created = machineTags %>%
    map(~ .x %>% map(~ .x$created))

  # put list columns into a tibble
  D = tibble(datasetkey,key,namespace = namespace_source,name,value,createdBy,created) %>%
    tidyr::unnest(cols = c(key,namespace,name,value,createdBy,created)) %>% # unnest data twice
    tidyr::unnest(cols = c(key,namespace,name,value,createdBy,created)) %>%
    filter(namespace == !!namespace) # get only the machineTag namespace you are intersted in

    return(D)
}


