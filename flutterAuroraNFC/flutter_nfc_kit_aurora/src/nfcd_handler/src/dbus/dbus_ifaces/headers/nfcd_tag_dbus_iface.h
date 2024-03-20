#ifndef NFCD_TAG_DBUS_IFACE_H
#define NFCD_TAG_DBUS_IFACE_H

#include <QtCore/QList>
#include <QtDBus/QDBusAbstractInterface>
#include <QtDBus/QDBusPendingReply>

class NfcdTagDBusIface : public QDBusAbstractInterface {
    Q_OBJECT

public:
    NfcdTagDBusIface(const QString &path, QObject *parent = nullptr);

public slots:
    QDBusPendingReply<int> GetInterfaceVersion();
    QDBusPendingReply<bool> GetPresent();
    QDBusPendingReply<uint> GetProtocol();
    QDBusPendingReply<uint> GetTechnology();
    QDBusPendingReply<uint> GetType();
    QDBusPendingReply<QStringList> GetInterfaces();
    QDBusPendingReply<QVariantMap> GetPollParameters();
    QDBusPendingReply<QList<QDBusObjectPath>> GetNdefRecords();
    QDBusPendingReply<> Acquire(bool wait);
    QDBusPendingReply<> Deactivate();
    QDBusPendingReply<> Release();
    QDBusPendingReply<QByteArray> Transceive(const QByteArray &data);

signals:
    void Removed();
};

#endif //NFCD_TAG_DBUS_IFACE_H