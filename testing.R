library(googleComputeEngineR)
library(future)

## set up and authenticate etc
googleAuthR::gar_gce_auth()

## get tag name of public pre-made image
tag <- gce_tag_container("google-auth-r-cron-tidy", project = "gcer-public")

## rstudio template, but with custom rstudio build with cron, googleAuthR etc. 
vm <- gce_vm("rstudio-cron-googleauthr", 
             predefined_type = "n1-standard-1",
             template = "rstudio", 
             dynamic_image = tag, 
             username = "mark", 
             password = "mark1234")

vm1 <- gce_vm("cluster1", template = "r-base")
vm2 <- gce_vm("cluster2", template = "r-base")
vm3 <- gce_vm("cluster2", template = "r-base")

plan(cluster, workers = list(vm1, vm2, vm3))

## use future's %<-% to send a function to the cluster
si %<-% Sys.info()
print(si)

## tidy up
lapply(vms, FUN = gce_vm_stop)