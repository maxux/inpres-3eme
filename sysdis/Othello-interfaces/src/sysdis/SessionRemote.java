/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sysdis;

import java.util.List;
import javax.ejb.Remote;
import shared.*;

/**
 *
 * @author root
 */
@Remote
public interface SessionRemote {

    String Hello();

    String Starter();

    String UserLogin(String login);

    List ListeParties();

    void UserDisconnect(String login);

    int GameCreation(String name, String username, boolean save);

    Boolean CheckLogin(String login);

    List<Parties> WebGetMyParties(String username);

    Board WebGetMyBoard(String username);

    Parties WebGetPartieById(int id);

    List<Parties> WebListParties();

    List<Parties> WebGetPartiesFinished(boolean finished);
    
    
}
