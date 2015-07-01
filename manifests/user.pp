# A user account, this will be virtually created in accounts::group

define accounts::user($groups) {
    User <| title == $name |> {
        ensure => present,
    }

    Ssh_authorized_key <| user == $name |>
}
