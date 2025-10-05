
data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "current" {
  name     = var.resource_group_name
  location = var.location
}

module "keyvault" {
  source              = "./modules/key-vault"
  keyvault_name       = var.keyvault_name
  location            = azurerm_resource_group.current.location
  resource_group_name = azurerm_resource_group.current.name
}

module "aks" {
  source              = "./modules/aks/"
  location            = azurerm_resource_group.current.location
  resource_group_name = azurerm_resource_group.current.name
}

resource "local_file" "kubeconfig" {
  depends_on = [module.aks]
  filename   = "./kubeconfig"
  content    = module.aks.config
}
