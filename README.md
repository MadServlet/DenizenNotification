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

# Moving forward
You can do more with denizen and extend this script even further by having custom handlers, actions, etc... through denizen.

# TODO:
- add support for left click to execute script
- add support for pagination if notifications overflows
