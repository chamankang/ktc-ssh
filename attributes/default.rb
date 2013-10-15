#
# wwraper cook default settings
#
include_attribute 'openssh'

# server
default['openssh']['server']['permit_root_login'] = "no"
default['openssh']['server']['max_auth_tries'] = "3"
default['openssh']['server']['password_authentication'] = "no"
default['openssh']['server']['x11_forwarding'] = "yes"
default['openssh']['server']['subsystem'] = "sftp /usr/lib/openssh/sftp-server"

# client
default['openssh']['client']['forward_x11'] = "yes"
default['openssh']['client']['forward_agent'] = "yes"
