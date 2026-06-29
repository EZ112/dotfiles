pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
import QtQuick

Singleton {
    id: root
    property var notifications: []

    NotificationServer {
        keepOnReload: false
        actionsSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        imageSupported: true
        persistenceSupported: true

        onNotification: notif => {
            notif.tracked = true;

            notif.closed.connect(function onClosed() {
                root.notifications = root.notifications.filter(n => n !== null && n.id !== notif.id);
                notif.closed.disconnect(onClosed);
            });

            root.notifications = [...root.notifications.filter(n => n !== null), notif];
        }
    }
}
