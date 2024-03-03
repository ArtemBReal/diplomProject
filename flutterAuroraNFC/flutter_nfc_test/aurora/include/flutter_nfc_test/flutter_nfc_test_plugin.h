#ifndef FLUTTER_PLUGIN_FLUTTER_NFC_TEST_PLUGIN_H
#define FLUTTER_PLUGIN_FLUTTER_NFC_TEST_PLUGIN_H

#include <flutter/plugin-interface.h>
#include <flutter_nfc_test/globals.h>

class PLUGIN_EXPORT FlutterNfcTestPlugin final : public PluginInterface
{
public:
    void RegisterWithRegistrar(PluginRegistrar &registrar) override;

private:
    void onMethodCall(const MethodCall &call);
    void onGetPlatformVersion(const MethodCall &call);
    void unimplemented(const MethodCall &call);
};

#endif /* FLUTTER_PLUGIN_FLUTTER_NFC_TEST_PLUGIN_H */
