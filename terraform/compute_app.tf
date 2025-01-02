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
  cpu_core_count    = 2
  memory_size       = 4
}

data "huaweicloud_images_image" "ecs_jenkins_image" {
  image_id = var.jenkins_image_id
}

variable "jenkins_image_id" {
  type = string
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

resource "huaweicloud_networking_secgroup_rule" "sg_jenkins_rule_github_webhook" {
  security_group_id       = huaweicloud_networking_secgroup.sg_jenkins.id
  direction               = "ingress"
  ethertype               = "IPv4"
  protocol                = "tcp"
  ports                   = "8080"
  remote_address_group_id = huaweicloud_vpc_address_group.jenkins_github_webhook_ipgroup.id
}

resource "huaweicloud_networking_secgroup_rule" "sg_jenkins_rule_github_ping" {
  security_group_id       = huaweicloud_networking_secgroup.sg_jenkins.id
  direction               = "ingress"
  ethertype               = "IPv4"
  protocol                = "icmp"
  remote_address_group_id = huaweicloud_vpc_address_group.jenkins_github_webhook_ipgroup.id
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
    huaweicloud_vpc.vpc_access.cidr,
    huaweicloud_vpc.vpc_app.cidr
  ]
}

# https://api.github.com/meta
resource "huaweicloud_vpc_address_group" "jenkins_github_webhook_ipgroup" {
  name = "jenkins-github-webhook-ipgroup"
  addresses = [
    "192.30.252.0/22",
    "185.199.108.0/22",
    "140.82.112.0/20",
    "143.55.64.0/20"
  ]
}


# Prometheus / Grafana

resource "huaweicloud_compute_instance" "ecs_prometheus" {
  name               = "ecs-prometheus"
  image_id           = data.huaweicloud_images_image.ecs_prometheus_image.id
  flavor_id          = data.huaweicloud_compute_flavors.ecs_prometheus_flavor.flavors[0].id
  security_group_ids = [huaweicloud_networking_secgroup.sg_prometheus.id]
  availability_zone  = data.huaweicloud_availability_zones.sp_azs.names[0]

  network {
    uuid        = huaweicloud_vpc_subnet.subnet_app.id
    fixed_ip_v4 = var.prometheus_fixed_ipv4
  }
  key_pair    = huaweicloud_kps_keypair.prometheus_keypair.id
  private_key = huaweicloud_kps_keypair.prometheus_keypair.private_key
}

variable "prometheus_fixed_ipv4" {
  type = string
}

data "huaweicloud_compute_flavors" "ecs_prometheus_flavor" {
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  performance_type  = "normal"
  cpu_core_count    = 2
  memory_size       = 4
}

data "huaweicloud_images_image" "ecs_prometheus_image" {
  name = "CentOS Stream 9 64bit"
}

resource "huaweicloud_kps_keypair" "prometheus_keypair" {
  name     = "prometheus-keypair"
  key_file = var.prometheus_keypair_path
}

variable "prometheus_keypair_path" {
  type = string
}

resource "huaweicloud_networking_secgroup" "sg_prometheus" {
  name        = "sg-prometheus"
  description = "Security Group for Prometheus"
}

resource "huaweicloud_networking_secgroup_rule" "sg_prometheus_rule_http" {
  security_group_id       = huaweicloud_networking_secgroup.sg_prometheus.id
  direction               = "ingress"
  ethertype               = "IPv4"
  protocol                = "tcp"
  ports                   = "8080"
  remote_address_group_id = huaweicloud_vpc_address_group.prometheus_access_address_group.id
}

resource "huaweicloud_networking_secgroup_rule" "sg_prometheus_rule_default_port" {
  security_group_id       = huaweicloud_networking_secgroup.sg_prometheus.id
  direction               = "ingress"
  ethertype               = "IPv4"
  protocol                = "tcp"
  ports                   = "9090"
  remote_address_group_id = huaweicloud_vpc_address_group.prometheus_access_address_group.id
}



resource "huaweicloud_networking_secgroup_rule" "sg_prometheus_rule_ssh" {
  security_group_id       = huaweicloud_networking_secgroup.sg_prometheus.id
  direction               = "ingress"
  ethertype               = "IPv4"
  protocol                = "tcp"
  ports                   = "22"
  remote_address_group_id = huaweicloud_vpc_address_group.prometheus_access_address_group.id
}


resource "huaweicloud_vpc_address_group" "prometheus_access_address_group" {
  name = "prometheus-access-address-group"
  addresses = [
    huaweicloud_vpc.vpc_access.cidr,
    huaweicloud_vpc.vpc_app.cidr
  ]
}

resource "huaweicloud_compute_eip_associate" "prometheus_eip_association" {
  instance_id = huaweicloud_compute_instance.ecs_prometheus.id
  public_ip   = huaweicloud_vpc_eip.eip_prometheus.address
}