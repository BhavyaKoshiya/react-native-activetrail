import type { TurboModule } from 'react-native';
export interface Spec extends TurboModule {
    init(apiKey: string, pushToken?: string, enableLogs?: boolean, useExternalId?: boolean): Promise<void>;
    linkUser(user: {
        email?: string;
        phone?: string;
        firstName?: string;
        lastName?: string;
        extra?: {
            [key: string]: string | number;
        };
    }): Promise<{
        success: boolean;
    }>;
    reportEvent(uuid: string): Promise<void>;
    setExternalData(id: string, name: string): Promise<void>;
}
declare const _default: Spec;
export default _default;
//# sourceMappingURL=NativeActivetrail.d.ts.map