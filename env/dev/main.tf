module "moduler-rg" {
    source = "../module/rg"
    rg=var.modulerg
}

module "moduler-vnet" {
    depends_on = [ module.moduler-rg ]
    source = "../module/vnet"
    vnet=var.modulevnet
}
# module "moduler-subnet" {
#     depends_on = [ module.moduler-vnet ]
#     source = "../module/subnet"
#     subnet=var.modulesubnet
# }
module "moduler-vm" {
    depends_on =[module.moduler-vnet]
    source = "../module/vm"
    vm=var.modulevm
}
module "moduler-winvm" {
    depends_on =[module.moduler-vnet]
    source = "../module/win_vm"
    winvm=var.modulewinvm
}