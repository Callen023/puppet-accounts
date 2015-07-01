# Real groups, virtually declares accounts::usergroup

define accounts::group($gid) {

    @accounts::usergroup { $name: }

    group { $name:
        ensure => present,
        gid    => $gid,
    }
}
