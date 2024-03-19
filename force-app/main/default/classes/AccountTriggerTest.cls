@IsTest
public class AccountTriggerTest {

    @isTest static void testAccountInsert() {
        Test.startTest();
        INSERT new Account(Name = 'Test12345$');
        List<Contact> contacts = [SELECT Id FROM Contact WHERE LastName = 'Test12345$'];
        Test.stopTest();
        System.assertEquals(1, contacts.size(), 'There should be a contact for the account that was just created');
    }
}