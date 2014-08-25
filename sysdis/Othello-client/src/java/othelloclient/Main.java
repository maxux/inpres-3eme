/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package othelloclient;

import gui.Login;
import javax.ejb.EJB;
import sysdis.SessionRemote;

/**
 *
 * @author root
 */
public class Main {
    @EJB
    private static SessionRemote session;
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Starting client...");
        System.out.println(session.Starter());
        
        //
        // FIXME: WebServices Demo
        //
        if(true) {
            new WebServicesDemo(session);
            return;
        }
        //
        //
        //
        
        Communication communication = new Communication(session);
        
        // pop login box
        Login login = new Login(communication);
        login.setVisible(true);
    }    
}
