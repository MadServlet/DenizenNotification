task_notification_template_processor:
    type: task
    debug: false
    definitions: entry
    script:
    - define errorMessage "<reset><red><bold>ERROR - REPORT TO DISCORD"

    - define title <script[data_notification_messages].data_key[<[entry].get[type]>].get[<[entry].get[template]>].get[title].if_null[<[errorMessage]>]>
    - define message <script[data_notification_messages].data_key[<[entry].get[type]>].get[<[entry].get[template]>].get[message]>

    - foreach <[entry].get[meta].get[data]>:
        - define title <[title].replace_text[$_<[key]>].with[<[value]>]>

    - foreach <[entry].get[meta].get[data]>:
        - define message <[message].replace_text[$_<[key]>].with[<[value]>]>

    - define material <script[data_notification_icon].data_key[<[entry].get[type]>].get[<[entry].get[template]>].get[material].if_null[barrier]>
    - define mechanism <script[data_notification_icon].data_key[<[entry].get[type]>].get[<[entry].get[template]>].get[mechanism]>

    - determine <item[<[material]>].with[<[mechanism]>].with[display=<[title].parsed>].with[lore=<[message].parse_tag[<[parse_value].parsed>].if_null[<list[<[errorMessage]>]>]>]>