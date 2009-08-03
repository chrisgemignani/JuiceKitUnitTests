package
{
 	public class BankAccount
 	{
  		private var balance:Number=0;
  		
  		public function deposit(amount:Number){
   			balance=balance+amount;
   		}
  		
  		public function withdraw(amount:Number){
   			balance=balance-amount;
   		}
  		
  		public function getBalance():Number{
   			return balance;
   		}		
  	}
}