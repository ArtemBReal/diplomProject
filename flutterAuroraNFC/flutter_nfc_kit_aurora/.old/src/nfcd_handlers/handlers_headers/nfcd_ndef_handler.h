#ifndef NFCD_NDEF_HANDLER_H
#define NFCD_NDEF_HANDLER_H

#include <QtCore/QSharedPointer>

#include "nfcd_typifier.h"

class NfcdNdefHandlerPrivate;

class NfcdNdefHandler : public QObject{
    Q_OBJECT

    Q_PROPERTY(QString recordPath READ recordPath WRITE setRecordPath NOTIFY recordPathChanged)
    Q_PROPERTY(QString interfaceVersion READ interfaceVersion NOTIFY interfaceVersionChanged)
    Q_PROPERTY(NfcdNdefFlags flags READ flags NOTIFY flagsChanged)
    Q_PROPERTY(NfcdNdefTNF typeNameFormat READ typeNameFormat NOTIFY typeNameFormatChanged)
    Q_PROPERTY(QByteArray type READ type NOTIFY typeChanged)
    Q_PROPERTY(QByteArray id READ id NOTIFY idChanged)
    Q_PROPERTY(QByteArray payload READ payload NOTIFY payloadChanged)
    Q_PROPERTY(QByteArray rawData READ rawData NOTIFY rawDataChanged)
    Q_PROPERTY(QStringList interfaces READ interfaces NOTIFY interfacesChanged)

public:
    explicit NfcdNdefHandler(QObject *parent = nullptr);

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
    void flagsChanged(const NfcdNdefFlags &flags);
    void typeNameFormatChanged(NfcdNdefTNF typeNameFormat);
    void typeChanged(const QByteArray &type);
    void idChanged(const QByteArray &id);
    void payloadChanged(const QByteArray &payload);
    void rawDataChanged(const QByteArray &rawData);
    void interfacesChanged(const QStringList &interfaces);

private:
    QSharedPointer<NfcdNdefHandlerPrivate> m_data{ nullptr };
};

#endif //NFCD_NDEF_HANDLER_H
