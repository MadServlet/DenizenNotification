data_notification_messages:
    type: data
    debug: false
    ANIMAL_HUSBANDRY:
        ANIMAL_DEATH:
            title: <red><bold>Your $_entity_name Died!
            message:
            - <reset><blue>Message ID<&co> <gray>$_id
            - <reset>
            - <reset><blue>From<&co> <green>Animal Husbandry
            - <reset><blue>Date<&co> <gray>$_date
            - <reset>
            - <reset><blue>Message<&co>
            - <reset><gray>Your animal <green>$_entity_name <gray>was killed by
            - <reset><yellow>$_killed_by <gray>through <red>$_killed_using.
            - <reset><gray>If you think this was griefing,
            - <reset><gray>feel free to report in Discord.
            - <reset>
            - <reset><blue>Killed At: <reset><gray>$_killed_where