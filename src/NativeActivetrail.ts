import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  init(
    apiKey: string,
    pushToken?: string,
    enableLogs?: boolean,
    useExternalId?: boolean
  ): Promise<void>;

  linkUser(user: {
    email?: string;
    phone?: string;
    firstName?: string;
    lastName?: string;
    extra?: { [key: string]: string | number };
  }): Promise<{ success: boolean }>;

  reportEvent(uuid: string): Promise<void>;

  setExternalData(id: string, name: string): Promise<void>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('Activetrail');
