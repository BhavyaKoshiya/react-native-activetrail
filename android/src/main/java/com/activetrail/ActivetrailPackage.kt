package com.reactnativeactivetrail

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider
import com.facebook.react.turbomodule.core.TurboReactPackage

class ActivetrailPackage : TurboReactPackage() {

  override fun getModule(name: String, context: ReactApplicationContext): NativeModule? {
    return if (name == ActivetrailModule.NAME) {
      ActivetrailModule(context)
    } else null
  }

  override fun getReactModuleInfoProvider(): ReactModuleInfoProvider {
    return ReactModuleInfoProvider {
      mapOf(
        ActivetrailModule.NAME to ReactModuleInfo(
          ActivetrailModule.NAME,
          ActivetrailModule::class.java.name,
          true,   // canOverrideExistingModule
          false,  // needsEagerInit
          true,   // hasConstants
          false,  // isCxxModule
          true    // isTurboModule
        )
      )
    }
  }
}
