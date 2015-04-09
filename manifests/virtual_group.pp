define accounts::virtual_group($gid) {

    accounts::group { $name: }

    group { $name:
        ensure => present,
        gid    => $gid,
    }
}
