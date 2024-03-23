#ifndef NFCD_ISODEP_HANDLER_H
#define NFCD_ISODEP_HANDLER_H

#include <QtCore/QSharedPointer>

#include "nfcd_typifier.h"

class NfcdIsoDepHandlerPrivate;

class NfcdIsoDepHandler : public QObject{
    Q_OBJECT

    Q_PROPERTY(QString tagPath READ tagPath WRITE setTagPath NOTIFY tagPathChanged)
    Q_PROPERTY(QString interfaceVersion READ interfaceVersion NOTIFY interfaceVersionChanged)

public:
    explicit NfcdIsoDepHandler(QObject *parent = nullptr);

    QString tagPath() const;
    void setTagPath(const QString &tagPath);

    QString interfaceVersion();

    Q_INVOKABLE NfcdIsoDepResult transmit(uchar cla, uchar ins, 
                                          uchar p1, uchar p2,
                                          const QString &data, uint le);
                                          
    Q_INVOKABLE void reset();

signals:
    void tagPathChanged(const QString &tagPath);
    void interfaceVersionChanged(const QString &interfaceVersion);

private:
    QSharedPointer<NfcdIsoDepHandlerPrivate> m_data{ nullptr };
};

#endif //NFCD_ISODEP_HANDLER_H
