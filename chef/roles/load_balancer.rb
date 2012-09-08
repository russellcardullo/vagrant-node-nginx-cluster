name "load_balancer"
description "load balancer using nginx"
run_list "recipe[ntp]", "recipe[ubuntu]", "recipe[loadbalancer]"

