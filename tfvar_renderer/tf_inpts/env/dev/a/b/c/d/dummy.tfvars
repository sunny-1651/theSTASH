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


