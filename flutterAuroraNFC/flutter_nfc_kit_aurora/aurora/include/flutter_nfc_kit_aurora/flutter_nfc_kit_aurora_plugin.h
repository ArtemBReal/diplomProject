#ifndef FLUTTER_PLUGIN_FLUTTER_NFC_KIT_AURORA_PLUGIN_H
#define FLUTTER_PLUGIN_FLUTTER_NFC_KIT_AURORA_PLUGIN_H

#include <flutter/plugin-interface.h>
#include <flutter_nfc_kit_aurora/globals.h>

class PLUGIN_EXPORT FlutterNfcKitAuroraPlugin final : public PluginInterface
{
public:
    void RegisterWithRegistrar(PluginRegistrar &registrar) override;

private:
    void onMethodCall(const MethodCall &call);
    void onGetPlatformVersion(const MethodCall &call);
    void unimplemented(const MethodCall &call);
};

#endif /* FLUTTER_PLUGIN_FLUTTER_NFC_KIT_AURORA_PLUGIN_H */
