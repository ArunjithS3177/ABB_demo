resource "azurerm_log_analytics_workspace" "aks_logs" {
  name                = "aks-monitor-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                              = var.aks_cluster_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  dns_prefix                        = "myaks"
  role_based_access_control_enabled = true


  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  network_profile {
    network_plugin = "azure"  # "azure" for CNI, "kubenet" for basic networking
    network_policy = "calico" # Adds Network Policy support (Calico for better security)
  }


  identity {
    type = "SystemAssigned"
  }

  # Enable Azure Monitor for containers
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_logs.id
  }



  tags = {
    environment = "Prod"
  }
}
