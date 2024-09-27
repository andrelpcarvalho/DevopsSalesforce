declare module "@salesforce/apex/CardTrackingController.getCardTracking" {
  export default function getCardTracking(param: {recordId: any, ultimosQuatroDigitos: any}): Promise<any>;
}
declare module "@salesforce/apex/CardTrackingController.startTracking" {
  export default function startTracking(param: {recordId: any, cardAccount: any, card: any, trackingStatus: any}): Promise<any>;
}
declare module "@salesforce/apex/CardTrackingController.checkPermissionSet" {
  export default function checkPermissionSet(param: {components: any}): Promise<any>;
}
