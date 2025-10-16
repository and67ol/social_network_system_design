Enum reaction_type {
  like
  love
  wow
}

Enum media_owner_type {
  post
  comment
  user
}

Table users {
  id       bigint [pk, increment]
  username varchar(50) [not null, unique]
}

Table place {
  id   bigint [pk, increment]
  name varchar(255) [not null]
  lat  decimal(9,6) [not null]
  lon  decimal(9,6) [not null]
}

Table post {
  id       bigint [pk, increment]
  user_id  bigint [not null, ref: > users.id]
  place_id bigint [ref: > place.id]
  text     text [not null]

  indexes {
    (user_id)  [name: 'idx_post_user']
    (place_id) [name: 'idx_post_place']
  }
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

Table reaction {
  id      bigint [pk, increment]
  post_id bigint [not null, ref: > post.id]
  user_id bigint [not null, ref: > users.id]
  type    reaction_type [not null]

  indexes {
    (user_id, post_id, type) [unique, name: 'uq_reaction_user_post_type']
  }
}

Table follow {
  id                    bigint [pk, increment]
  user_id               bigint [not null, ref: > users.id]
  subscribed_to_user_id bigint [not null, ref: > users.id]

  indexes {
    (user_id, subscribed_to_user_id) [unique, name: 'uq_follow_user_followee']
  }
}

Table comment {
  id      bigint [pk, increment]
  post_id bigint [not null, ref: > post.id]
  user_id bigint [not null, ref: > users.id]
  text    text [not null]
}