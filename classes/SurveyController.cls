public without sharing class SurveyController {
    @AuraEnabled(Cacheable=true)
    public static List<Question__c> getQuestions() {
        List<Question__c> questions = [
                SELECT Id,
                        Name,
                        Active__c,
                        Additional_Information__c,
                        Type__c,
                        Question__c,
                        Step__c,
                        Survey__c
                FROM Question__c
                ORDER BY Step__c
        ];
        return questions;
    }

    @AuraEnabled
    public static List<Answer__c> createSurveyAnswers(SurveyAnswersWrapper surveyAns) {
        Account acc = new Account();
        List<Account> accs = [SELECT Id FROM Account WHERE Name = 'Ankieta' LIMIT 1];
        if (accs.isEmpty()) {
            acc = new Account(Name = 'Ankieta');
            insert acc;
        } else {
            acc = accs.get(0);
        }

        List<AnswerWrapper> answers = (List<AnswerWrapper>) JSON.deserialize(surveyAns.answersAsJson, List<AnswerWrapper>.class);
        List<Answer__c> ansToInsert = new List<Answer__c>();

        Database.DMLOptions dml = new Database.DMLOptions();
        dml.duplicateRuleHeader.allowSave = true;
        Contact contact = new Contact();
        contact.LastName = 'User';
        contact.AccountId = acc.Id;
        contact.Email = 'user@user.com';
        Database.insert(contact, dml);

        for (AnswerWrapper ans : answers) {
            if (ans.questionName != 'Education' && ans.questionName != 'Gender' && ans.questionName != 'Age') {
                Answer__c answer = new Answer__c();
                answer.Answer__c = ans.value;
                answer.Question__c = ans.questionId;
                answer.Contact__c = contact.Id;
                answer.Time__c = ans.timeVal;
                answer.Read_More__c = ans.readMore;
                answer.Read_More_Time__c = ans.timeRM;
                answer.Name = String.valueOf(Datetime.now()) + ' - ' + ans.value;
                ansToInsert.add(answer);
            } else if (ans.questionName == 'Gender') {
                contact.Gender__c = ans.value;
            } else if (ans.questionName == 'Age') {
                contact.Age__c = Integer.valueof(ans.value);
            } else {
                contact.Education__c = ans.value;
            }
        }

        insert ansToInsert;
        update contact;
        return ansToInsert;
    }

    class SurveyAnswersWrapper {
        @AuraEnabled
        public String answersAsJson { get; set; }
    }

    class AnswerWrapper {
        public String value { get; set; }
        public String readMore { get; set; }
        public Integer timeVal { get; set; }
        public Integer timeRM { get; set; }
        public String questionId { get; set; }
        public String questionName { get; set; }
    }
}