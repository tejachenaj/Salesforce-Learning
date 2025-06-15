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

}
