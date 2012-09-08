name "application_server"
description "node.js application server"
run_list "recipe[ntp]", "recipe[ubuntu]", "recipe[nodeapp]"

