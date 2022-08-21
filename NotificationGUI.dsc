command_notification:
    type: command
    debug: false
    name: notification
    description: Opens personal notification window
    usage: /notification
    script:
    - inventory open destination:GUI_NOTIFICATION

gui_notification:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: Notifications<&co>
    size: 54
    procedural items:
    - define result <list>

    - if !<player.has_flag[module.notification]> or <player.flag[module.notification].size.equals[0]>:
        - determine <[result]>

    - define templatePrefix <script[data_notification_config].data_key[server.template_prefix]>
    - define templates <util.scripts.filter_tag[<[filter_value].name.contains_text[<[templatePrefix]>]>]>

    - foreach <player.flag[module.notification].filter_tag[<[filter_value].get[deleted].equals[false]>]> as:entry:
        - define template <[templates].filter_tag[<[filter_value].name.equals[<[templatePrefix]><[entry].get[type]>]>].get[0].if_null[<[templatePrefix]>default]>
        - define result:->:<proc[proc_notification_template_processor].context[<map[entry=<[entry]>;template=<[template]>]>]>

    - determine <[result]>

event_notification_gui_click:
    type: world
    debug: false
    events:
        on player clicks item in gui_notification:
        - if <context.clicked_inventory.inventory_type.equals[CHEST].and[<context.click.equals[RIGHT]>]>:
            - if <context.item.is_truthy>:
                - define id "<context.item.lore.get[1].replace_text[Message ID<&co>].strip_color.trim>"
                - define data <player.flag[module.notification].filter_tag[<[filter_value].get[id].equals[<[id]>]>].get[1]>
                - define index <player.flag[module.notification].find[<[data]>]>
                - flag <player> module.notification[<[index]>]:<[data].with[deleted].as[true]>
                - inventory open destination:GUI_NOTIFICATION