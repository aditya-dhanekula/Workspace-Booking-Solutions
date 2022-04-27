package bitshyd.dbmsproject.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import bitshyd.dbmsproject.web.model.WalletTransaction;

public class WalletTransactionsDao {
	
	public void addTransaction(WalletTransaction transaction) {
		Connection con = null;
		PreparedStatement st= null;
		try {
			con=Database.getConnection();
			st = con.prepareStatement("insert into wallettransactions (TransactionText, CustomerId, Amount, TransactionSuccess, TimeCreate) "
					+ "values (?, ?, ?, ?, now());");
			st.setString(1, transaction.getTransactionText());
			st.setInt(2, transaction.getCustomerId());
			st.setInt(3, transaction.getAmount());
			st.setInt(4, transaction.getTransactionSuccess());
			st.executeUpdate();
			if(transaction.getTransactionSuccess() > 0) {
				st.close();
				st = con.prepareStatement("update Customers set WalletAmount= WalletAmount + ?, Timeupdate= now() where CustomerId=?;");
				st.setInt(1, transaction.getAmount());
				st.setInt(2, transaction.getCustomerId());
				st.executeUpdate();
			}
			st.close();
		}
		catch(Exception e) {
			
			e.printStackTrace();
			if (st != null){
				System.out.println(st.toString());
			}	
		}
	}
	
	public ArrayList<WalletTransaction> getAllTransactions(int CustomerId){
		Connection con = null;
		PreparedStatement st = null;
		try {
			con=Database.getConnection();
			st=con.prepareStatement("select * from wallettransactions where CustomerId=? order by TimeCreate DESC;");
			st.setInt(1, CustomerId );
			ResultSet rs= st.executeQuery();
			ArrayList<WalletTransaction> arrTransactions = new ArrayList<WalletTransaction>();
			while (rs.next()) {
				arrTransactions.add(setWalletTransactionObject(rs, false));
			}
			rs.close();
			st.close();
			return arrTransactions; 
		}
		catch(Exception e) {
			e.printStackTrace();
			if (st != null) {
				System.out.print("\n" + st.toString());
			}
		}
		return null;
	}
	
	private WalletTransaction setWalletTransactionObject(ResultSet rs, boolean withCustomerObject) throws SQLException {
		WalletTransaction transaction = new WalletTransaction();
		transaction.setTransactionId(rs.getInt("TransactionId"));
		transaction.setTransactionText(rs.getString("TransactionText"));
		transaction.setCustomerId(rs.getInt("CustomerId"));
		if (withCustomerObject) {
			transaction.setCustomer((new UserDao()).getCustomer(transaction.getCustomerId()));
		}
		transaction.setAmount(rs.getInt("Amount"));
		transaction.setTransactionSuccess(rs.getInt("TransactionSuccess"));
		transaction.setTimeCreate(rs.getTimestamp("TimeCreate"));
		return transaction;
	}
	
	

}
