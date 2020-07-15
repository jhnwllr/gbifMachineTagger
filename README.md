

# GBIF machine tagger 

## Installation 

```R 

devtools::install_github("jhnwllr/gbifMachineTagger")

```


## Example usage

```R

library(gbifMachineTagger)
library(dplyr)
library(purrr)

# get exsisting machine tag data 
getMachineTagData("default-term.gbif.org",api="http://api.gbif-uat.org/v1/dataset?") %>%
filter(name == "coordinateUncertaintyInMeters") 

getMachineTagData("griddedDataSet.jwaller.gbif.org")
getMachineTagData("citizenScience.mgrosjean.gbif.org")

getMachineTagData("griddedDataSet.jwaller.gbif.org") %>% 
jsonValuesToColumns() # no nested json 

# need permission to create machine tags 
load("C:/Users/ftw712/Desktop/griddedDatasets/authentication.rda")

createMachineTag(
datasetkey="38b4c89f-584c-41bb-bd8f-cd1def33e92f",
namespace="testMachineTag.jwaller.gbif.org",
name="testMachineTag",
value=1,
embedValueList=FALSE,
authentication$user,
authentication$password,
api="http://api.gbif-uat.org/v1/dataset/") 

getMachineTagData("testMachineTag.jwaller.gbif.org",api="http://api.gbif-uat.org/v1/dataset?") %>% 
jsonValuesToColumns() # no nested json 

createMachineTag(
datasetkey="38b4c89f-584c-41bb-bd8f-cd1def33e92f",
namespace="testMachineTag.jwaller.gbif.org",
name="testMachineTag",
value=list(1,2,3,4),
embedValueList=TRUE,
user = authentication$user,
password = authentication$password,
api="http://api.gbif-uat.org/v1/dataset/") 

# add list column 
getMachineTagData("testMachineTag.jwaller.gbif.org",api="http://api.gbif-uat.org/v1/dataset?") %>% 
mutate(list_column = map(value, ~ jsonlite::fromJSON(.x)))


# deleting 1 machine tag 
data_to_delete = getMachineTagData("testMachineTag.jwaller.gbif.org",api="http://api.gbif-uat.org/v1/dataset?") %>%
purrr::transpose() %>% # convert to named-list
pluck(1) 

data_to_delete

deleteMachineTag(
datasetkey=data_to_delete$datasetkey,
keysToDelete = data_to_delete$key,
user = authentication$user,
password = authentication$password,
api="http://api.gbif-uat.org/v1/dataset/"
)
 
# delete many machine tags 

data_to_delete = getMachineTagData("testMachineTag.jwaller.gbif.org",api="http://api.gbif-uat.org/v1/dataset?")

data_to_delete

deleteAllMachineTags(
data_to_delete,
authentication,
api="http://api.gbif-uat.org/v1/dataset/") 


```





