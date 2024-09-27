declare module "@salesforce/apex/StatusAppsController.getAppsStatus" {
  export default function getAppsStatus(): Promise<any>;
}
declare module "@salesforce/apex/StatusAppsController.registerLog" {
  export default function registerLog(param: {caseId: any, androidStatus: any, iosStatus: any}): Promise<any>;
}
