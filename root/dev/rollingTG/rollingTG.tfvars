
tg_name = "Frontend-TG-v2"
tg_port = 3000
tg_protocol = "HTTP"
# tg_vpc_id = "vpc-02b7e3d8ee6fd3c38"
tg_health_check_path = "/"
tg_health_check_port = "traffic-port"
tg_health_check_interval = 30
tg_health_check_timeout = 5
tg_health_check_healthy_threshold = 2
tg_health_check_unhealthy_threshold = 2

tg_tags = {
  Enviroment = "dev"
  Owner = "harshit"
}
