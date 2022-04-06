package com.college.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.college.updateLoginDetails.ChangeAllLoginDeatils;
import com.college.updateLoginDetails.ChangeEmail;
import com.college.updateLoginDetails.ChangeMobileNumber;
import com.college.updateLoginDetails.ChangeSecurityPin;
import com.college.updateLoginDetails.ChangeSecurityQuestionAnswer;
import com.college.dataValidation.DataValidation;
import com.college.teacher.dao.ChangePassword;

/**
 * Servlet implementation class ChangeLoginDetails
 */
@WebServlet("/ChangeLoginDetails")
@MultipartConfig()
public class ChangeLoginDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeLoginDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status=null;
		
		try {
		String action=request.getParameter("action");
		//All login details parameters
		String recoveryPhoneNumber=request.getParameter("recoveryPhoneNumber");
		String existingPhoneNumber=request.getParameter("existingPhoneNumber");
		String newPhoneNumber=request.getParameter("newPhoneNumber");
		String existingEmail=request.getParameter("existingEmail");
		String newEmail=request.getParameter("newEmail");
		String existingSecurityPin=request.getParameter("existingSecurityPin");
		String newSecurityPin=request.getParameter("newSecurityPin");
		String idNumber=request.getParameter("idNumber");
		String existingSecurityQuestion=request.getParameter("existingSecurityQuestion");
		String existingSecurityQuestionAnswer=request.getParameter("existingSecurityQuestionAnswer");
		String newSecurityQuestion=request.getParameter("newSecurityQuestion");
		String newSecurityQuestionAnswer=request.getParameter("newSecurityQuestionAnswer");
		String currentPassword=request.getParameter("currentPassword");
		String newPassword=request.getParameter("newPassword");
		String reNewPassword=request.getParameter("reNewPassword");
		String teacherId=request.getParameter("teacherId");
		String recoveryEmail=request.getParameter("recoveryEmail");
		String DOB=request.getParameter("DOB");
        Part teacherPhoto=request.getPart("teacherPhoto");
        String recoveryPhoneNubmerOld=request.getParameter("recoveryPhoneNubmerOld");
		String recoveryemailOld=request.getParameter("recoveryemailOld");
		String dobOld=request.getParameter("dobOld");
        
	    if(action.trim().equalsIgnoreCase("changeMobileNumber")) {
	    	status=changeMobileNumber(existingEmail,existingPhoneNumber,newPhoneNumber,idNumber,existingSecurityPin,existingSecurityQuestion,existingSecurityQuestionAnswer);
	    }else if(action.trim().equalsIgnoreCase("changeEmail")) {
	    	status=changeEmail(existingPhoneNumber, existingEmail, newEmail, idNumber, existingSecurityPin, existingSecurityQuestion, existingSecurityQuestionAnswer);
	    }else if(action.trim().equalsIgnoreCase("changePin")) {
	    	status=changeSecurityPin(existingPhoneNumber, existingEmail,existingSecurityPin, newSecurityPin, idNumber, existingSecurityQuestion,existingSecurityQuestionAnswer);
	    }else if(action.trim().equalsIgnoreCase("changeSecurityQuestionAnswer")) {
	    	status=changeSecurityQuestionAnswer(existingPhoneNumber,existingEmail,existingSecurityPin,idNumber,existingSecurityQuestion,existingSecurityQuestionAnswer,newSecurityQuestionAnswer);
	    }else if(action.trim().equalsIgnoreCase("changeAllLoginDetails")) {
	    	status=changeAllLoginDetails(recoveryPhoneNumber,existingPhoneNumber,newPhoneNumber,existingEmail,newEmail,existingSecurityPin,newSecurityPin,idNumber,existingSecurityQuestion,existingSecurityQuestionAnswer,newSecurityQuestion,newSecurityQuestionAnswer);
	    }
		else if(action.trim().equalsIgnoreCase("teacherPassword")) {
	    	
			String dataValidationResult=new DataValidation().changeTeacherPassword(existingEmail, currentPassword, newPassword, reNewPassword);

			if(dataValidationResult.trim().equalsIgnoreCase("True")) {
			status=new ChangePassword().changeTeacherPassword(teacherId,existingEmail, currentPassword, newPassword, reNewPassword);
			}else {
			
				status=	dataValidationResult;
			}
			
	    }
       else if(action.trim().equalsIgnoreCase("teacherDetails")) {
	    	
		    	 status=new ChangePassword().updateDetails(teacherId, recoveryEmail, recoveryPhoneNumber, DOB, teacherPhoto);
		
			
	    }
	    else {
	    	status="Something went wrong.Please try again";
	    }
	    
	    

		}catch(Exception e) {
			e.printStackTrace();
			status="Something went wrong.Please try again";
		}
		response.getWriter().append(status);
	}

