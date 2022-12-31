#List of variables for Azure_node module
variable "public_key_path" {
  description = "Path to public key"
  default     = "" #Specify destination to your Publik key
}

variable "Grafana" {
  description = "Script to run grafana"
  default     = "" #Specify the path to the bash script for installing Grafana on port 80
}