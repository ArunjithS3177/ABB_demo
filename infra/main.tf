resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "abbclusterdemo"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  monitor_metrics {
    enabled = true  # Enables Azure Monitor Agent (AMA)
  }

  azure_monitor_profile {
    metrics {
      annotations_allowed = ["app.kubernetes.io/name"]
      collection_interval = 60
      enabled             = true
      extra_labels_allowed = ["environment"]
    }
  }

  tags = {
    environment = "Prod"
  }
}
