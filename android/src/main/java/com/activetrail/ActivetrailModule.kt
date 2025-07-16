package com.reactnativeactivetrail

import com.activetrail.sdk.PushSDK
import com.facebook.react.bridge.*
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.turbomodule.core.interfaces.TurboModule

@ReactModule(name = ActivetrailModule.NAME)
class ActivetrailModule(private val reactContext: ReactApplicationContext) :
  NativeActivetrailSpec(reactContext), TurboModule {

  companion object {
    const val NAME = "Activetrail"
  }

  override fun getName(): String = NAME

  override fun init(apiKey: String, enableLogs: Boolean?) {
    PushSDK.init(apiKey, enableLogs == true)
  }

  override fun linkUser(user: ReadableMap) {
    val email = user.getString("email")
    val phone = user.getString("phone")
    val firstName = user.getString("firstName")
    val lastName = user.getString("lastName")
    val extra = user.getMap("extra")?.toHashMap()

    PushSDK.linkUser(email, phone, firstName, lastName, extra)
  }

  override fun reportEvent(uuid: String) {
    PushSDK.reportCustomEvent(uuid)
  }

  override fun setExternalData(id: String, name: String) {
    PushSDK.setExternalData(id, name)
  }
}
