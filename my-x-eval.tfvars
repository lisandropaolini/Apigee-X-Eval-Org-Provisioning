peering_range       = "10.0.0.0/21"
instance_cidr       = "10.0.0.0/22"
network             = "apigee-vpc"
analytics_region    = "europe-west1"
runtime_region      = "europe-west6"
apigee_environments = ["eval1", "eval2"]
apigee_envgroups = {
  eval = {
    environments = ["eval1", "eval2"]
    hostnames    = ["eval.api.example.com"]
  }
}