import Foundation
import ActiveTrail_Push_SDK_iOS

@objc(Activetrail)
class Activetrail: NSObject {

  @objc func `init`(_ apiKey: String,
                    pushToken: String? = nil,
                    enableLogs: Bool = false,
                    useExternalId: Bool = false) {
    ActiveTrailPush.shared.setup(
      apiKey: apiKey,
      pushToken: pushToken,
      enableLogs: enableLogs,
      useExternalId: useExternalId
    )
  }

  @objc func linkUser(_ user: NSDictionary) {
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
  }

  @objc func reportEvent(_ uuid: String) {
    ActiveTrailPush.shared.reportCustomEvent(uuid: uuid)
  }

  @objc func setExternalData(_ id: String, name: String) {
    ActiveTrailPush.shared.setExternalData(id: id, name: name)
  }

  @objc static func requiresMainQueueSetup() -> Bool {
    return false
  }
}
