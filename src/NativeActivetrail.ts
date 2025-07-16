import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  init(apiKey: string, enableLogs?: boolean): void;

  linkUser(user: {
    email?: string;
    phone?: string;
    firstName?: string;
    lastName?: string;
    extra?: { [key: string]: string | number };
  }): void;

  reportEvent(uuid: string): void;

  setExternalData(id: string, name: string): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('Activetrail');
