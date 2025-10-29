Replication
master - slave(sync) - slave(async)

Sharding
key - user_id

Table users {
  id       bigint [pk, increment]
  username varchar(50) [not null, unique]
}

Table follow {
  id                    bigint [pk, increment]
  user_id               bigint [not null,]
  subscribed_to_user_id bigint [not null]

  indexes {
    (user_id, subscribed_to_user_id) [unique, name: 'uq_follow_user_followee']
  }
}