#import <React/RCTBridgeModule.h>
#import <ReactCommon/ReactTurboModule.h>
#import <React/RCTUtils.h>

using namespace facebook;

@interface RCT_EXTERN_REMAP_MODULE(Activetrail, Activetrail, NSObject)

RCT_EXTERN_METHOD(init:(NSString *)apiKey
                  pushToken:(nullable NSString *)pushToken
                  enableLogs:(BOOL)enableLogs
                  useExternalId:(BOOL)useExternalId
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(linkUser:(NSDictionary *)user
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(reportEvent:(NSString *)uuid
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setExternalData:(NSString *)id
                  name:(NSString *)name
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end
