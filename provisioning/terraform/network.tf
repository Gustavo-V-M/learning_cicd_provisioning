
resource "huaweicloud_vpc" "vpc_app" {
    name = "vpc-app"
    cidr = "192.168.0.0/16"
}

resource "huaweicloud_vpc" "vpc_access" {
  name = "vpc-access"
  cidr = "172.16.0.0/16"
}


resource "huaweicloud_vpc_subnet" "subnet_warpgate" {
  name = "subnet-warpgate"
  cidr = "172.16.0.0/24"
  gateway_ip = "172.16.0.1"
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  vpc_id = huaweicloud_vpc.vpc_access.id
}

resource "huaweicloud_vpc_subnet" "subnet_wireguard" {
  name =  "subnet-wireguard"
  cidr = "172.16.1.0/24"
  gateway_ip = "172.16.1.1"
  availability_zone = data.huaweicloud_availability_zones.sp_azs.names[0]
  vpc_id = huaweicloud_vpc.vpc_access.id 
}

resource "huaweicloud_vpc_peering_connection" "app_access_peering" {
  name = "vpc-app-acess-peering"
  vpc_id = huaweicloud_vpc.vpc_app.id
  peer_vpc_id = huaweicloud_vpc.vpc_access.id 
}

resource "huaweicloud_vpc_route" "vpc_access_peering_route" {
  vpc_id = huaweicloud_vpc.vpc_access.id
  destination = huaweicloud_vpc.vpc_app.cidr
  type = "peering"
  nexthop = huaweicloud_vpc_peering_connection.app_access_peering.id
}


resource "huaweicloud_vpc_route" "vpc_app_peering_route" {
  vpc_id = huaweicloud_vpc.vpc_app.id
  destination = huaweicloud_vpc.vpc_access.cidr
  type = "peering"
  nexthop = huaweicloud_vpc_peering_connection.app_access_peering.id
}