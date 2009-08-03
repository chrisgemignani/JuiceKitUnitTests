package {

  import flexunit.framework.TestCase;


  public class BankAccountTest extends TestCase {

    /**
     * Test Deposit
     */
    public function testDeposit():void {
      var bankAccount:BankAccount = new BankAccount();
      bankAccount.deposit(50);
      assertTrue("Balance on a new account after 50 deposit is 50", bankAccount.getBalance() == 50);
      bankAccount.deposit(25);
      assertEquals("Balance after 50 deposit and another 25 deposit is 75", 75, bankAccount.getBalance());

    }


    /**
     * Test withdraw
     */
    public function testWithdraw():void {
      var bankAccount:BankAccount = new BankAccount();
      bankAccount.deposit(100);
      bankAccount.withdraw(50);
      assertTrue("Balance on a new account after 100 deposit and a 50 withdraw is 50", bankAccount.getBalance() == 50);


    }

  }
}