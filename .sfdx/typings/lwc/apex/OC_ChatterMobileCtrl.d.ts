declare module "@salesforce/apex/OC_ChatterMobileCtrl.getFeedElements" {
  export default function getFeedElements(param: {objectId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ChatterMobileCtrl.postFeedElementPlain" {
  export default function postFeedElementPlain(param: {objectId: any, objectName: any, text: any, fileDocumentIds: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ChatterMobileCtrl.likePostElement" {
  export default function likePostElement(param: {feedElementId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ChatterMobileCtrl.likeCommentElement" {
  export default function likeCommentElement(param: {commentId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ChatterMobileCtrl.deletePostFile" {
  export default function deletePostFile(param: {documentId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ChatterMobileCtrl.deletePost" {
  export default function deletePost(param: {feedElementId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ChatterMobileCtrl.deleteLike" {
  export default function deleteLike(param: {likeId: any}): Promise<any>;
}
