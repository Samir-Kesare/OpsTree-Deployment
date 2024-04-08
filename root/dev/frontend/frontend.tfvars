#---------------------------------Security Group ----------------------------------#

security_name                       = "Dev-Frontend-sg"
Security_description                = "Security group for Dev-Frontend-API"
# SG_vpc_id                           = var.Dev_Frontend_SG_vpc_id
# inbound_ports                       = var.Dev_Frontend_inbound_ports
outbound_ports                      = [{ port= 0, protocol = "-1", cidr_blocks = "0.0.0.0/0" }]
Sg_tags                             = {
    Name                                  = "Dev-Frontend-sg"
    Enviroment                            = "Dev_Frontend"
    Owner                                 = "Vishal"
    }
#--------------------------------Launch Template ----------------------------------
private_key_algorithm               = "RSA"
private_key_rsa_bits                = 4096
template_name                       = "Dev-Frontend-template"
template_description                = "Template for Dev-Frontend"
AMI_ID                              = "ami-09f4367f25b54bb85" // frontend api server AMI ID v1--> ami-09f4367f25b54bb85 v2--> 	ami-0204477864cc2aff9
instance_type                       = "t2.micro"
instance_keypair                    = "frontend.pem"
# subnet_ID                           = var.Dev_Frontend_subnet_ID
user_data_script_path               = "./script.sh"

#--------------------------------- Target Group -----------------------------------#

target_group_name                   = "Dev-Frontend-TG"
target_group_port                   = 3000
target_group_protocol               = "HTTP"
# TG_vpc_id                           = var.Dev_Frontend_TG_vpc_id
health_check_path                   = "/"
health_check_port                   = "traffic-port"
health_check_interval               = 30
health_check_timeout                = 5
health_check_healthy_threshold      = 2
health_check_unhealthy_threshold    = 2

#------------------------------- Listener rule of ALB -----------------------------#

# listener_arn                         = var.Dev_Frontend_listener_arn
path_pattern                         = "*"
action_type                          = "forward"
priority                             = 100

#--------------------------Configure Auto Scaling group ---------------------------#

autoscaling_group_name              = "Dev-Frontend_ASG"
ASG_version                         = "$Latest" // "$Latest" change this accrd.
# subnet_ids                          = var.Dev_Frontend_subnet_ids
tag_key                             = "Name"
tag_value                           = "Dev-Frontend_ASG"
propagate_at_launch                 = true
min_size                            = 1
max_size                            = 2
desired_capacity                    = 1

#---------------------------- Auto Scaling Policies -------------------------------#

scaling_policy_name                 = "target-tracking-policy"
policy_type                         = "TargetTrackingScaling"
predefined_metric_type              = "ASGAverageCPUUtilization"
target_value                        = 50.0
