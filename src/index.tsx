import ActiveTrailModule from './NativeActivetrail'; // ✅ this is correct
import type { Spec } from './NativeActivetrail';

const ActiveTrail: Spec = ActiveTrailModule;

export function init(apiKey: string, enableLogs: boolean = false): void {
  return ActiveTrail.init(apiKey, enableLogs);
}

export function linkUser(user: {
  email?: string;
  phone?: string;
  firstName?: string;
  lastName?: string;
  extra?: { [key: string]: string | number };
}): void {
  return ActiveTrail.linkUser(user);
}

export function reportEvent(uuid: string): void {
  return ActiveTrail.reportEvent(uuid);
}

export function setExternalData(id: string, name: string): void {
  return ActiveTrail.setExternalData(id, name);
}

export default {
  init,
  linkUser,
  reportEvent,
  setExternalData,
};
