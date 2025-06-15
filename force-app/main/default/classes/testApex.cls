public with sharing class testApex {

    @Auraenabled
    public static string createContact(Contact conObj)
    {
        //System.debug('Cont Obj'+conObj.FirstName);
        insert conObj;
        return conObj.Id;
    }

    @Auraenabled
    public static list<contact> getContacts()
    {
        list<contact> conList = [select Id , firstName,lastName,Phone from contact
                                 order by createdDate desc limit 10];
        return conList;
    }
}
