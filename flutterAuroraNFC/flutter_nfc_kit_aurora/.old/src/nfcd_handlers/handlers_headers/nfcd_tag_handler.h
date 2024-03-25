#ifndef NFCD_TAG_HANDLER_H
#define NFCD_TAG_HANDLER_H

#include <QtCore/QSharedPointer>
#include <QtCore/QVariantMap>
#include <QtCore/QObject>

#include "nfcd_typifier.h"

class NfcdTagHandlerPrivate;

class NfcdTagHandler : public QObject {
    Q_OBJECT

public:
    explicit NfcdTagHandler(QObject *parent = nullptr);

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

    Q_INVOKABLE void acquire(bool wait);
    Q_INVOKABLE void deactivate();
    Q_INVOKABLE void release();
    Q_INVOKABLE QString transceive(const QString &data);

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
    QSharedPointer<NfcdTagHandlerPrivate> m_data { nullptr };
};

#endif //NFCD_TAG_HANDLER_H