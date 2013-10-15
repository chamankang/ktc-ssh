# vim: ft=sh:

@test "ssh directory is created" {
  test -d /home/testuser/.ssh
}

@test "authorized keys file created" {
  test -f /home/testuser/.ssh/authorized_keys
}
