delete [select id from question__c];
public class Parent{
    List<Sheet1> Sheet1 = new List<Sheet1>();
}
public class Sheet1{
    public String question;
    public String type;
    public String additionalInfo;
    public String step;
}

String input = '{\n' +
        '    "Sheet1": [\n' +
        '        {\n' +
        '            "question": "Czy akceptuje Pan/Pani regulamin naszej witryny?",\n' +
        '            "type": "Interaktywna plansza",\n' +
        '            "step": "1",\n' +
        '            "additionalInfo": "Niniejsza strona korzysta z plików cookie\\n\\nPrzetwarzamy Twoje osobiste dane, np. adres IP, korzystając z takich technologii jak pliki cookie, w celu wyświetlania spersonalizowanych reklam i treści, analizowania tychże, wychodzenia naprzeciw oczekiwaniom użytkowników i rozwoju produktów. Masz wybór odnośnie tego, kto używa Twoich danych i w jakich celach to robi.\\n\\nJeśli wyrazisz na to zgodę, chcielibyśmy również:\\n\\nGromadzić dane dotyczące Twojej lokalizacji geograficznej z dokładnością nawet do kilku metrów\\nIdentyfikować Twoje urządzenie, aktywnie analizując charakteryzującego je zbiory danych (fingerprinting, czyli wirtualny odcisk palca) (www.yit.pl)"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy jest Panu/Pani znany mechanizm \\"HTTP Cookie\\"?",\n' +
        '            "type": "Interaktywna plansza",\n' +
        '            "step": "2",\n' +
        '            "additionalInfo": "Popularnym rozwiązaniem jest wykorzystanie mechanizmu Cookie. Pozwala on serwerowi zapisać w przeglądarce użytkownika niewielkie porcje danych. Przeglądarka przy każdym kolejnym żądaniu do serwera załącza przechowywane Cookie. Dzięki temu serwer jest w stanie rozpoznawać, który użytkownik się z nim komunikuje. (https://geek.justjoin.it)"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy wie Pan/Pani, że UE w 2012 poprzez dyrektywę o prywatności nałożyła obowiązek informacyjny o mechanizmie cookie?",\n' +
        '            "type": "Wiedza",\n' +
        '            "step": "3"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy wie Pani/Pani, że UE wymaga, aby móc stosować mechanizm cookie należy otrzymać jawną zgodę od użytkownika?",\n' +
        '            "type": "Wiedza",\n' +
        '            "step": "4"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy wie Pan/Pani, że mechanizm cookie może być wykorzystywany do utrzymania sesji po zalogowaniu do danego serwisu i ogólnej poprawy funkcjonowania serwisu?",\n' +
        '            "type": "Wiedza",\n' +
        '            "step": "5"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy wie Pan/Pani, że mechanizm cookie może być wykorzystywany do śledzenia zachowania użytkownika tylko i wyłącznie w obrębie danego serwisu przez większość przeglądarek, lecz nadal możliwe jest również śledzenie między witrynami?",\n' +
        '            "type": "Wiedza",\n' +
        '            "step": "6"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy wie Pan/Pani, że możliwe jest całkowite zablokowanie mechanizmu Cookie w ustawieniach przeglądarki internetowej?",\n' +
        '            "type": "Wiedza",\n' +
        '            "step": "7"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy korzysta Pan/Pani, z ustawień przeglądarki internetowej pozwalających na blokowanie mechanizmu Cookie?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "8"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy jest Panu/Pani znany mechanizm \\"VPN\\"?",\n' +
        '            "type": "Interaktywna plansza",\n' +
        '            "step": "9",\n' +
        '            "additionalInfo": "VPN, czyli „Virtual Private Network”, oznacza wirtualną sieć prywatną, która zapewnia bezpieczeństwo połączenia z internetem oraz chroni Twoją prywatność w sieci. VPN tworzy szyfrowany tunel dla danych, chroni Twoją tożsamość online, ukrywając adres IP, i pozwala na bezpieczne korzystanie z publicznych hotspotów Wi-Fi. (https://nordvpn.com)"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy korzysta Pani/Pani z płatnych rozwiązań VPN, aby zapobiec śledzeniu w sieci?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "10"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy wiedząc, że rozwiązanie VPN nie blokuje mechanizmu cookie, chce Pan/Pani korzystać z tego typu usług?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "11"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy jest Panu/Pani znany mechanizm \\"rekomendacji zakupowych\\"?",\n' +
        '            "type": "Interaktywna plansza",\n' +
        '            "step": "12",\n' +
        '            "additionalInfo": "Rekomendacje zakupowe to spersonalizowane listy produktów z bieżącej oferty sklepu internetowego, które są proponowane klientom na podstawie ich preferencji, gustu i potrzeb. Systemy rekomendujące zwiększają szanse na dokonanie zakupu i na zadowolenie klientów. (https://selesto.pl/)"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy uważa Pan/Pani, że email z rekomendacjami produktowymi na podstawie historii przeglądania to agresywna metoda marketingowa?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "13"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy woli Pan/Pani otrzymać email wraz ze spersonalizowanymi rekomendacjami wygenerowanami na podstawie historii przeglądania zamiast wiadomości zachęcającej do zakupu tzw. \\"bestsellera\\"?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "14"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy uważa Pan/Pani, że wiadomość sms z rekomendacjami produktowymi na podstawie historii przeglądania to agresywna metoda marketingowa?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "15"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy uważa Pan/Pani, że wiadomość push (powiadomenie aplikacji na urządzeniu mobilnym) po zakończonej sesji przeglądania produktów to agresywna metoda marketingowa?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "16"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Czy uważa Pan/Pani, że kontakt telefoniczny od sprzedawcy po wzmożonej aktywności internetowej w obrębie danego serwisu to agresywna metoda marketingowa?",\n' +
        '            "type": "Preferencje",\n' +
        '            "step": "17"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Proszę podać wiek",\n' +
        '            "type": "Dane",\n' +
        '            "step": "18"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "\\t\\nProszę podać wykształcenie",\n' +
        '            "type": "Dane",\n' +
        '            "step": "19"\n' +
        '        },\n' +
        '        {\n' +
        '            "question": "Proszę podać płeć",\n' +
        '            "type": "Dane",\n' +
        '            "step": "20"\n' +
        '        }\n' +
        '    ]\n' +
        '}';

Parent wrappers = (Parent) JSON.deserialize(input,Parent.class);
List<Question__c> questions = new List<Question__c>();
Survey__c survey = [SELECT Id FROM Survey__c LIMIT 1];
//System.debug(wrappers.Sheet1);
for(Sheet1 sheet : wrappers.Sheet1){
//    if(String.isBlank(sheet.question)){
//        System.debug('aha');
//        System.debug(sheet.name);
//    }
    Question__c question = new Question__c();
    question.Question__c = sheet.question;
    question.Type__c = sheet.type;
    question.Additional_Information__c = sheet.additionalInfo;
    question.Name =
            question.Question__c.contains('wiek') ? 'Age' :
                    question.Question__c.contains('płeć') ? 'Gender' :
                            question.Question__c.contains('wykształcenie') ? 'Education' :
                                    sheet.step;
    question.Step__c = Integer.valueOf(sheet.step);

    question.Survey__c = survey.Id;
    questions.add(question);
}
insert questions;
