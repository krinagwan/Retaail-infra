modulerg = {
  rg1 = {
    resource_group_name = "swiggy-resources"
    location            = "Brazil South"
  }
}

modulevnet = {
  vnet1 = {
    virtual_network_name = "zomato-network"
    address_space        = ["10.0.0.0/16"]
    resource_group_name = "swiggy-resources"
     location            = "Brazil South"

    subnets = {
      subnet1 = {
        subnet_name          = "zomato-subnet"
      resource_group_name = "swiggy-resources"
        virtual_network_name = "zomato-network"
        address_prefixes     = ["10.0.2.0/24"]
      }
      subnet2 = {
        subnet_name          = "zomato-subnet2"
      resource_group_name = "swiggy-resources"
        virtual_network_name = "zomato-network"
        address_prefixes     = ["10.0.4.0/24"]
      }

      subnet3 = {
        subnet_name          = "zomato-subnet3"
     resource_group_name = "swiggy-resources"
        virtual_network_name = "zomato-network"
        address_prefixes     = ["10.0.6.0/24"]
      }

    }
  }
}

modulevm = {
  vm1 = {
    nic_name                    = "zomato-nic"
    subnet_name                 = "zomato-subnet"
    resource_group_name = "swiggy-resources"
    virtual_network_name        = "zomato-network"
     location            = "Brazil South"
    vm_name                     = "zomato-machine"
    pip_name                    = "zomato-pip"
    allocation_method           = "Static"
    size                        = "Standard_F2"
    admin_username              = "testvm"
    admin_password              = "Rjil@1234"
    caching                     = "ReadWrite"
    storage_account_type        = "Standard_LRS"
    publisher                   = "Canonical"
    offer                       = "0001-com-ubuntu-server-jammy"
    sku                         = "22_04-lts"
    version                     = "latest"
    network_security_group_name = "nsg-resource"
    outbound_name               = "test123"
    inbound_name                = "Allow-SSH-Inbound"
  }

  vm2 = {
    nic_name                    = "zomato-nic2"
    subnet_name                 = "zomato-subnet2"
    resource_group_name = "swiggy-resources"
    virtual_network_name        = "zomato-network"
     location            = "Brazil South"
    vm_name                     = "zomato-machine2"
    pip_name                    = "zomato-pip2"
    allocation_method           = "Static"
    size                        = "Standard_F2"
    admin_username              = "testvm"
    admin_password              = "Rjil@1234"
    caching                     = "ReadWrite"
    storage_account_type        = "Standard_LRS"
    publisher                   = "Canonical"
    offer                       = "0001-com-ubuntu-server-jammy"
    sku                         = "22_04-lts"
    version                     = "latest"
    network_security_group_name = "nsg-resource2"
    outbound_name               = "test123-ob2"
    inbound_name                = "Allow-SSH-Ib2"

  }

}

modulewinvm = {
  vm1 = {
    nic_name                    = "zomato-nic3"
    subnet_name                 = "zomato-subnet3"
   resource_group_name = "swiggy-resources"
    virtual_network_name        = "zomato-network"
     location            = "Brazil South"
    vm_name                     = "zomato-winmachine3"
    computer_name               = "zomatowin3"
    pip_name                    = "zomato-pip3"
    allocation_method           = "Static"
    size                        = "Standard_B1s"
    admin_username              = "testvm"
    admin_password              = "Rjil@1234"
    caching                     = "ReadWrite"
    storage_account_type        = "Standard_LRS"
    publisher                   = "MicrosoftWindowsServer"
    offer                       = "WindowsServer"
    sku                         = "2016-Datacenter"
    version                     = "latest"
    network_security_group_name = "nsg-resource"
    outbound_name               = "test123-rdp"
    inbound_name                = "Allow-rdp-Inbound"
    httpinbound_name            = "Allod-rdp-ibouthttp"
  }
}
