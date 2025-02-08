# Content from folder: tf_inpts/region/asse2/dev/static/b.tfvars
tags = {
  agency-code = "reg - asse2"
}

# Content from folder: tf_inpts/env/dev/static/a.tfvars
gcp_project_id = "my-project"

cluster_name = "my-cluster"

gcp_location = "europe-west1"

daily_maintenance_window_start_time = "03:00"

vpc_network_name = "vpc-network"

vpc_subnetwork_name = "vpc-subnetwork"

vpc_subnetwork_cidr_range = "10.0.0.0/20"

cluster_secondary_range_name = "pods"

cluster_secondary_range_cidr = "10.5.0.0/12"

services_secondary_range_name = "services"

services_secondary_range_cidr = "10.50.0.0/20"

master_ipv4_cidr_block = "172.16.0.0/28"

access_private_images = "false"

http_load_balancing_disabled = "false"

node_pool = {
# Content from folder: tf_inpts/env/dev/node_pool/t.tfvars
  name                       = "default"
  initial_node_count         = 1
  autoscaling_min_node_count = 2
  autoscaling_max_node_count = 3
  management_auto_upgrade    = true
  management_auto_repair     = true
  node_config_machine_type   = "e1-standard-1"
  node_config_disk_type      = "pd-standard"
  node_config_disk_size_gb   = 100
  node_config_preemptible    = false
}
a = {
  b = {
    c = {
      d = {
# Content from folder: tf_inpts/env/dev/a/b/c/d/dummy.tfvars
        master_authorized_networks_cidr_blocks = [
          {
            cidr_block = "0.0.0.0/0"
        
            display_name = "default"
          },
        ]
        
        identity_namespace = "my-project.svc.id.goog"
        
        launchpad_key_names = {
        }
        
        resource_groups = {
          level0 = {
            name = "rg-n-gven-p-eztflvl0"
            tags = {
              level        = "level0"
              project-code = "ven"
              env          = "prd"
              purpose      = "CAF base setup for VEEN level 0 resource group"
            }
          }
          level1 = {
            name = "rg-n-gven-p-eztflvl1"
            tags = {
              level        = "level1"
              project-code = "ven"
              env          = "prd"
              purpose      = "CAF base setup for VEEN level 1 resource group"
            }
          }
          level2 = {
            name = "rg-n-gven-p-eztflvl2"
            tags = {
              level        = "level2"
              project-code = "ven"
              env          = "prd"
              purpose      = "CAF base setup for VEEN level 2 resource group"
            }
          }
          level3 = {
            name = "rg-n-gven-p-eztflvl3"
            tags = {
              level        = "level3"
              project-code = "ven"
              env          = "prd"
              purpose      = "CAF base setup for VEEN level 3 resource group"
            }
          }
          level4 = {
            name = "rg-n-gven-p-eztflvl4"
            tags = {
              level        = "level4"
              project-code = "ven"
              env          = "prd"
              purpose      = "CAF base setup for VEEN level 4 resource group"
            }
          }
          ven = {
            name = "rg-n-gven-p-eztfveen"
            tags = {
              level        = "ven"
              project-code = "ven"
              env          = "prd"
              purpose      = "CAF base setup for VEEN resource group"
            }
          }
        }
        default_region = "region1"
        
        
      }
    }
  }
}
launchpad_key_names = {
# Content from folder: tf_inpts/env/dev/launchpad_key_names/dummy.tfvars
  tfstates = [
    "level0",
    "level1",
    "level2",
    "level3",
    "level4",
    "ven"
  ]
}
