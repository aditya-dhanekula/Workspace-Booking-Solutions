package bitshyd.dbmsproject.web.model;

import java.sql.Timestamp;

public class WalletTransaction {

	private int TransactionId=0;
	private String TransactionText="";
	private int CustomerId=0;
	private User Customer;
	private int Amount=0;
	private int TransactionSuccess=0;
	private Timestamp TimeCreate;
	
	public int getTransactionId() {
		return TransactionId;
	}
	public void setTransactionId(int transactionId) {
		TransactionId = transactionId;
	}
	
	public String getTransactionText() {
		return TransactionText;
	}
	public void setTransactionText(String transactionText) {
		TransactionText = transactionText;
	}
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	
	public User getCustomer() {
		return Customer;
	}
	public void setCustomer(User customer) {
		Customer = customer;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public int getTransactionSuccess() {
		return TransactionSuccess;
	}
	public void setTransactionSuccess(int transactionSuccess) {
		TransactionSuccess = transactionSuccess;
	}
	public Timestamp getTimeCreate() {
		return TimeCreate;
	}
	public void setTimeCreate(Timestamp timeCreate) {
		TimeCreate = timeCreate;
	}

}
