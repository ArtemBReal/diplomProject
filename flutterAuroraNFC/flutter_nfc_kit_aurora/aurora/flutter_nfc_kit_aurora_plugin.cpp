#include <flutter_nfc_kit_aurora/flutter_nfc_kit_aurora_plugin.h>
#include <flutter_nfc_kit_aurora/nfcd_handlers/handlers_headers/nfcd_daemon_handler.h>
#include <flutter/method-channel.h>
#include <sys/utsname.h>

void FlutterNfcKitAuroraPlugin::RegisterWithRegistrar(PluginRegistrar &registrar)
{
    registrar.RegisterMethodChannel("flutter_nfc_kit_aurora",
                                    MethodCodecType::Standard,
                                    [this](const MethodCall &call) { this->onMethodCall(call); });
}

void FlutterNfcKitAuroraPlugin::onMethodCall(const MethodCall &call)
{
    const auto &method = call.GetMethod();

    if (method == "getPlatformVersion") {
        onGetPlatformVersion(call);
        return;
    }
    if (method == "getDaemonInterfaceVersion"){
        onGetDaemonInterfaceVersion(call);
        return;
    }

    unimplemented(call);
}

void FlutterNfcKitAuroraPlugin::onGetPlatformVersion(const MethodCall &call)
{
    utsname uname_data{};
    uname(&uname_data);

    std::string preamble = "Aurora (Linux): ";
    std::string version = preamble + uname_data.version;

    call.SendSuccessResponse(version);
}

void FlutterNfcKitAuroraPlugin::unimplemented(const MethodCall &call)
{
    call.SendSuccessResponse(nullptr);
}

void FlutterNfcKitAuroraPlugin::onGetDaemonInterfaceVersion(const MethodCall &call)
{
    QString daemonInterfaceVersion;
    NfcdDaemonHandler daemonHandler;
    daemonInterfaceVersion = daemonHandler.interfaceVersion();

    call.SendSuccessResponse(daemonInterfaceVersion.toStdString());
}

#include "moc_flutter_nfc_kit_aurora_plugin.cpp"
