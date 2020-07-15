


deleteMachineTag = function(datasetkey,keysToDelete,user,password,api="http://api.gbif.org/v1/dataset/") { # delete all machine tags with namespace

  responseList = keysToDelete %>% map(~ DELETE(api %+% datasetkey %+% "/machineTag/" %+% .x,authenticate(user,password)))
  print(responseList)
}

deleteAllMachineTags = function(data_to_delete,authentication,api="http://api.gbif.org/v1/dataset/") {

  # api = "http://api.gbif-uat.org/v1/dataset/"

  data_to_delete %>%
  purrr::transpose() %>%
  map(~ deleteMachineTag(
  datasetkey=.x$datasetkey,
  keysToDelete = .x$key,
  api=api,
  user=authentication$user,
  password=authentication$password))

  }






