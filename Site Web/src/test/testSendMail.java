package test;

import tools.CodeSMS;
import tools.SendMail;


public class testSendMail {
public static void main(String[] args) {
	String email="safaabrouk@gmail.com";
	String cd=CodeSMS.generateSMSCode();
	SendMail.sendCode(email,cd);
	
}

}
