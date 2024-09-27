declare module "@salesforce/apex/CloneCampaignController.getCampaigns" {
  export default function getCampaigns(param: {campName: any, campOrigemId: any}): Promise<any>;
}
declare module "@salesforce/apex/CloneCampaignController.getTouchPointsByCampId" {
  export default function getTouchPointsByCampId(param: {campaignId: any}): Promise<any>;
}
declare module "@salesforce/apex/CloneCampaignController.cloneCampaign" {
  export default function cloneCampaign(param: {campaignId: any, cloneRelated: any, lstTouchPointsToCopy: any}): Promise<any>;
}
