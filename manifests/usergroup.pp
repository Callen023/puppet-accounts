# When realized, creates user accounts

define accounts::usergroup {
    include accounts
    Accounts::User <| groups == $name |>
}
