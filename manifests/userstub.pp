# Stub for the user. Will ensure absent unless overwritten by account::user

define accounts::userstub(
    $uid,
    $fullname,
    $shell,
    $password,
    $groups,
    $managehome,
    $keytype='rsa',
    $pubkey=undef
) {

    # Ensure managed user doesn't exist unless realized
    user { $name:
        ensure     => absent,
        uid        => $uid,
        comment    => $fullname,
        shell      => $shell,
        groups     => $groups,
        password   => $password,
        managehome => $managehome,
    }

    # If pubkey, ensure absent till realized
    if $pubkey {
        @ssh_authorized_key { "${name}-puppet-managed":
            ensure => present,
            user   => $name,
            type   => $keytype,
            key    => $pubkey,
        }
    }

    # If groups empty, no need to virtualize
    if $groups {

        # Virtualized user to be realized
        @accounts::user { $name:
            groups => $groups,
        }
    }
}
