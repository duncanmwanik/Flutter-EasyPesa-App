//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_beep/FlutterBeepPlugin.h>)
#import <flutter_beep/FlutterBeepPlugin.h>
#else
@import flutter_beep;
#endif

#if __has_include(<local_auth/FLTLocalAuthPlugin.h>)
#import <local_auth/FLTLocalAuthPlugin.h>
#else
@import local_auth;
#endif

#if __has_include(<qrcode/QrcodePlugin.h>)
#import <qrcode/QrcodePlugin.h>
#else
@import qrcode;
#endif

#if __has_include(<torch_compat/TorchCompatPlugin.h>)
#import <torch_compat/TorchCompatPlugin.h>
#else
@import torch_compat;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterBeepPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBeepPlugin"]];
  [FLTLocalAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTLocalAuthPlugin"]];
  [QrcodePlugin registerWithRegistrar:[registry registrarForPlugin:@"QrcodePlugin"]];
  [TorchCompatPlugin registerWithRegistrar:[registry registrarForPlugin:@"TorchCompatPlugin"]];
}

@end
