#Output results from modules
output "PublicIpAWS" {
  value = module.AWS_EC2
}
output "PublicIpAzure" {
  value = module.Azure_Grafana
}