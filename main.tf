terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  cloud {
    organization = "karthik_terraform"

    workspaces {
      name = "terrahouse"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

module "home_bangalore_hosting" {
  source          = "./modules/terrahome_aws"
  user_uuid       = var.teacherseat_user_uuid
  public_path     = var.bangalore.public_path
  content_version = var.bangalore.content_version
}

resource "terratowns_home" "home_bangalore" {
  name            = "Welcome to Bangalore - Silicon Valley of India"
  description     = <<DESCRIPTION
Bangalore, officially Bengaluru, is the capital and largest city of the southern Indian state of Karnataka.
It has a population of more than 8 million and a metropolitan population of around 11 million, making it
India's third most populous city and fifth most populous urban agglomeration, as well as South India's 
second-largest urban agglomeration, and the 27th largest city in the world. Located on the Deccan Plateau,
at a height of over 900 m (3,000 ft) above sea level, Bangalore has a pleasant climate throughout the year,
with its parks and green spaces earning it the reputation of India's "Garden City".Its elevation is the highest
among India's major cities
DESCRIPTION
  domain_name     = module.home_bangalore_hosting.domain_name
  town            = "the-nomad-pad"
  content_version = var.bangalore.content_version
}

# module "home_max_hosting" {
#   source          = "./modules/terrahome_aws"
#   user_uuid       = var.teacherseat_user_uuid
#   public_path     = var.max.public_path
#   content_version = var.max.content_version
# }

# resource "terratowns_home" "home_max" {
#   name            = "Formula 1 winners - Max Verstappen"
#   description     = <<DESCRIPTION
# Max Emilian Verstappen is a Belgian and Dutch racing driver
# and the 2021, 2022, and 2023 Formula One World Champion. He competes
# under the Dutch flag in Formula One with Red Bull Racing.
# DESCRIPTION
#   domain_name     = module.home_max_hosting.domain_name
#   town            = "missingo"
#   content_version = var.max.content_version
# }
