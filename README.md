# DenizenNotification Script
This script is a simple module that reads a specific `flag` attached to the player provided by triggered `events` or `commands`. These data are then rendered by the script based on the provided template and are added into a provided item as `icon` as lores formatted.

![image](https://user-images.githubusercontent.com/31308819/184540689-e750d563-e716-4582-99ed-c015b731caf7.png)

# How to install
Just drop into your Denizen scripts folder and it should load without problem.

# How to use ingame
use /notification ingame to open the notification window. By default, right clicking an icon will remove it from the player's notification GUI but it will still be in their data for future review.

# How It Works
This module is composed of 2 important elements.

1. Source of Notification Message
2. Message Template

The way this script works is that an `event` will compose a `map` of data based on the template `data_notification_data_template.template` which can be found in `config/Data Template.dsc`. By default these are the fields that the template contains:
```
data_notification_data_template:
    type: data
    debug: false
    template:
        # Recipient of the notification (player object)
        to: null
        # Type of notification
        type: Notification
        # meta data for any forms of storage
        meta: meta
        # message template
        template: null
```
In addition to this, when the data is finally saved, additional fields will be added such as:

1. Date (format yyyy/MM/dd)
2. Time (format hh:mm:ss a)
3. ID (random 12 characters from '123456789abcdefghijklmnopqrstuvwxyz')
4. Read
5. Deleted

## Adding your custom Event
Using denizen you can add your own events that will then push the data into the player's flag and later on rendered in the Notification GUI. Lets start by adding a simple block break event!
```
my_event:
    type: world
    debug: false
    data:
        type: MY_NOTIFICATION
    event:
        break_block: BLOCK_BREAK
    events:
        on player breaks block:
        - define notification <script[data_notification_data_template].data_key[template]>

        - define notification.to <player>

        - define notification.type <script.data_key[data.type]>
        - define notification.template <script.data_key[event.break_block]>

        - definemap notification.meta:
            block: <context.material.translated_name>
            location: <context.location.simple>

        - customevent id:push_notification_module context:<[notification]>
```

This event contains 3 importants details.
1. Who to send the notification (target)
2. What kind of notification (notification type)
3. What is the template of the notification (notification type template ID)

After filling out the details, we then call the custom event `push_notification_module` with the notification data.

## Adding your custom template
Now that we have an event that pushes the details of our notification, lets create a template to render notification data into!
```
data_notification_template_MY_NOTIFICATION:
    type: data
    debug: false
    MY_NOTIFICATION:
        BLOCK_BREAK:
            title: You broke a ${block}!
            message:
            - <reset><gray>You broke a ${block} in ${location}!
```
Now there's a 3 things we need to take note when creating a template.
1. the script container's name should always be `data_notification_template_`+`your_notification_type` in our sample will be `data_notification_template_MY_NOTIFICATION`.
2. Notification Type as root node (`MY_NOTIFICATION`)
3. Template ID (`BLOCK_BREAK`)

A notification template should always have a `title` and `message`. The `title` will be the name of the item rendered in the GUI and the `message` will become the item's lore.

## Aftermath
Now that we have our `event` pushing the notification data into the player's flag and a `template` to put as a message, we can now test it out!

# Moving forward
You can do more with denizen and extend this script even further by having custom handlers, actions, etc... through denizen.

# TODO:
- add support for left click to execute script
- add support for pagination if notifications overflows
