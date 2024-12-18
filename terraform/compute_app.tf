# JENKINS

resource "huaweicloud_compute_instance" "ecs_jenkins" {
  name               = "ecs-jenkins"
  image_id           = data.huaweicloud_images_image.ecs_jenkins_image.id
  flavor_id          = data.huaweicloud_compute_flavors.ecs_jenkins_flavor.flavors[0].id
  security_group_ids = [huaweicloud_networking_secgroup.sg_jenkins.id]
  availability_zone  = data.huaweicloud_availability_zones.sp_azs.names[0]

  network {
    uuid        = huaweicloud_vpc_subnet.subnet_app.id
    fixed_ip_v4 = var.jenkins_fixed_ipv4
  }
  key_pair    = huaweicloud_kps_keypair.jenkins_keypair.id
  private_key = huaweicloud_kps_keypair.jenkins_keypair.private_key
}

variable "jenkins_fixed_ipv4" {
  type = string
}

resource "huaweicloud_kps_keypair" "jenkins_keypair" {
  name     = "jenkins-keypair"
  key_file = var.jenkins_keypair_path
}

variable "jenkins_keypair_path" {
  type = string
}

data "huaweicloud_compute_flavors" "ecs_jenkins_flavor" {
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 1
}

data "huaweicloud_images_image" "ecs_jenkins_image" {
  name = "CentOS Stream 9 64bit"
}

resource "huaweicloud_compute_eip_associate" "jenkins_eip_association" {
  instance_id = huaweicloud_compute_instance.ecs_jenkins.id
  public_ip   = huaweicloud_vpc_eip.eip_jenkins.address
}

resource "huaweicloud_networking_secgroup" "sg_jenkins" {
  name        = "sg-jenkins"
  description = "Security Group for Jenkins"
}

resource "huaweicloud_networking_secgroup_rule" "sg_jenkins_rule_http" {
  security_group_id       = huaweicloud_networking_secgroup.sg_jenkins.id
  direction               = "ingress"
  ethertype               = "IPv4"
  protocol                = "tcp"
  ports                   = "8080"
  remote_address_group_id = huaweicloud_vpc_address_group.jenkins_access_address_group.id
}

resource "huaweicloud_networking_secgroup_rule" "sg_jenkins_rule_ssh" {
  security_group_id       = huaweicloud_networking_secgroup.sg_jenkins.id
  direction               = "ingress"
  ethertype               = "IPv4"
  protocol                = "tcp"
  ports                   = "22"
  remote_address_group_id = huaweicloud_vpc_address_group.jenkins_access_address_group.id
}

resource "huaweicloud_vpc_address_group" "jenkins_access_address_group" {
  name = "jenkins-access-address-group"
  addresses = [
    format("%s%s", huaweicloud_compute_instance.ecs_wireguard.access_ip_v4, "/32")
  ]
}
