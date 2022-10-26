import { LightningElement } from "lwc";
import getQuestions from "@salesforce/apex/SurveyController.getQuestions";
import createSurveyAnswers from "@salesforce/apex/SurveyController.createSurveyAnswers";
import CHECKMARK from "@salesforce/resourceUrl/checkMark";

export default class Survey extends LightningElement {
  surveyId = "";
  questions = [];
  isLastQuestion = false;
  answers = [];
  question = {};
  counter = 1;
  howmany = 1;
  surveyCompleted = false;
  checkMark = CHECKMARK;

  connectedCallback() {
    getQuestions()
      .then((data) => {
        this.questions = data;
        this.howmany = data.length;
        this.question = this.questions[0];
        this.surveyId = this.questions[0].Survey__c;
      })
      .catch(error => {
        console.log("error");
        console.log(JSON.stringify(error));
      });
  }

  goToNextQuestion(event) {
    this.saveAnswer(event);
    if (this.counter < this.questions.length) {
      this.counter++;
      this.question = this.questions[this.counter - 1];
      if (this.counter == this.questions.length) {
        this.isLastQuestion = true;
      }
    }
  }

  saveAnswer(event) {
    let answer = event.detail.answer;
    this.answers.push(answer);
  }

  sendAnswers(event) {
    this.saveAnswer(event);
    let wrap = {};
    wrap.surveyId = this.surveyId;
    wrap.answersAsJson = JSON.stringify(this.answers);

    let userAnswers = JSON.stringify(this.answers);
    createSurveyAnswers({ surveyAns: wrap })
      .then((data) => {
        this.surveyCompleted = true;
      })
      .catch(error => {
        console.log("error");
        console.log(JSON.stringify(error));
      });
  }
}