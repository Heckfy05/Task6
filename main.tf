#Launching modules for installing Grafana on ASW and Azure instances
module "AWS_EC2" {
  source = "/Users/ruslankarpyn/Documents/Task6/Task6/modules/AWS/"
}
module "Azure_Grafana" {
  source = "/Users/ruslankarpyn/Documents/Task6/Task6/modules/Azure_node/"
}