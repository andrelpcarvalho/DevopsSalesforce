declare module "@salesforce/apex/PIDController.getQuestionsAndAnswers" {
  export default function getQuestionsAndAnswers(param: {recordId: any, numberOfQuestions: any, products: any}): Promise<any>;
}
declare module "@salesforce/apex/PIDController.updateCase" {
  export default function updateCase(param: {recordId: any, pidSuccessful: any, questionsToLog: any}): Promise<any>;
}
