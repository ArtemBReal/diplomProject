#include <flutter_nfc_test/flutter_nfc_test_plugin.h>
#include <flutter/method-channel.h>
#include <sys/utsname.h>

void FlutterNfcTestPlugin::RegisterWithRegistrar(PluginRegistrar &registrar)
{
    registrar.RegisterMethodChannel("flutter_nfc_test",
                                    MethodCodecType::Standard,
                                    [this](const MethodCall &call) { this->onMethodCall(call); });
}

void FlutterNfcTestPlugin::onMethodCall(const MethodCall &call)
{
    const auto &method = call.GetMethod();

    if (method == "getPlatformVersion") {
        onGetPlatformVersion(call);
        return;
    }

    unimplemented(call);
}

void FlutterNfcTestPlugin::onGetPlatformVersion(const MethodCall &call)
{
    utsname uname_data{};
    uname(&uname_data);

    std::string preamble = "Aurora (Linux): ";
    std::string version = preamble + uname_data.version;

    call.SendSuccessResponse(version);
}

void FlutterNfcTestPlugin::unimplemented(const MethodCall &call)
{
    call.SendSuccessResponse(nullptr);
}
