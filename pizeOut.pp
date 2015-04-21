#
# Generated puppet code
#
user { 'root':
  ensure   => 'present',
  comment  => 'System Administrator',
  gid      => '0',
  groups   => ['admin', 'certusers', 'daemon', 'kmem', 'operator', 'procmod', 'procview', 'staff', 'sys', 'tty', 'wheel'],
  home     => '/var/root',
  password => '*',
  shell    => '/bin/sh',
  uid      => '0',
}

file { '/etc/hosts':
  ensure  => 'file',
  content => '{md5}f6a1a27d87ba311e959a4f6a627ad6d5',
  ctime   => '2015-04-21 11:32:11 -0700',
  group   => '0',
  mode    => '644',
  mtime   => '2015-04-21 11:32:11 -0700',
  owner   => '0',
  type    => 'file',
}

package { 'ntp':
  ensure => 'absent',
}

service { 'ntp':
  ensure => 'absent',
}

host { 'localhost':
  ensure => 'present',
  ip     => '127.0.0.1',
  target => '/etc/hosts',
}

