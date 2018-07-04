trigger massdelete on Distributor__c (before insert) {
deleteMproduct obj = new deleteMproduct();
}