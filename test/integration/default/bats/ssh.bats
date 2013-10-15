# vim: ft=sh:

@test "ssh directory is created" {
  test -d /home/yoda/.ssh
}

@test "authorized keys file created" {
  test -f /home/yoda/.ssh/authorized_keys
}

@test "user should have a key" {
  grep -q ssh-dss  /home/yoda/.ssh/authorized_keys
}
