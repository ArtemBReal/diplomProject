#ifndef NFCD_NDEF_HANDLER_SRC_H
#define NFCD_NDEF_HANDLER_SRC_H

#include <QtCore/QObject>
#include <QtCore/QSharedPointer>

#include "nfcd_typifier.h"
#include "nfcd_ndef_dbus_iface.h"

class NfcdNdefHandlerPrivate : public QObject{
    Q_OBJECT

public:
    explicit NfcdNdefHandlerPrivate(QObject *parent = nullptr);

    QString recordPath() const;
    void setRecordPath(const QString &recordPath);

    QString interfaceVersion();
    NfcdNdefFlags flags();
    NfcdNdefTNF typeNameFormat();
    QByteArray type();
    QByteArray id();
    QByteArray payload();
    QByteArray rawData();
    QStringList interfaces();

signals:
    void recordPathChanged(const QString &recordPath);
    void interfaceVersionChanged(const QString &interfaceVersion);
    void flagsChanged(NfcdNdefFlags flags);
    void typeNameFormatChanged(NfcdNdefTNF typeNameFormat);
    void typeChanged(const QByteArray &type);
    void idChanged(const QByteArray &id);
    void payloadChanged(const QByteArray &payload);
    void rawDataChanged(const QByteArray &rawData);
    void interfacesChanged(const QStringList &interfaces);

private:
    QSharedPointer<NfcdNdefDBusIface> m_iface{ nullptr };
    QString m_recordPath{};
};

#endif //NFCD_NDEF_HANDLER_SRC_H
