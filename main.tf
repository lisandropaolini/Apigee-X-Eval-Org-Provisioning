module "vpc" {
  source     = "github.com/terraform-google-modules/cloud-foundation-fabric//modules/net-vpc?ref=v14.0.0"
  project_id = var.project_id
  name       = var.network
  psa_ranges = {
    apigee-range = var.peering_range
  }
}

module "apigee" {
  source              = "github.com/terraform-google-modules/cloud-foundation-fabric//modules/apigee-organization?ref=v14.0.0"
  project_id          = var.project_id
  analytics_region    = var.analytics_region
  runtime_type        = "CLOUD"
  authorized_network  = module.vpc.network.id
  apigee_environments = var.apigee_environments
  apigee_envgroups    = var.apigee_envgroups
}

module "apigee-x-instance" {
  source              = "github.com/terraform-google-modules/cloud-foundation-fabric//modules/apigee-x-instance?ref=v14.0.0"
  apigee_org_id       = module.apigee.org_id
  name                = "my-eval-instance"
  region              = var.runtime_region
  ip_range            = var.instance_cidr
  apigee_environments = var.apigee_environments
}