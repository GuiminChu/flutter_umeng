#import "FlutterUmengPlugin.h"
#import <flutter_umeng/flutter_umeng-Swift.h>

@implementation FlutterUmengPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterUmengPlugin registerWithRegistrar:registrar];
}
@end