//Method For Updating Mobile Number
public String changeMobileNumber(String existingEmail,String existingPhoneNumber,String newPhoneNumber,String idNumber,String existingSecurityPin,String existingSecurityQuestion,String existingSecurityQuestionAnswer) {
	String result=null;
	//System.out.println("ChangeMobile"+ existingEmail+" "+existingPhoneNumber+" "+newPhoneNumber+" "+idNumber+" "+existingSecurityPin+" "+existingSecurityQuestion+" "+existingSecurityQuestionAnswer);
	String dataValidationResult=new DataValidation().changeMobileNumberDataValidation(existingEmail, existingPhoneNumber, newPhoneNumber, idNumber, existingSecurityPin, existingSecurityQuestion, existingSecurityQuestionAnswer);
	//Checking Data Validation 
	if(dataValidationResult.trim().equalsIgnoreCase("True")) {
		//DB Check For Change Mobile Request
		String dbUpdateStatus=new ChangeMobileNumber().changeMobileNumber(existingEmail, existingPhoneNumber, newPhoneNumber, idNumber, existingSecurityPin, existingSecurityQuestion, existingSecurityQuestionAnswer);
		if(dbUpdateStatus.trim().equalsIgnoreCase("Updated")) {
			result="Mobile Number Updated Successfully";
		}
		else if(dbUpdateStatus.trim().equalsIgnoreCase("Not Updated")) {
			result="Error While Updating Mobile Number";
		}
		else {
			result=dbUpdateStatus.trim();
		}
	}else if(dataValidationResult.trim().equalsIgnoreCase("Existing and New Mobile Number can't be same")) {
		result=dataValidationResult.trim();
	}
	else {
		
		result="Please Enter/Select a valid "+dataValidationResult;
	}
	
	
	return result;
}

//Method for update email
public String changeEmail(String existingPhoneNumber,String existingEmail,String newEmail,String idNumber,String existingSecurityPin,String existingSecurityQuestion,String existingSecurityQuestionAnswer) {
	String result=null;
	String dataValidationResult=new DataValidation().changeEmailDataValidation(existingPhoneNumber, existingEmail, newEmail, idNumber, existingSecurityPin, existingSecurityQuestion, existingSecurityQuestionAnswer);
	
	if(dataValidationResult.trim().equalsIgnoreCase("True")) {
	String dbStatus=new ChangeEmail().changeEmail(existingPhoneNumber, existingEmail, newEmail, idNumber, existingSecurityPin, existingSecurityQuestion, existingSecurityQuestionAnswer);
	  if(dbStatus.trim().equalsIgnoreCase("Updated")) {
		  result="Email Updated Successfully";
	  }
	  else if(dbStatus.trim().equalsIgnoreCase("Not Updated")) {
		  result="Error While Updating Email";
	  }
	  else {
		  result=dbStatus.trim();
	  }
	}
	else if(dataValidationResult.trim().equalsIgnoreCase("Existing and New Email can't be same")) {
		result=dataValidationResult;
	}
	else {
		result="Please Enter/Select a valid "+dataValidationResult;
	}
	return result;
}

//Method for change security pin
public String changeSecurityPin(String existingPhoneNumber,String existingEmail,String existingSecurityPin,String newSecurityPin,String idNumber,String existingSecurityQuestion,String existingSecurityQuestionAnswer) {
String result=null;
String dataValidationResult=new DataValidation().changeSecurityPinDataValidation(existingPhoneNumber, existingEmail, existingSecurityPin, newSecurityPin, idNumber, existingSecurityQuestion, existingSecurityQuestionAnswer);
if(dataValidationResult.trim().equalsIgnoreCase("True")) {
String dbStatus=new ChangeSecurityPin().changeSecurityPin(existingPhoneNumber, existingEmail, existingSecurityPin, newSecurityPin, idNumber, existingSecurityQuestion, existingSecurityQuestionAnswer);
  if(dbStatus.trim().equalsIgnoreCase("Updated")) {
	  result="Security Pin Updated Successfully";
  }
  else if(dbStatus.trim().equalsIgnoreCase("Not Updated")) {
	  result="Error While Updating Security Pin";
  }
  else {
	  result=dbStatus.trim();
  }
}
else if(dataValidationResult.trim().equalsIgnoreCase("Existing and New Security Pin can't be same")) {
	result=dataValidationResult;
}
else {
	result="Please Enter/Select a valid "+dataValidationResult;
}
return result;
}

