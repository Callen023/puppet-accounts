class accounts($default_shell='/bin/bash', $default_password='*', $default_managehome=true) {

    $user_defaults = {
        shell     => $default_shell,
        password  => $default_password,
        managehome => $default_managehome,
    }

    # Create all users virtually
    create_resources('@accounts::user', hiera_hash(users), $user_defaults)

    # Create groups including a virtual accounts::group
    create_resources('accounts::virtual_group', hiera_hash(groups))
    
}