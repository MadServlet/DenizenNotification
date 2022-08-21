event_notification_defaults:
    type: world
    debug: false
    data:
        type: NOTIFICATION
    event:
        death: PLAYER_DEATH
    icon:
        death:
            material: skeleton_skull
    events:
        on player dies:
        - define notification <script[data_notification_data_template].data_key[template]>

        - define notification.to <player>

        - define notification.type <script.data_key[data.type]>
        - define notification.template <script.data_key[event.death]>
        - define notification.icon <item[<script.data_key[icon.death.material]>]>

        - definemap notification.meta:
            killed_by: <context.damager.name.if_null[NO_DATA]>
            killed_using: <context.cause.if_null[NO_DATA]>
            killed_where: <context.entity.location.simple>
            nearby_players: <player.location.find_entities[player].within[15]>

        - customevent id:push_notification_module context:<[notification]>