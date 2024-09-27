declare module "@salesforce/apex/WhatsappSendMsgController.checkPermission" {
  export default function checkPermission(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/WhatsappSendMsgController.getTemplates" {
  export default function getTemplates(param: {recordId: any, classification: any}): Promise<any>;
}
declare module "@salesforce/apex/WhatsappSendMsgController.sendData" {
  export default function sendData(param: {recordId: any, templateName: any, templateText: any, phone: any}): Promise<any>;
}
declare module "@salesforce/apex/WhatsappSendMsgController.getPicklist" {
  export default function getPicklist(): Promise<any>;
}
declare module "@salesforce/apex/WhatsappSendMsgController.getName" {
  export default function getName(param: {recordId: any}): Promise<any>;
}
