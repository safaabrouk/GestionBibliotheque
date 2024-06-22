package test;

import java.sql.SQLException;

import models.Livre;
import services.ServiceLivre;

public class testDao {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Livre l = ServiceLivre.ChercherLivreViaId(1);
        System.out.println(l);
	}

}
