#
# wwraper cook default settings
#

# server
set['openssh']['server']['permit_root_login'] = "no"
set['openssh']['server']['max_auth_tries'] = "3"
set['openssh']['server']['password_authentication'] = "no"
set['openssh']['server']['x11_forwarding'] = "yes"


# client
set['openssh']['client']['forward_x11'] = "yes"
set['openssh']['client']['forward_agent'] = "yes"

