package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.dao.WalletTransactionsDao;
import bitshyd.dbmsproject.web.model.User;
import bitshyd.dbmsproject.web.model.WalletTransaction;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WalletController
 */
public class WalletController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public WalletController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(); 
		if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Customer")){
			response.sendRedirect("Error");
			return;
		}
		int customerID = Integer.parseInt(session.getAttribute("UserID").toString());
		User customer = (new UserDao()).getCustomer(customerID);
		int walletBalance = customer.getWalletAmount();
		request.setAttribute("WalletBalance", walletBalance);
		ArrayList<WalletTransaction> arrTransactions = (new WalletTransactionsDao()).getAllTransactions(customerID);
		request.setAttribute("model", arrTransactions);
		RequestDispatcher rd = request.getRequestDispatcher("Wallet.jsp");
		rd.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(); 
		if(session.getAttribute("UserID") == null || session.getAttribute("UserRole") == null || !session.getAttribute("UserRole").toString().equalsIgnoreCase("Customer")){
			response.sendRedirect("Error");
			return;
		}
		int customerID = Integer.parseInt(session.getAttribute("UserID").toString());
		String strAddAmount = request.getParameter("addamount");
		if (strAddAmount != null) {
			int addAmount= Integer.parseInt(strAddAmount);
			int transactionSuccess=1;
			if (addAmount > 0) {
				WalletTransaction transaction = new WalletTransaction();
				transaction.setTransactionText("Deposit");
				transaction.setCustomerId(customerID);
				transaction.setAmount(addAmount);
				transaction.setTransactionSuccess(transactionSuccess);
				 (new WalletTransactionsDao()).addTransaction(transaction);
			}
		}		
		doGet(request, response);
	}

}
