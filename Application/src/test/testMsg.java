package test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import models.Emprunt;
import models.Reservation;
import services.ServiceEmprunt;
import services.ServiceReservation;




public class testMsg {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		 Reservation l = ServiceReservation.ChercherReservationViaEmprunt(1,4);
		 System.out.println(l);
	}

}
