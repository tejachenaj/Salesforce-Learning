public with sharing class testApex {

    @AuraEnabled
    public static string createContact(String accId){

        Account accList = [select Id,Name,Phone from Account where id=:accId];
        Contact con = new Contact();
        con.LastName = accList.Name;
        con.Phone	= accList.Phone;
        con.AccountId = accList.Id;
        insert con;
        return con.Id;

    }

    @AuraEnabled
    public static String createContactObj(Contact contObj){
        system.debug('contact Object'+contObj);
        insert contObj;
        System.debug('after insert'+contObj);
        return contObj.Id;

    }

    @Auraenabled
    public static list<contact> getContacts()
    {
        list<contact> conList = [select Id , firstName,lastName,Phone from contact
                                 order by createdDate desc limit 10];
        return conList;
    }

    @Auraenabled
    public static list<contact> getAccounts()
    {
        list<contact> conList = [select Id , firstName,lastName,Phone from Account
                                 order by createdDate desc limit 10];
        return conList;
    }
}
