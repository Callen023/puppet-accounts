# A user account, this will be virtually created in accounts::group

define accounts::user($groups, $managehome) {
    User <| title == $name |> {
        ensure     => present,
        managehome => $managehome,
    }

    Ssh_authorized_key <| user == $name |>
}
