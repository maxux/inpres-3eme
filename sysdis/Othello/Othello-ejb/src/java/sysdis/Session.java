/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sysdis;

import db.DbManager;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import shared.Board;
import tables.Parties;

/**
 *
 * @author root
 */
@Stateless
public class Session implements SessionRemote {
    DbManager db = null;
    
    public Session() {
        db = new DbManager();
    }
    
    @Override
    public String Hello() {
        return "Hello world";
    }

    @Override
    public String Starter() {
        return "Client connected.";
    }

    //
    // Users
    //
    public String UserLogin(String login) {
        return db.UserLogin(login);
    }
    
    public void UserDisconnect(String login) {
        System.out.println("[+] Requesting disconnection");
        db.UserDisconnect(login);
        System.out.println("[+] Disconnected.");
    }
    
    public Boolean CheckLogin(String login) {
        return db.UserCheck(login);
    }
    
    //
    // Parties
    //
    public List<shared.Parties> ListeParties() {
        List<Parties> fromdb = db.PartiesList();
        List<shared.Parties> toclient = new LinkedList();
        
        for(Parties partie : fromdb) {
            System.out.println("[SESS] >> " + partie.getName());
            
            shared.Parties temp = new shared.Parties();
            temp.id = partie.getId();
            temp.name = partie.getName();
            temp.created = partie.getCreated();
            toclient.add(temp);
        }
        
        return toclient;
    }

    public int GameCreation(String name, String username, boolean save) {
        System.out.println("[SESS] Requesting new game");
        return db.GameCreate(name, username, save);
    }
    
    //
    //
    //
    shared.Parties PortPartie(tables.Parties in) {
        shared.Parties out = new shared.Parties();
        
        out.id = in.getId();
        out.created = in.getCreated();
        out.author = in.getAuthor();
        out.player2 = in.getPlayer2();
        out.name = in.getName();
        out.finished = in.isFinished();
        out.winner = in.getWinner();
        out.score1 = in.getScore1();
        out.score2 = in.getScore2();
        
        return out;
    }
    
    public List<shared.Parties> WebGetMyParties(String username) {
        List<shared.Parties> parties = new LinkedList();
        List<tables.Parties> inner = db.GameListByUser(username);
        
        for(tables.Parties temp : inner) {
            shared.Parties convert = PortPartie(temp);
            parties.add(convert);
        }
        
        return parties;
    }

    public Board WebGetMyBoard(String username) {
        return db.GameBoardByUser(username);
    }

    public shared.Parties WebGetPartieById(int id) {
        tables.Parties in = db.GameById(id);
        return PortPartie(in);
    }

    public List<shared.Parties> WebListParties() {
        List<shared.Parties> parties = new LinkedList();
        List<tables.Parties> inner = db.GameList();
        
        for(tables.Parties temp : inner) {
            shared.Parties convert = PortPartie(temp);
            parties.add(convert);
        }
        
        return parties;
    }

    public List<shared.Parties> WebGetPartiesFinished(boolean finished) {
        List<shared.Parties> parties = new LinkedList();
        List<tables.Parties> inner = db.GameListByFinished(finished);
        
        for(tables.Parties temp : inner) {
            shared.Parties convert = PortPartie(temp);
            parties.add(convert);
        }
        
        return parties;
    }
    
}
