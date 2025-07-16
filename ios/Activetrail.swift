import Foundation
import ActiveTrail_Push_SDK_iOS

@objc(Activetrail)
class Activetrail: NSObject {

  @objc(init:pushToken:enableLogs:useExternalId:withResolver:withRejecter:)
  func `init`(
    _ apiKey: String,
    pushToken: String?,
    enableLogs: Bool,
    useExternalId: Bool,
    resolve: RCTPromiseResolveBlock,
    reject: RCTPromiseRejectBlock
  ) {
    ActiveTrailPush.shared.setup(
      apiKey: apiKey,
      pushToken: pushToken,
      enableLogs: enableLogs,
      useExternalId: useExternalId
    )
    resolve(nil)
  }

  @objc(linkUser:withResolver:withRejecter:)
  func linkUser(
    _ user: NSDictionary,
    resolve: RCTPromiseResolveBlock,
    reject: RCTPromiseRejectBlock
  ) {
    let email = user["email"] as? String
    let phone = user["phone"] as? String
    let firstName = user["firstName"] as? String
    let lastName = user["lastName"] as? String
    let extra = user["extra"] as? [String: Any]

    ActiveTrailPush.shared.linkUser(
      withEmail: email,
      phone: phone,
      firstName: firstName,
      lastName: lastName,
      extra: extra
    )

    resolve(["success": true])
  }

  @objc(reportEvent:withResolver:withRejecter:)
  func reportEvent(
    _ uuid: String,
    resolve: RCTPromiseResolveBlock,
    reject: RCTPromiseRejectBlock
  ) {
    ActiveTrailPush.shared.reportCustomEvent(uuid: uuid)
    resolve(nil)
  }

  @objc(setExternalData:name:withResolver:withRejecter:)
  func setExternalData(
    _ id: String,
    name: String,
    resolve: RCTPromiseResolveBlock,
    reject: RCTPromiseRejectBlock
  ) {
    ActiveTrailPush.shared.setExternalData(id: id, name: name)
    resolve(nil)
  }

  @objc static func requiresMainQueueSetup() -> Bool {
    return false
  }
}
