public class AccountTriggerHandler {
	/**
	 * @description A common function to handle all operations to be done on insert of an account
	 * @param newAccounts A list of accounts with newer values as provided by Trigger.new context variable. 
	 */
    public void handleAfterInsert(List<Account> newAccounts) {
        List<Contact> contactsForAccount = new List<Contact>();
        
        for(Account account : newAccounts) {
        	contactsForAccount.add(new Contact(
            	LastName = account.Name,
                AccountId = account.Id
            ));   
        }
        
        if(!contactsForAccount.isEmpty()) {
            try {
                INSERT contactsForAccount;
            }catch (Exception e) {
                System.debug(e.getMessage());
                throw e;
            }
        }
    }
}