#List of variables for AWS module
variable "public_key_path" {
  description = "Path to public key"
  default     = "" # Specify destination to your Publik key
}

variable "Grafana" {
  description = "Script to run Grafana"
  default     = "" #Specify the path to the script for installing Grafana
}