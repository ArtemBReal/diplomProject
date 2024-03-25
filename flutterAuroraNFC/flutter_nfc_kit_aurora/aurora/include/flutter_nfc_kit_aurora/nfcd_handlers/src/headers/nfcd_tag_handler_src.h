#ifndef NFCD_TAG_HANDLER_SRC_H
#define NFCD_TAG_HANDLER_SRC_H

#include <QtCore/QObject>
#include <QtCore/QSharedPointer>

#include "nfcd_typifier.h"
#include "nfcd_tag_dbus_iface.h"

class NfcdTagHandlerPrivate : public QObject {
    Q_OBJECT

public:
    explicit NfcdTagHandlerPrivate(QObject *parent = nullptr);
    
    QString tagPath() const;
    void setTagPath(const QString &tagPath);

    QString interfaceVersion();
    bool present();
    NfcdTagProtocol protocol();
    NfcdTagTechnology technology();
    quint32 type();
    QStringList interfaces();
    QStringList ndefRecords();
    QVariantMap pollParameters();
    void acquire(bool wait);
    void deactivate();
    void release();
    QString transceive(const QString &data);

signals:
    void tagPathChanged(const QString &tagPath);
    void interfaceVersionChanged(const QString &interfaceVersion);
    void presentChanged(bool present);
    void protocolChanged(NfcdTagProtocol protocl);
    void technologyChanged(NfcdTagTechnology technology);
    void typeChanged(quint32 type);
    void interfacesChanged(const QStringList &interfaces);
    void ndefRecordsChanged(const QStringList &ndefRecords);
    void pollParametersChanged(const QVariantMap &pollParameters);
    void removed();

private:
    QSharedPointer<NfcdTagDBusIface> m_iface { nullptr };
    QString m_tagPath {};
};

#endif //NFCD_TAG_HANDLER_SRC_H