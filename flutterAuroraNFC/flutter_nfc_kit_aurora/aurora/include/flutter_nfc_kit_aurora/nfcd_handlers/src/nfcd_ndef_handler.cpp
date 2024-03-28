#include "nfcd_ndef_handler.h"
#include "nfcd_ndef_handler_src.h"

NfcdNdefHandlerPrivate::NfcdNdefHandlerPrivate(QObject *parent) : QObject(parent) { 
    //empty
}

QString NfcdNdefHandlerPrivate::recordPath() const {
    return m_recordPath;
}

void NfcdNdefHandlerPrivate::setRecordPath(const QString &recordPath){
    if (m_recordPath == recordPath){
        return;
    }
        
    m_recordPath = recordPath;
    m_iface.reset(new NfcdNdefDBusIface(recordPath, this));

    emit recordPathChanged(recordPath);
    emit interfaceVersionChanged(interfaceVersion());
    emit flagsChanged(flags());
    emit typeNameFormatChanged(typeNameFormat());
    emit typeChanged(type());
    emit idChanged(id());
    emit payloadChanged(payload());
    emit rawDataChanged(rawData());
    emit interfacesChanged(interfaces());
}

QString NfcdNdefHandlerPrivate::interfaceVersion(){
    return QStringLiteral("%1").arg(m_iface.isNull() ? 0 : m_iface->GetInterfaceVersion().value());
}

NfcdNdefFlags NfcdNdefHandlerPrivate::flags(){
    if (m_iface.isNull()){
        return {};
    }
        
    quint32 flagsVal = m_iface->GetFlags().value();
    NfcdNdefFlags flagsRes;

    if ((flagsVal & NfcdNdefFlag::FirstRecord) == NfcdNdefFlag::FirstRecord){
        flagsRes.append(NfcdNdefFlag::FirstRecord);
    }
    
    if ((flagsVal & NfcdNdefFlag::LastRecord) == NfcdNdefFlag::LastRecord){
        flagsRes.append(NfcdNdefFlag::LastRecord);
    }

    return flagsRes;
}

NfcdNdefTNF NfcdNdefHandlerPrivate::typeNameFormat(){
    return m_iface.isNull() ? NfcdNdefTNF::TNF3 : static_cast<NfcdNdefTNF>(m_iface->GetTypeNameFormat().value());
}

QByteArray NfcdNdefHandlerPrivate::type(){
    return m_iface.isNull() ? QByteArray() : m_iface->GetType().value();
}

QByteArray NfcdNdefHandlerPrivate::id(){
    return m_iface.isNull() ? QByteArray() : m_iface->GetId().value();
}

QByteArray NfcdNdefHandlerPrivate::payload(){
    return m_iface.isNull() ? QByteArray() : m_iface->GetPayload().value();
}

QByteArray NfcdNdefHandlerPrivate::rawData(){
    return m_iface.isNull() ? QByteArray() : m_iface->GetRawData().value();
}

QStringList NfcdNdefHandlerPrivate::interfaces(){
    return m_iface.isNull() ? QStringList() : m_iface->GetInterfaces().value();
}

NfcdNdefHandler::NfcdNdefHandler(QObject *parent) : QObject(parent), 
                                                    m_data(new NfcdNdefHandlerPrivate(this)){
    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::recordPathChanged, this,
            &NfcdNdefHandler::recordPathChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::interfaceVersionChanged, this,
            &NfcdNdefHandler::interfaceVersionChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::flagsChanged, this,
            &NfcdNdefHandler::flagsChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::typeNameFormatChanged, this,
            &NfcdNdefHandler::typeNameFormatChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::typeChanged, this,
            &NfcdNdefHandler::typeChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::idChanged, this, 
            &NfcdNdefHandler::idChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::payloadChanged, this,
            &NfcdNdefHandler::payloadChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::rawDataChanged, this,
            &NfcdNdefHandler::rawDataChanged);

    connect(m_data.data(), 
            &NfcdNdefHandlerPrivate::interfacesChanged, this,
            &NfcdNdefHandler::interfacesChanged);
}

QString NfcdNdefHandler::recordPath() const{
    return m_data->recordPath();
}

void NfcdNdefHandler::setRecordPath(const QString &recordPath){
    m_data->setRecordPath(recordPath);
}

QString NfcdNdefHandler::interfaceVersion(){
    return m_data->interfaceVersion();
}

NfcdNdefFlags NfcdNdefHandler::flags(){
    return m_data->flags();
}

NfcdNdefTNF NfcdNdefHandler::typeNameFormat(){
    return m_data->typeNameFormat();
}

QByteArray NfcdNdefHandler::type(){
    return m_data->type();
}

QByteArray NfcdNdefHandler::id(){
    return m_data->id();
}

QByteArray NfcdNdefHandler::payload(){
    return m_data->payload();
}

QByteArray NfcdNdefHandler::rawData(){
    return m_data->rawData();
}

QStringList NfcdNdefHandler::interfaces(){
    return m_data->interfaces();
}

//#include "moc_nfcd_ndef_handler_src.cpp"
#include "moc_nfcd_ndef_handler.cpp"
