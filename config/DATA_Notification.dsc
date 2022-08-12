data_notification_template:
    type: data
    debug: false
    template:
        # ID of the notificatiion
        id: <element[123456789abcdefghijklmnopqrstuvwxyz].to_list.random[12].separated_by[]>
        # Date of the notification
        date: <util.time_now.to_zone[GMT+8].format[yyyy/MM/dd]>
        # time of the notification
        time: <util.time_now.to_zone[GMT+8].format[hh:mm:ss a]>
        # Recipient of the notification (player object)
        to: null
        # Type of notification
        type: Notification
        # meta data for any forms of storage
        meta: meta
        # is read
        read: false
        # is deleted
        deleted: false
        # message template
        template: null