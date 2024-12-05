<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | >= 1.36.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | 1.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_compute_eip_associate.wireguard_eip_association](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_eip_associate) | resource |
| [huaweicloud_compute_instance.ecs_warpgate](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_instance) | resource |
| [huaweicloud_compute_instance.ecs_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_instance) | resource |
| [huaweicloud_dns_recordset.dns_public_warpgate_recordset](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_recordset) | resource |
| [huaweicloud_dns_recordset.dns_public_wireguard_recordset](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_recordset) | resource |
| [huaweicloud_dns_recordset.warpgate_access_recordset](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_recordset) | resource |
| [huaweicloud_dns_zone.access_dns_private_zone](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_zone) | resource |
| [huaweicloud_dns_zone.dns_public_zone](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_zone) | resource |
| [huaweicloud_kps_keypair.warpgate_keypair](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/kps_keypair) | resource |
| [huaweicloud_kps_keypair.wireguard_keypair](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/kps_keypair) | resource |
| [huaweicloud_networking_secgroup.sg_warpgate](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup) | resource |
| [huaweicloud_networking_secgroup.sg_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup) | resource |
| [huaweicloud_networking_secgroup_rule.sg_warpgate_rule](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_wireguard_rule_ssh](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_wireguard_rule_udp](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_vpc.vpc_access](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc) | resource |
| [huaweicloud_vpc.vpc_app](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc) | resource |
| [huaweicloud_vpc_eip.eip_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_eip) | resource |
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
| <a name="input_access_private_domain"></a> [access\_private\_domain](#input\_access\_private\_domain) | n/a | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | n/a | `string` | n/a | yes |
| <a name="input_public_domain"></a> [public\_domain](#input\_public\_domain) | n/a | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_warpgate_keypair_path"></a> [warpgate\_keypair\_path](#input\_warpgate\_keypair\_path) | n/a | `string` | `"./warpgate_key.pem"` | no |
| <a name="input_warpgate_private_domain_name"></a> [warpgate\_private\_domain\_name](#input\_warpgate\_private\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_warpgate_public_domain_name"></a> [warpgate\_public\_domain\_name](#input\_warpgate\_public\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_wireguard_keypair_path"></a> [wireguard\_keypair\_path](#input\_wireguard\_keypair\_path) | n/a | `string` | `"./wireguard_key.pem"` | no |
| <a name="input_wireguard_public_domain_name"></a> [wireguard\_public\_domain\_name](#input\_wireguard\_public\_domain\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->