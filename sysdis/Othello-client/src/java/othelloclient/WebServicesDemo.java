/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package othelloclient;

import java.util.List;
import shared.*;
import sysdis.SessionRemote;

/**
 *
 * @author root
 */
public class WebServicesDemo {
    private static SessionRemote session;
            
    WebServicesDemo(SessionRemote session) {
        this.session = session;
        System.out.println("--- ListMyGames ---");
        ListMyGames("user1");
        
        System.out.println("--- GetMyBoard ---");
        GetMyBoard("user1");
        
        System.out.println("--- ListGamesFinished (true) ---");
        ListGamesFinished(true);
        
        System.out.println("--- ListGamesFinished (false) ---");
        ListGamesFinished(false);
        
        System.out.println("--- ListGames ---");
        ListGames();
        
        System.out.println("--- GetGameById ---");
        GetGameById(1);
    }
    
    private void ListMyGames(String username) {
        List<Parties> parties = session.WebGetMyParties(username);
        
        for(Parties p : parties) {
            System.out.println(p.author + " | " + p.created + " | " + p.player2);
        }
    }
    
    private void GetMyBoard(String username) {
        Board board = session.WebGetMyBoard(username);
        System.out.println(board.username + " | " + board.win + " | " + board.lost + " = " + board.total);
    }
    
    private void ListGamesFinished(boolean finished) {
        List<Parties> parties = session.WebGetPartiesFinished(finished);
        
        for(Parties p : parties) {
            System.out.println(p.author + " | " + p.created + " | " + p.player2);
        }
    }
    
    private void ListGames() {
        List<Parties> parties = session.WebListParties();
        
        for(Parties p : parties) {
            System.out.println(p.author + " | " + p.created + " | " + p.player2);
        }
    }
    
    private void GetGameById(int id) {
        Parties p = session.WebGetPartieById(id);
        System.out.println(p.author + " | " + p.created + " | " + p.player2);
    }
}