//Method for update Security Question Answer
public String changeSecurityQuestionAnswer(String existingPhoneNumber,String existingEmail,String existingSecurityPin,String idNumber,String existingSecurityQuestion,String existingSecurityQuestionAnswer,String newSecurityQuestionAnswer) {
	String result=null;
	String dataValidationResult=new DataValidation().changeSecurityQuestionAnswerDataValidation(existingPhoneNumber, existingEmail, existingSecurityPin, idNumber, existingSecurityQuestion, existingSecurityQuestionAnswer, newSecurityQuestionAnswer);
	if(dataValidationResult.trim().equalsIgnoreCase("True")) {
	String dbStatus=new ChangeSecurityQuestionAnswer().changeSecurityQuestionAnswer(existingPhoneNumber, existingEmail, existingSecurityPin, idNumber, existingSecurityQuestion, existingSecurityQuestionAnswer, newSecurityQuestionAnswer);
	  if(dbStatus.trim().equalsIgnoreCase("Updated")) {
		  result="Security Question's Answer Updated Successfully";
	  }
	  else if(dbStatus.trim().equalsIgnoreCase("Not Updated")) {
		  result="Error While Updating Security Question's Answer";
	  }
	  else {
		  result=dbStatus.trim();
	  }
	}
	else if(dataValidationResult.trim().equalsIgnoreCase("Existing and New Security Question's Answer can't be same")) {
		result=dataValidationResult;
	}
	else {
		result="Please Enter/Select a valid "+dataValidationResult;
	}
	return result;
}

//Method for Change All login details

public String changeAllLoginDetails(String recoveryPhoneNumber,String existingPhoneNumber,String newPhoneNumber,String existingEmail,String newEmail,String existingSecurityPin,String newSecurityPin,String idNumber,String existingSecurityQuestion,
		String existingSecurityQuestionAnswer,String newSecurityQuestion,String newSecurityQuestionAnswer) {
	String result=null;
	String dataValidationResult=new DataValidation().changeAllLoginDetailsDataValidation(recoveryPhoneNumber, existingPhoneNumber, newPhoneNumber, existingEmail, newEmail, existingSecurityPin, newSecurityPin, idNumber, existingSecurityQuestion, existingSecurityQuestionAnswer, newSecurityQuestion, newSecurityQuestionAnswer);
	if(dataValidationResult.trim().equalsIgnoreCase("True")) {
		
		String duplicateDataValidationResult=new DataValidation().changeAllLoginDetailsDuplicateDataCheck(existingPhoneNumber, newPhoneNumber, existingEmail, newEmail, existingSecurityPin, newSecurityPin, existingSecurityQuestion, newSecurityQuestion, existingSecurityQuestionAnswer, newSecurityQuestionAnswer);
		if(duplicateDataValidationResult.trim().equalsIgnoreCase("True")) {
			String dbStatus=new ChangeAllLoginDeatils().changeAllLoginDetails(recoveryPhoneNumber, existingPhoneNumber, newPhoneNumber, existingEmail, newEmail, existingSecurityPin, newSecurityPin, idNumber, existingSecurityQuestion, existingSecurityQuestionAnswer, newSecurityQuestion, newSecurityQuestionAnswer);
			if(dbStatus.trim().equalsIgnoreCase("Updated")) {
				  result="Login Details Updated Successfully";
			  }
			  else if(dbStatus.trim().equalsIgnoreCase("Not Updated")) {
				  result="Error While Updating Login Details Details";
			  }
			  else {
				  result=dbStatus.trim();
			  }
		}else {
			result=duplicateDataValidationResult+" can't be same";
			
		}	
	}else {
		result="Please Enter/Choose a valid "+dataValidationResult;
	}
	return result;
}
}


