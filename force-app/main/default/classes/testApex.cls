public with sharing class testApex {

    @AuraEnabled
    public static List<sObject> getDynamicRecords(String objName)
    {
        return database.query('select Id,Name from '+ objName +' limit 10');
    }
}
