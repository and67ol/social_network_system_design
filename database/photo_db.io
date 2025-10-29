Replication
master - slave(sync) - slave(async)

Sharding
key - owner_id

Enum media_owner_type {
  post
  comment
  user
}

Table media {
  id         bigint [pk, increment]
  url        text [not null]
  owner_type media_owner_type [not null]
  owner_id   bigint [not null]
  sort_order int [not null, default: 0]

  indexes {
    (owner_type, owner_id, sort_order) [name: 'idx_media_owner_sort']
    (owner_type, owner_id)             [name: 'idx_media_owner']
  }
}