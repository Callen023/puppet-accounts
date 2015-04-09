define accounts::group {
    include accounts
    Accounts::User <| groups == $name |>
}
