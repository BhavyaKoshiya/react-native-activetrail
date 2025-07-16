"use strict";

import ActiveTrailModule from "./NativeActivetrail.js"; // ✅ this is correct

const ActiveTrail = ActiveTrailModule;
export function init(apiKey, enableLogs = false) {
  return ActiveTrail.init(apiKey, enableLogs);
}
export function linkUser(user) {
  return ActiveTrail.linkUser(user);
}
export function reportEvent(uuid) {
  return ActiveTrail.reportEvent(uuid);
}
export function setExternalData(id, name) {
  return ActiveTrail.setExternalData(id, name);
}
export default {
  init,
  linkUser,
  reportEvent,
  setExternalData
};
//# sourceMappingURL=index.js.map