sec_grp_name = "openVPN-SG"

Sec_grp_description = "Security group for OpenVPN in dev env"

inbound_ports = [
    { port = 22, protocol = "TCP", cidr_blocks = "20.0.0.0/26" },  // management-vpc jenkins subnet  cidr
    { port = 1194, protocol = "UDP", cidr_blocks = "0.0.0.0/0" }, // openvpn port
  ]

outbound_ports = [
    { port = 0, protocol = "-1", cidr_blocks = "0.0.0.0/0" },
  ]

Sec_grp_tags = {
    Name        = "openvpn-sg"
    Environment = "dev"
    Owner       = "harshit"
  }

key_name = "openVPN.pem"

server_type = "t2.micro"

server_name = "Standalone-Server"

instance_count = 2  

associate_public_ip = "false"
  
