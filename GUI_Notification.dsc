gui_notification:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: Notifications<&co>
    size: 54
    procedural items:
    - define result <list>

    - if !<player.has_flag[module.notification]>:
        - determine <[result]>

    - if <player.flag[module.notification].size.equals[0]>:
        - determine <[result]>

    - foreach <player.flag[module.notification].filter_tag[<[filter_value].get[deleted].equals[false]>]> as:entry:
        - ~run task_notification_template_processor def:<[entry]> save:icon
        - if <entry[icon].created_queue.determination.size.equals[1]>:
            - define result:->:<entry[icon].created_queue.determination.get[1]>

    - determine <[result]>
