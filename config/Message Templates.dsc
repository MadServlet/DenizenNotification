data_notification_template_default:
    type: data
    debug: false
    NOTIFICATION:
        PLAYER_DEATH:
            title: <red><bold>You Died!
            message:
            - <reset><blue>From<&co> <green>SYSTEM
            - <reset><blue>Date<&co> <gray>${date} ${time}
            - <reset>
            - <reset><blue>Message<&co>
            - <reset><gray>You were killed by <yellow>${killed_by}<gray>!
            - <reset><gray>Method: <yellow>${killed_using}
            - <reset>
            - <reset><blue>Killed At: <reset><gray>${killed_where}