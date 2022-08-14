# DenizenNotification
DenizenNotification is a simple script that reads records or flags in the player issuing the command. It is made to be as minimal as possible to allow easy integration with other scripts that wants to utilize it.

![image](https://user-images.githubusercontent.com/31308819/184540689-e750d563-e716-4582-99ed-c015b731caf7.png)

## How to install
Just drop into your Denizen scripts folder and it should load without problem.

## How to use
use /notification ingame to open the notification window.

# How to add notifications
DenizenNotification does not have a data by default. You need to create your own event listener through Denizen and add it to your character.
Data template for notification can be found in `data_notification_template` under `config/DATA_Notification.dsc`.

Here is an example integration script:
```
event_animal_hubsandry_death:
    type: world
    debug: false
    events:
        on entity dies:
        - if <script[config_animal_husbandry_kibble].data_key[tamable].contains[<context.entity.entity_type>]>:
            - if <context.entity.has_flag[data]>:

                - define notification <script[data_notification_template].data_key[template]>

                - define notification.id <[notification].get[id].parsed>
                - define notification.to <context.entity.flag[data.owner]>

                - define notification.type ANIMAL_HUSBANDRY
                - define notification.template ANIMAL_DEATH

                - define notification.date <[notification].get[date].parsed>
                - define notification.time <[notification].get[time].parsed>

                - if <context.entity.name.equals[<context.entity.entity_type>]>:
                    - define entityName <context.entity.name>
                - else:
                    - define entityName <context.entity.name>(<context.entity.entity_type>)

                - defineMap meta:
                    logs:
                        entity: <context.entity.if_null[NO_DATA]>
                        flags: <context.entity.flag_map.if_null[NO_DATA]>
                        nearby_players: <context.entity.location.find_entities[player].within[15]>
                    data:
                        id: <[notification].get[id]>
                        entity_name: <[entityName]>
                        date: <[notification].get[date].parsed> <[notification].get[time].parsed>
                        killed_by: <context.damager.name.if_null[NO_DATA]>
                        killed_using: <context.cause.if_null[NO_DATA]>
                        killed_where: <context.entity.location.simple>

                - define notification.meta <[meta]>

                - actionbar "<red><bold>Your <[meta].get[data].get[entity_name]> Died!" targets:<[notification].get[to]>

                - customevent id:animal_husbandry_death context:<[notification]>
            - else:
                - determine stop

event_custom_notify_animal_death:
    type: world
    debug: false
    events:
        on custom event id:animal_husbandry_death:
        - flag <context.data.get[to]> module.notification:->:<context.data>
```

## Adding your own message format
DenizenNotification uses a template generator to render the message on the icon you wish to display in your notification GUI.
The generator responsible for replacing "placeholders" with the actual values is the script `task_notification_template_processor` that can be found in `TASK_Notification.dsc`.

An example template can look like this:
```
data_notification_messages:
    type: data
    debug: false
    GLOBAL:
    - <reset>
    - <reset><yellow>Right Click to Delete
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
```

# Moving forward
You can do more with denizen and extend this script even further by having custom handlers, actions, etc... through denizen.

# TODO:
- add support for left click to execute script
- add support for pagination if notifications overflows
