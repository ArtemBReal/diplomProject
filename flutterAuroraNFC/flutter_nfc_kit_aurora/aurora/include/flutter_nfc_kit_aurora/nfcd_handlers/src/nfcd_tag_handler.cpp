#include "nfcd_tag_handler.h"
#include "nfcd_tag_handler_src.h"

NfcdTagHandlerPrivate::NfcdTagHandlerPrivate(QObject *parent) : QObject(parent) { }

QString NfcdTagHandlerPrivate::tagPath() const {
    return m_tagPath;
}

void NfcdTagHandlerPrivate::setTagPath(const QString &tagPath){
    if (m_tagPath == tagPath){
        return;
    }

    m_tagPath = tagPath;
    m_iface.reset(new NfcdTagDBusIface(tagPath, this));

    connect(m_iface.data(), &NfcdTagDBusIface::Removed, this, &NfcdTagHandlerPrivate::removed);

    emit tagPathChanged(tagPath);
    emit interfaceVersionChanged(interfaceVersion());
    emit presentChanged(present());
    emit protocolChanged(protocol());
    emit technologyChanged(technology());
    emit typeChanged(type());
    emit interfacesChanged(interfaces());
    emit ndefRecordsChanged(ndefRecords());
    emit pollParametersChanged(pollParameters());
}

QString NfcdTagHandlerPrivate::interfaceVersion(){
    return QStringLiteral("%1").arg(m_iface.isNull() ? 0 : m_iface->GetInterfaceVersion().value());
}

bool NfcdTagHandlerPrivate::present(){
    return m_iface.isNull() ? false : m_iface->GetPresent().value();
}

NfcdTagProtocol NfcdTagHandlerPrivate::protocol(){
    return m_iface.isNull() ? NfcdTagProtocol::UnknownProtocol
                            : static_cast<NfcdTagProtocol>(m_iface->GetProtocol().value());
}

NfcdTagTechnology NfcdTagHandlerPrivate::technology(){
    return m_iface.isNull() ? NfcdTagTechnology::UnknownTechnology
                            : static_cast<NfcdTagTechnology>(m_iface->GetTechnology().value());
}

quint32 NfcdTagHandlerPrivate::type(){
    return m_iface.isNull() ? 0 : m_iface->GetType().value();
}

QStringList NfcdTagHandlerPrivate::interfaces(){
    return m_iface.isNull() ? QStringList() : m_iface->GetInterfaces().value();
}

QStringList NfcdTagHandlerPrivate::ndefRecords(){
    if (m_iface.isNull()){
        return {};
    }

    QStringList ndefRecordsList;
    for (const auto &record : m_iface->GetNdefRecords().value()){
        ndefRecordsList.append(record.path());
    }

    return ndefRecordsList;
}

QVariantMap NfcdTagHandlerPrivate::pollParameters(){
    return m_iface.isNull() ? QVariantMap() : m_iface->GetPollParameters().value();
}

void NfcdTagHandlerPrivate::acquire(bool wait){
    if (!m_iface.isNull()){
        m_iface->Acquire(wait);
    }
}

void NfcdTagHandlerPrivate::deactivate(){
    if (!m_iface.isNull()){
        m_iface->Deactivate();
    }
}

void NfcdTagHandlerPrivate::release(){
    if (!m_iface.isNull()){
        m_iface->Release();
    }
}

QString NfcdTagHandlerPrivate::transceive(const QString &data){
    if (m_iface.isNull()){
        return QString();
    }

    QByteArray bytes = QByteArray::fromHex(QString(data).remove(QRegExp(QStringLiteral("\\s")))
                                                        .remove(QRegExp(QStringLiteral("0[xX]{1}")))
                                                        .toLatin1());

    return m_iface->Transceive(bytes).value();
}

NfcdTagHandler::NfcdTagHandler(QObject *parent) : QObject(parent), m_data(new NfcdTagHandlerPrivate(this)){
    connect(m_data.data(), &NfcdTagHandlerPrivate::tagPathChanged, this,
            &NfcdTagHandler::tagPathChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::interfaceVersionChanged, this,
            &NfcdTagHandler::interfaceVersionChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::presentChanged, this,
            &NfcdTagHandler::presentChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::protocolChanged, this,
            &NfcdTagHandler::protocolChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::technologyChanged, this,
            &NfcdTagHandler::technologyChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::typeChanged, this,
            &NfcdTagHandler::typeChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::pollParametersChanged, this,
            &NfcdTagHandler::pollParametersChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::pollParametersChanged, this,
            &NfcdTagHandler::pollParametersChanged);
            connect(m_data.data(), &NfcdTagHandlerPrivate::removed, this,
            &NfcdTagHandler::removed);
}

QString NfcdTagHandler::tagPath() const {
    return m_data->tagPath();
}

void NfcdTagHandler::setTagPath(const QString &tagPath){
    m_data->setTagPath(tagPath);
}

QString NfcdTagHandler::interfaceVersion(){
    return m_data->interfaceVersion();
}

bool NfcdTagHandler::present(){
    return m_data->present();
}

NfcdTagProtocol NfcdTagHandler::protocol(){
    return m_data->protocol();
}

NfcdTagTechnology NfcdTagHandler::technology(){
    return m_data->technology();
}

quint32 NfcdTagHandler::type(){
    return m_data->type();
}

QStringList NfcdTagHandler::interfaces(){
    return m_data->interfaces();
}

QStringList NfcdTagHandler::ndefRecords(){
    return m_data->ndefRecords();
}

QVariantMap NfcdTagHandler::pollParameters(){
    return m_data->pollParameters();
}

void NfcdTagHandler::acquire(bool wait){
    m_data->acquire(wait);
}

void NfcdTagHandler::deactivate(){
    m_data->deactivate();
}

void NfcdTagHandler::release(){
    m_data->release();
}

QString NfcdTagHandler::transceive(const QString &data){
    return m_data->transceive(data);
}

#include "moc_nfcd_tag_handler_src.cpp"
#include "moc_nfcd_tag_handler.cpp"
