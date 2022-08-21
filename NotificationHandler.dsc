event_notification_handler:
    type: world
    debug: false
    events:
        on custom event id:push_notification_module:
        - define notification <context.data>

        - define notification.id <element[123456789abcdefghijklmnopqrstuvwxyz].to_list.random[12].separated_by[]>
        - define notification.date <util.time_now.to_zone[GMT+8].format[yyyy/MM/dd]>
        - define notification.time "<util.time_now.to_zone[GMT+8].format[hh:mm:ss a]>"
        - define notification.read false
        - define notification.deleted false

        - announce <[notification].get[icon]>
        - announce <[notification].get[icon].is_truthy>

        - if !<[notification].get[icon].is_truthy>:
            - define notification.icon <item[book].with[display=NO_DATA]>

        - flag <[notification].get[to]> module.notification:->:<[notification]>
        # - midi notification <[notification].get[to]>