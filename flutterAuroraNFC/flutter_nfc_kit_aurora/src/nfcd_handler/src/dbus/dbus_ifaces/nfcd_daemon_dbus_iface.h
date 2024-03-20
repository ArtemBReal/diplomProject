#ifndef NFCD_DAEMON_DBUS_IFACE_H
#define NFCD_DAEMON_DBUS_IFACE_H

#include <QtCore/QList>
#include <QtDBus/QDBusAbstractInterface>
#include <QtDBus/QDBusPendingReply>

class NfcdDaemonDBusIface : public QDBusAbstractInterface {
    Q_OBJECT

public:
    NfcdDaemonDBusIface(QObject *parent = nullptr);

public slots:
    QDBusPendingReply<int> GetInterfaceVersion();
    QDBusPendingReply<int> GetDaemonVersion();
    QDBusPendingReply<QList<QDBusObjectPath>> GetAdapters();
    QDBusPendingReply<quint8> GetMode();
    

signals: 
    void AdaptersChanged(const QList <QDBusObjectPath> &adapters);
    void ModeChanges(quint8 mode);
};

#endif //NFCD_DAEMON_DBUS_IFACE_H