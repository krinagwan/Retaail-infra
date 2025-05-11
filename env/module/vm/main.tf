data "azurerm_subnet" "data" {
  for_each             = var.vm
  name          = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
    # network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}



resource "azurerm_network_interface" "nic" {
  for_each            = var.vm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
    
  }
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.vm
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.vm
  name                = each.value.network_security_group_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_security_rule" "ssh_outbound" {
  for_each = var.vm
   depends_on = [ azurerm_network_security_group.nsg ]
  name                        = each.value.outbound_name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = each.value.resource_group_name
  network_security_group_name = each.value.network_security_group_name
}

resource "azurerm_network_security_rule" "ssh_inbound" {
  for_each = var.vm
  depends_on = [ azurerm_network_security_group.nsg ]
  name                        = each.value.inbound_name
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
 resource_group_name = each.value.resource_group_name
  network_security_group_name = each.value.network_security_group_name
}

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1" {
  for_each = var.vm
    network_interface_id      = azurerm_network_interface.nic[each.key].id
    network_security_group_id = azurerm_network_security_group.nsg[each.key].id

}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vm
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
