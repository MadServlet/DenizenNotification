proc_notification_template_processor:
    type: procedure
    debug: false
    definitions: data
    GLOBAL:
    - <reset>
    - <reset><yellow>Right Click to Delete
    script:
    - define entry <[data].get[entry]>
    - define template <[data].get[template]>

    - define errorMessage "<reset><red><bold>ERROR - REPORT TO DISCORD"

    - define title <script[<[template]>].data_key[<[entry].get[type]>].get[<[entry].get[template]>].get[title].if_null[<[errorMessage]>]>
    - define message <script[<[template]>].data_key[<[entry].get[type]>].get[<[entry].get[template]>].get[message]>

    - foreach <[entry]>:
        - define title <[title].replace_text[${<[key]>}].with[<[value]>]>

    - foreach <[entry].get[meta]>:
        - define title <[title].replace_text[${<[key]>}].with[<[value]>]>

    - foreach <[entry]>:
        - define message <[message].replace_text[${<[key]>}].with[<[value]>]>

    - foreach <[entry].get[meta]>:
        - define message <[message].replace_text[${<[key]>}].with[<[value]>]>

    - define message <[message].include[<script.data_key[GLOBAL]>]>

    - define icon <[entry].get[icon].if_null[<item[barrier]>].with[display=<[title].parsed>]>
    - define icon <[icon].with[lore=<[message].parse_tag[<[parse_value].parsed>].if_null[<list[<[errorMessage]>]>]>]>

    - determine <[icon]>