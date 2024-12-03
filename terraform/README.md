<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | >= 1.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | 1.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_compute_instance.ecs_warpgate](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_instance) | resource |
| [huaweicloud_compute_instance.ecs_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_instance) | resource |
| [huaweicloud_networking_secgroup.sg_warpgate](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup) | resource |
| [huaweicloud_networking_secgroup.sg_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup) | resource |
| [huaweicloud_networking_secgroup_rule.sg_warpgate_rule](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_wireguard_rule_ssh](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_wireguard_rule_udp](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_vpc.vpc_access](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc) | resource |
| [huaweicloud_vpc.vpc_app](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc) | resource |
| [huaweicloud_vpc_peering_connection.app_access_peering](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_peering_connection) | resource |
| [huaweicloud_vpc_route.vpc_access_peering_route](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_route) | resource |
| [huaweicloud_vpc_route.vpc_app_peering_route](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_route) | resource |
| [huaweicloud_vpc_subnet.subnet_warpgate](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_subnet) | resource |
| [huaweicloud_vpc_subnet.subnet_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_subnet) | resource |
| [huaweicloud_availability_zones.sp_azs](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/availability_zones) | data source |
| [huaweicloud_compute_flavors.ecs_warpgate_flavor](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/compute_flavors) | data source |
| [huaweicloud_compute_flavors.ecs_wireguard_flavor](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/compute_flavors) | data source |
| [huaweicloud_images_image.ecs_warpgate_image](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/images_image) | data source |
| [huaweicloud_images_image.ecs_wireguard_image](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/images_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->