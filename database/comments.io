Replication
master - slave(sync) - slave(async)

Sharding
key - post_id

Enum reaction_type {
  like
  love
  wow
}

Table reaction {
  id      bigint [pk, increment]
  post_id bigint [not null]
  user_id bigint [not null]
  type    reaction_type [not null]

  indexes {
    (user_id, post_id, type) [unique, name: 'uq_reaction_user_post_type']
  }
}

Table comment {
  id      bigint [pk, increment]
  post_id bigint [not null]
  user_id bigint [not null]
  text    text [not null]
}