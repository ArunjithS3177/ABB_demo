# output "kube_config_path" {
#   value       = "${path.module}/kubeconfig"
#   description = "Path to the generated kubeconfig file"
# }

# resource "local_file" "kubeconfig" {
#   content  = azurerm_kubernetes_cluster.aks.kube_config_raw
#   filename = "${path.module}/kubeconfig"
# }
