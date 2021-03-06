define uwsgi::siteconfig($content,$directory,$owner,$group){
  file {"$directory":
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => 0644,
  }~>
  file {"$directory/$name":
    ensure  => present,
    content => $content,
    owner   => $owner,
    group   => $group,
    mode    => 0644,
    require => Class['uwsgi'],
    notify  => Class["uwsgi::service"],
  }
}
