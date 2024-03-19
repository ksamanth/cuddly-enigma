public class AccountTriggerHandler {
	
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