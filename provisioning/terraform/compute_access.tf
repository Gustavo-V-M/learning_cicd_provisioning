# WARPGATE

resource "huaweicloud_compute_instance" "ecs_warpgate" {
  name = "ecs-warpgate"
  image_id = data.huaweicloud_images_image.ecs_warpgate_image.id
  flavor_id = data.huaweicloud_compute_flavors.ecs_warpgate_flavor.flavors[0].id
  security_group_ids = [ huaweicloud_networking_secgroup.sg_warpgate.id ]
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]

  network {
    uuid = huaweicloud_vpc_subnet.subnet_warpgate.id
  }
}

data "huaweicloud_compute_flavors" "ecs_warpgate_flavor" {
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 1
}

data "huaweicloud_images_image" "ecs_warpgate_image" {
    name = "Rocky Linux 9.0 64bit"
}

resource "huaweicloud_networking_secgroup" "sg_warpgate" {
    name = "sg-warpgate"
    description = "Security Group for Warpgate"
}

resource "huaweicloud_networking_secgroup_rule" "sg_warpgate_rule" {
  security_group_id = huaweicloud_networking_secgroup.sg_warpgate.id 
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  ports = "2222,8888,33306"
}


# WIREGUARD

resource "huaweicloud_compute_instance" "ecs_wireguard" {
  name = "ecs-wireguard"
  image_id = data.huaweicloud_images_image.ecs_wireguard_image.id
  flavor_id = data.huaweicloud_compute_flavors.ecs_wireguard_flavor.flavors[0].id
  security_group_ids = [ huaweicloud_networking_secgroup.sg_wireguard.id ]
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]

  network {
    uuid = huaweicloud_vpc_subnet.subnet_wireguard.id
  }
}

data "huaweicloud_compute_flavors" "ecs_wireguard_flavor" {
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 1
}

data "huaweicloud_images_image" "ecs_wireguard_image" {
    name = "Rocky Linux 9.0 64bit"
}

resource "huaweicloud_networking_secgroup" "sg_wireguard" {
    name = "sg-wireguard"
    description = "Security Group for Wireguard"
}

resource "huaweicloud_networking_secgroup_rule" "sg_wireguard_rule_udp" {
  security_group_id = huaweicloud_networking_secgroup.sg_wireguard.id 
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  ports = "51820"
}

resource "huaweicloud_networking_secgroup_rule" "sg_wireguard_rule_ssh" {
  security_group_id = huaweicloud_networking_secgroup.sg_wireguard.id 
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  ports = "22"
}