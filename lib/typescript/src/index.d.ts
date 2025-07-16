export declare function init(apiKey: string, enableLogs?: boolean): void;
export declare function linkUser(user: {
    email?: string;
    phone?: string;
    firstName?: string;
    lastName?: string;
    extra?: {
        [key: string]: string | number;
    };
}): void;
export declare function reportEvent(uuid: string): void;
export declare function setExternalData(id: string, name: string): void;
declare const _default: {
    init: typeof init;
    linkUser: typeof linkUser;
    reportEvent: typeof reportEvent;
    setExternalData: typeof setExternalData;
};
export default _default;
//# sourceMappingURL=index.d.ts.map