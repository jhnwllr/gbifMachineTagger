
# used to create machine tags

createMachineTag = function(datasetkey,namespace,name,value,embedValueList=FALSE,user,password,api="http://api.gbif.org/v1/dataset/") { # create a machineTag

  if(embedValueList) value = value %>% jsonlite::toJSON(auto_unbox=TRUE) # use this to embed json into a string

  machineTag = list(namespace=namespace,name=name,value=value) # create list for machine tag

  url = api %+% datasetkey %+% "/machineTag"
  # need to encode json so that the list gets translated into json
  response = httr::POST(url,authenticate(user,password),body=machineTag,encode="json") # post request to gbif api

  print(url)
  print(datasetkey)
  print(http_status(response)$category) # print if was successful
  return(http_status(response)$category)
}


