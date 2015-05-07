define accounts::usergroup {
    include accounts
    Accounts::User <| groups == $name |>
}
