/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package db;

import java.util.LinkedList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.transaction.Transaction;
import shared.Board;
import tables.*;

/**
 *
 * @author root
 */
public class DbManager {
    EntityManagerFactory emf = null;
    EntityManager em = null;
    
    public DbManager() {
        emf = Persistence.createEntityManagerFactory("Othello-ejbPU");
        em = emf.createEntityManager();
    }
    
    public EntityTransaction NewTransaction() {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        
        return tx;
    }
    
    //
    // Users
    //
    public String UserLogin(String login) {
        EntityTransaction tx = NewTransaction();
        Users user = em.find(Users.class, login);
        
        if(user == null) {
            System.out.println("[DB] Not found, creating user");
            user = new Users();
            user.setUsername(login);
            user.setConnected(true);
            
        } else {
            System.out.println("[DB] User found");
            System.out.println(user.getUsername());
            user.setConnected(true);
        }
        
        // save user or new state
        em.persist(user);
        tx.commit();
        
        return login;
    }
    
    public void UserDisconnect(String login) {
        EntityTransaction tx = NewTransaction();
        Users user = em.find(Users.class, login);
        
        if(user != null) {
            System.out.println("[DB] Found, setting disconnected flag");
            user.setConnected(false);
            em.persist(user);
            tx.commit();
            
            PartiesRemoveFromAuthor(login);
        }
    }
    
    public Boolean UserCheck(String username) {
        Users user = em.find(Users.class, username);
        
        if(user == null) {
            return true;
            
        } else {
            return !user.isConnected();
        }
    }
    
    //
    // Parties
    //
    public List<Parties> PartiesList() {
        return em.createNamedQuery("Parties.listWaiting").getResultList();
    }
    
    public void PartiesRemoveFromAuthor(String username) {
        EntityTransaction tx = NewTransaction();
        em.createNamedQuery("Parties.removeFrom").setParameter("author", username).executeUpdate();
        tx.commit();
    }

    public Parties PartieUpdatePlayer(int gameid, String username) {
        EntityTransaction tx = NewTransaction();
        Parties partie = em.find(Parties.class, new Long(gameid));
        
        if(partie != null) {
            System.out.println("[DB] Found, setting disconnected flag");
            partie.setPlayer2(username);
            em.persist(partie);
            tx.commit();
        }
        
        return partie;
    }
    
    public int GameCreate(String name, String username, Boolean save) {
        EntityTransaction tx = NewTransaction();
        Parties partie = new Parties();
        
        System.out.println("[DB] Creating new game");
        partie.setName(name);
        partie.setFinished(false);
        partie.setSave(save);
        partie.setAuthor(username);
        
        em.persist(partie);
        tx.commit();
        
        System.out.println("[DB] Game ID: " + partie.getId());
        return partie.getId().intValue();
    }
    
    public void EndGame(int gameid, String winner, int score1, int score2) {
        EntityTransaction tx = NewTransaction();
        Parties partie = em.find(Parties.class, new Long(gameid));
        
        if(partie != null) {
            System.out.println("[DB] Setting winner");
            partie.setWinner((partie.getAuthor().equals(winner)) ? 0 : 1);
            partie.setScore1(score1);
            partie.setScore2(score2);
            partie.setFinished(true);
            em.persist(partie);
            tx.commit();
        }
    }
    
    //
    // History
    //
    public void AddHistory(int gameid, String username, int x, int y) {
        EntityTransaction tx = NewTransaction();
        History history = new History();
        
        history.setGameid(gameid);
        history.setPlayer(username);
        history.setX(x);
        history.setY(y);
        
        em.persist(history);
        tx.commit();
    }
    
    public void Close() {
        em.close();
    }
    
    
    //
    // WebService
    //
    public List<Parties> GameListByUser(String username) {
        return em.createNamedQuery("Parties.listByUser").setParameter("username", username).getResultList();
    }
    
    public List<Parties> GameList() {
        return em.createNamedQuery("Parties.list").getResultList();
    }
    
    public List<Parties> GameListByFinished(boolean finished) {
        return em.createNamedQuery("Parties.listFinished").setParameter("finished", finished).getResultList();
    }
    
    public Parties GameById(int id) {
        return em.find(Parties.class, new Long(id));
    }
    
    public Board GameBoardByUser(String username) {
        List<Parties> parties = em.createNamedQuery("Parties.listByUser").setParameter("username", username).getResultList();
        Board board = new Board(username);
        
        for(Parties p : parties) {
            // player1
            if(p.getAuthor().equals(username)) {
                board.win += (p.getWinner() == 0) ? 1 : 0;
                board.lost += (p.getWinner() == 1) ? 1 : 0;
                        
            // player2
            } else {
                board.win += (p.getWinner() == 1) ? 1 : 0;
                board.lost += (p.getWinner() == 0) ? 1 : 0;
            }
        }
        
        board.total = board.win + board.lost;
        
        return board;
    }
}
