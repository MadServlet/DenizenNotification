event_notification_gui_click:
    type: world
    events:
        on player clicks item in gui_notification:
        - if <context.clicked_inventory.inventory_type.equals[CHEST].and[<context.click.equals[RIGHT]>]>:
            - if <context.item.is_truthy>:
                - define id "<context.item.lore.get[1].replace_text[Message ID<&co>].strip_color.trim>"
                - define data <player.flag[module.notification].filter_tag[<[filter_value].get[id].equals[<[id]>]>].get[1]>
                - define index <player.flag[module.notification].find[<[data]>]>
                - flag <player> module.notification[<[index]>]:<[data].with[deleted].as[true]>
                - inventory open destination:GUI_NOTIFICATION