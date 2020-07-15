


updateAllMachineTags = function(D,api,namespace,name,value,authentication,embedValueList=FALSE) {

  L = D %>% transpose() # turn data.frame into a list to feed into map createMachineTag

  L %>% map(~ createMachineTag(datasetkey = .x$datasetkey,
                               api = api,
                               namespace = namespace,
                               name = name,
                               value = .x[[value]],
                               embedValueList=embedValueList,
                               user = authentication$user,
                               password = authentication$password))
}

