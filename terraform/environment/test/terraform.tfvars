# Azure subscription vars
#subscription_id = "707a2a01-f589-4fbf-8753-b278612b58ef"
# Omiting values as these were provided via alternative way - env variables
#client_id = ""
#client_secret = ""
#tenant_id = ""

# Resource Group/Location
location = "West Europe"
resource_group = "udacity-azure-course-project3-test-rg"
application_type = "udacity-azure-course-project3-test-app"

# Network
virtual_network_name = "vn-project3"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM
packer_image = "/subscriptions/707a2a01-f589-4fbf-8753-b278612b58ef/resourceGroups/udacity-azure-course-project3-test-rg/providers/Microsoft.Compute/images/myPackerImage"
number_of_vms = 2 #TODO: not yet used
password = "HardToGuess123!"
username = "eduard"

# public key in azure pipelines
#public_key_path = "id_rsa.pub"

# public key on local machine
public_key_path = "~/.ssh/authorized_keys/udacity_id_rsa.pub"