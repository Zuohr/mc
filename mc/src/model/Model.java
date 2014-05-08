
package model;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

//hello

public class Model {
	private CandidateDAO userDAO;

	public Model(ServletConfig config) throws ServletException {
	
		userDAO=new CandidateDAO();
	}
	public CandidateDAO getUserDAO() {return userDAO;}
}
