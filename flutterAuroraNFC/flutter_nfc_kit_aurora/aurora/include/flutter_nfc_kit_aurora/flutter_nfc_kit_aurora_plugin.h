#ifndef FLUTTER_PLUGIN_FLUTTER_NFC_KIT_AURORA_PLUGIN_H
#define FLUTTER_PLUGIN_FLUTTER_NFC_KIT_AURORA_PLUGIN_H

#include <QtCore>

#include <flutter/plugin-interface.h>
#include <flutter_nfc_kit_aurora/globals.h>

#include <flutter_nfc_kit_aurora/nfcd_handlers/handlers_headers/nfcd_daemon_handler.h>

class PLUGIN_EXPORT FlutterNfcKitAuroraPlugin final : public QObject, public PluginInterface
{
public:
    void RegisterWithRegistrar(PluginRegistrar &registrar) override;

private:
    void onMethodCall(const MethodCall &call);
    void onGetPlatformVersion(const MethodCall &call);
    void unimplemented(const MethodCall &call);
    void onGetDaemonInterfaceVersion(const MethodCall &call);
};

#endif /* FLUTTER_PLUGIN_FLUTTER_NFC_KIT_AURORA_PLUGIN_H */
