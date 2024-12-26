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
| [huaweicloud_compute_eip_associate.jenkins_eip_association](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_eip_associate) | resource |
| [huaweicloud_compute_eip_associate.wireguard_eip_association](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_eip_associate) | resource |
| [huaweicloud_compute_instance.ecs_jenkins](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_instance) | resource |
| [huaweicloud_compute_instance.ecs_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_instance) | resource |
| [huaweicloud_dns_recordset.dns_public_wireguard_recordset](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_recordset) | resource |
| [huaweicloud_dns_recordset.jenkins_access_recordset](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_recordset) | resource |
| [huaweicloud_dns_zone.dns_private_zone](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_zone) | resource |
| [huaweicloud_dns_zone.dns_public_zone](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dns_zone) | resource |
| [huaweicloud_kps_keypair.jenkins_keypair](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/kps_keypair) | resource |
| [huaweicloud_kps_keypair.wireguard_keypair](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/kps_keypair) | resource |
| [huaweicloud_networking_secgroup.sg_jenkins](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup) | resource |
| [huaweicloud_networking_secgroup.sg_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup) | resource |
| [huaweicloud_networking_secgroup_rule.sg_jenkins_rule_github_webhook](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_jenkins_rule_http](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_jenkins_rule_ssh](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_wireguard_rule_ssh](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_networking_secgroup_rule.sg_wireguard_rule_udp](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_secgroup_rule) | resource |
| [huaweicloud_vpc.vpc_access](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc) | resource |
| [huaweicloud_vpc.vpc_app](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc) | resource |
| [huaweicloud_vpc_address_group.jenkins_access_address_group](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_address_group) | resource |
| [huaweicloud_vpc_address_group.jenkins_github_webhook_ipgroup](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_address_group) | resource |
| [huaweicloud_vpc_eip.eip_jenkins](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_eip) | resource |
| [huaweicloud_vpc_eip.eip_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_eip) | resource |
| [huaweicloud_vpc_peering_connection.app_access_peering](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_peering_connection) | resource |
| [huaweicloud_vpc_route.vpc_access_peering_route](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_route) | resource |
| [huaweicloud_vpc_route.vpc_app_peering_route](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_route) | resource |
| [huaweicloud_vpc_subnet.subnet_app](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_subnet) | resource |
| [huaweicloud_vpc_subnet.subnet_wireguard](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_subnet) | resource |
| [huaweicloud_availability_zones.sp_azs](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/availability_zones) | data source |
| [huaweicloud_compute_flavors.ecs_jenkins_flavor](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/compute_flavors) | data source |
| [huaweicloud_compute_flavors.ecs_wireguard_flavor](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/compute_flavors) | data source |
| [huaweicloud_images_image.ecs_jenkins_image](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/images_image) | data source |
| [huaweicloud_images_image.ecs_wireguard_image](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/images_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | n/a | `string` | n/a | yes |
| <a name="input_jenkins_domain_name"></a> [jenkins\_domain\_name](#input\_jenkins\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_jenkins_fixed_ipv4"></a> [jenkins\_fixed\_ipv4](#input\_jenkins\_fixed\_ipv4) | n/a | `string` | n/a | yes |
| <a name="input_jenkins_keypair_path"></a> [jenkins\_keypair\_path](#input\_jenkins\_keypair\_path) | n/a | `string` | n/a | yes |
| <a name="input_private_domain"></a> [private\_domain](#input\_private\_domain) | n/a | `string` | n/a | yes |
| <a name="input_public_domain"></a> [public\_domain](#input\_public\_domain) | n/a | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_wireguard_domain_name"></a> [wireguard\_domain\_name](#input\_wireguard\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_wireguard_keypair_path"></a> [wireguard\_keypair\_path](#input\_wireguard\_keypair\_path) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->