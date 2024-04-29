locals {
  github_org  = "apor-tv2"
}

module "aft" {
  source                                          = "aws-ia/control_tower_account_factory/aws"
  version                                         = " = 1.12.2"



  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region


  # Optional Parameters
  terraform_distribution                          = "oss"  

  # Optional Feature Flags
  aft_feature_delete_default_vpcs_enabled         = true
  aft_feature_cloudtrail_data_events              = false
  aft_feature_enterprise_support                  = false # CAREFUL HERE
  aft_vpc_endpoints                               = false

  vcs_provider                                  = "github"




  account_customizations_repo_branch              = "main"
  account_provisioning_customizations_repo_branch = "main"
  account_request_repo_branch                     = "main"
  global_customizations_repo_branch               = "main"
  account_request_repo_name                     = "${local.github_org}/sbx-terraform-aft-account-request"
  account_provisioning_customizations_repo_name = "${local.github_org}/sbx-terraform-aft-account-provisioning-customizations"
  global_customizations_repo_name               = "${local.github_org}/sbx-terraform-aft-global-customizations"
  account_customizations_repo_name              = "${local.github_org}/sbx-terraform-aft-account-customizations"
}
