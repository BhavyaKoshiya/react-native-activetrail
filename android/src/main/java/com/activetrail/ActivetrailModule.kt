package com.reactnativeactivetrail

import com.facebook.react.bridge.*
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = ActivetrailModule.NAME)
class ActivetrailModule(reactContext: ReactApplicationContext) :
  NativeActivetrailSpec(reactContext) {

  override fun getName() = NAME

  override fun `init`(
    apiKey: String,
    pushToken: String?,
    enableLogs: Boolean?,
    useExternalId: Boolean?,
    promise: Promise
  ) {
    try {
      PushSDK.init(
        apiKey = apiKey,
        pushToken = pushToken,
        enableLogs = enableLogs ?: false,
        useExternalId = useExternalId ?: false
      )
      promise.resolve(null)
    } catch (e: Exception) {
      promise.reject("INIT_FAILED", e.message, e)
    }
  }

  override fun linkUser(user: ReadableMap, promise: Promise) {
    try {
      val email = user.getString("email")
      val phone = user.getString("phone")
      val firstName = user.getString("firstName")
      val lastName = user.getString("lastName")
      val extra = user.getMap("extra")

      PushSDK.linkUser(email, phone, firstName, lastName, extra)
      val response = Arguments.createMap().apply {
        putBoolean("success", true)
      }
      promise.resolve(response)
    } catch (e: Exception) {
      promise.reject("LINK_USER_ERROR", e.message, e)
    }
  }

  override fun reportEvent(uuid: String, promise: Promise) {
    try {
      PushSDK.reportCustomEvent(uuid)
      promise.resolve(null)
    } catch (e: Exception) {
      promise.reject("REPORT_EVENT_ERROR", e.message, e)
    }
  }

  override fun setExternalData(id: String, name: String, promise: Promise) {
    try {
      PushSDK.setExternalData(id, name)
      promise.resolve(null)
    } catch (e: Exception) {
      promise.reject("SET_EXTERNAL_DATA_ERROR", e.message, e)
    }
  }

  companion object {
    const val NAME = "Activetrail"
  }
}
