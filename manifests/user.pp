define accounts::user($uid, $fullname, $shell, $password, $groups, $managehome, $keytype='rsa', $pubkey=undef) {
    user { $name:
        ensure     => present,
        uid        => $uid,
        comment    => $fullname,
        shell      => $shell,
        groups     => $groups,
        password   => $password,
        managehome => $managehome,
    }

    if $pubkey {
        ssh_authorized_key { "${name}-puppet-managed":
            ensure => present,
            user   => $name,
            type   => $keytype,
            key    => $pubkey,
        }
    
    }
}
