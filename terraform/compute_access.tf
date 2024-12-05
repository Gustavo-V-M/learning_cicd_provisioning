# WARPGATE

resource "huaweicloud_compute_instance" "ecs_warpgate" {
  name               = "ecs-warpgate"
  image_id           = data.huaweicloud_images_image.ecs_warpgate_image.id
  flavor_id          = data.huaweicloud_compute_flavors.ecs_warpgate_flavor.flavors[0].id
  security_group_ids = [huaweicloud_networking_secgroup.sg_warpgate.id]
  availability_zone  = data.huaweicloud_availability_zones.sp_azs.names[0]

  network {
    uuid = huaweicloud_vpc_subnet.subnet_warpgate.id
  }
  private_key = huaweicloud_kps_keypair.warpgate_keypair.private_key
  key_pair    = huaweicloud_kps_keypair.warpgate_keypair.id
}

data "huaweicloud_compute_flavors" "ecs_warpgate_flavor" {
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 1
}

data "huaweicloud_images_image" "ecs_warpgate_image" {
  name = "Ubuntu 22.04 server 64bit"
}

resource "huaweicloud_networking_secgroup" "sg_warpgate" {
  name        = "sg-warpgate"
  description = "Security Group for Warpgate"
}

resource "huaweicloud_networking_secgroup_rule" "sg_warpgate_rule_ssh_alt" {
  security_group_id = huaweicloud_networking_secgroup.sg_warpgate.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  ports             = "2222"
  remote_ip_prefix  = huaweicloud_vpc_subnet.subnet_wireguard.cidr
}

resource "huaweicloud_networking_secgroup_rule" "sg_warpgate_rule_http_alt" {
  security_group_id = huaweicloud_networking_secgroup.sg_warpgate.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  ports             = "8888"
  remote_ip_prefix  = huaweicloud_vpc_subnet.subnet_wireguard.cidr
}

resource "huaweicloud_networking_secgroup_rule" "sg_warpgate_rule_mysql_alt" {
  security_group_id = huaweicloud_networking_secgroup.sg_warpgate.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  ports             = "33306"
  remote_ip_prefix  = huaweicloud_vpc_subnet.subnet_wireguard.cidr
}

resource "huaweicloud_networking_secgroup_rule" "sg_warpgate_rule_ssh" {
  security_group_id = huaweicloud_networking_secgroup.sg_warpgate.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  ports             = "22"
  remote_ip_prefix  = huaweicloud_vpc_subnet.subnet_wireguard.cidr
}

resource "huaweicloud_kps_keypair" "warpgate_keypair" {
  name     = "warpgate-keypair"
  key_file = var.warpgate_keypair_path
}

variable "warpgate_keypair_path" {
  type = string
}

resource "huaweicloud_compute_eip_associate" "warpgate_eip_association" {
  instance_id = huaweicloud_compute_instance.ecs_warpgate.id
  public_ip   = huaweicloud_vpc_eip.eip_warpgate.address
}

# WIREGUARD

resource "huaweicloud_compute_instance" "ecs_wireguard" {
  name               = "ecs-wireguard"
  image_id           = data.huaweicloud_images_image.ecs_wireguard_image.id
  flavor_id          = data.huaweicloud_compute_flavors.ecs_wireguard_flavor.flavors[0].id
  security_group_ids = [huaweicloud_networking_secgroup.sg_wireguard.id]
  availability_zone  = data.huaweicloud_availability_zones.sp_azs.names[0]

  network {
    uuid = huaweicloud_vpc_subnet.subnet_wireguard.id
  }
  private_key = huaweicloud_kps_keypair.wireguard_keypair.private_key
  key_pair    = huaweicloud_kps_keypair.wireguard_keypair.id
}

data "huaweicloud_compute_flavors" "ecs_wireguard_flavor" {
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 1
}

data "huaweicloud_images_image" "ecs_wireguard_image" {
  name = "Ubuntu 22.04 server 64bit" # Wireguard is much easier to configure in Ubuntu and is much more documented, however, I would prefer using centos stream
}

resource "huaweicloud_networking_secgroup" "sg_wireguard" {
  name        = "sg-wireguard"
  description = "Security Group for Wireguard"
}

resource "huaweicloud_networking_secgroup_rule" "sg_wireguard_rule_udp" {
  security_group_id = huaweicloud_networking_secgroup.sg_wireguard.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  ports             = "51820"
}

resource "huaweicloud_networking_secgroup_rule" "sg_wireguard_rule_ssh" {
  security_group_id = huaweicloud_networking_secgroup.sg_wireguard.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  ports             = "22"
}

resource "huaweicloud_kps_keypair" "wireguard_keypair" {
  name     = "wireguard-keypair"
  key_file = var.wireguard_keypair_path
}

variable "wireguard_keypair_path" {
  type = string
}

resource "huaweicloud_compute_eip_associate" "wireguard_eip_association" {
  instance_id = huaweicloud_compute_instance.ecs_wireguard.id
  public_ip   = huaweicloud_vpc_eip.eip_wireguard.address
}

