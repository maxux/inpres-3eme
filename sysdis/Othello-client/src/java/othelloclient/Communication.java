/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package othelloclient;

import gui.GameGrid;
import gui.GameList;
import java.awt.Color;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Session;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicConnectionFactory;
import javax.jms.TopicSession;
import javax.jms.TopicSubscriber;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import shared.MessageProtocol;
import sysdis.SessionRemote;

/**
 *
 * @author root
 */
public class Communication implements MessageListener {
    private static SessionRemote session;
    public GameGrid currentGrid = null;
    public GameList gameList = null;
    public String username = null;
    public int gameid = 0;
    public boolean save = false;
    public int sequence = 0;
    
    public Communication(SessionRemote remote) {
        session = remote;
    }
    
    public void SendMessage(MessageProtocol msg) {
        try {
            sendJMSMessageToTopic2(msg);
        } catch (JMSException ex) {
            Logger.getLogger(Communication.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(Communication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean CheckLogin(String login) {
        return session.CheckLogin(login);
    }
    
    public String Login(String login) {
        System.out.println("[COM] Checking username");        
        this.username = login;
        
        try {
            Messenger();
            
            MessageProtocol data = new MessageProtocol(gameid);
            data.action = "HELLO";
            data.payload = username;
            SendMessage(data);
            
        } catch (NamingException ex) {
            Logger.getLogger(Communication.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JMSException ex) {
            Logger.getLogger(Communication.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return session.UserLogin(login);
    }
    
    public List ListeParties() {
        return (List) session.ListeParties();
    }
    
    public void Disconnect(String login) {
        if(currentGrid != null) {
            currentGrid.Disconnection();
        }
        
        session.UserDisconnect(login);
    }
    
    public int GameCreate(String name, String username, Boolean save) {
        System.out.println("[COM] Requesting new game creation");
        return session.GameCreation(name, username, save);
    }
    
    public void LeaveGame() {
        MessageProtocol data = new MessageProtocol(gameid);
        data.action = "LEAVE";
        data.source = username;
        data.player2 = currentGrid.getPlayer2();
        
        currentGrid.UpdateScore();
        
        data.score1 = (currentGrid.mycolor.equals(Color.black)) ? currentGrid.myscore : currentGrid.score2;
        data.score2 = (currentGrid.mycolor.equals(Color.black)) ? currentGrid.score2 : currentGrid.myscore;
        SendMessage(data);
    }
    
    public void Skip() {
        MessageProtocol data = new MessageProtocol(gameid);
        data.action = "SKIP";
        data.source = username;
        data.player2 = currentGrid.getPlayer2();
        data.payload = "SKIP";
        data.x = ++sequence;
        SendMessage(data);
    }
    
    private void SendScore() {
        MessageProtocol data = new MessageProtocol(gameid);
        data.action = "SCORE";
        data.source = username;
        data.player2 = currentGrid.getPlayer2();
        
        currentGrid.UpdateScore();
        data.score1 = (currentGrid.mycolor.equals(Color.black)) ? currentGrid.myscore : currentGrid.score2;
        data.score2 = (currentGrid.mycolor.equals(Color.black)) ? currentGrid.score2 : currentGrid.myscore;
        data.payload = (currentGrid.myscore > currentGrid.score2) ? username : currentGrid.getPlayer2();
        
        SendMessage(data);
    }
    
    //
    // Messenger
    //
    public void Messenger() throws NamingException, JMSException {
        Context c = new InitialContext();
        TopicConnectionFactory fact = (TopicConnectionFactory) c.lookup("jms/TopicFactory");
        TopicConnection conn = fact.createTopicConnection();
        TopicSession sess = conn.createTopicSession(false, Session.AUTO_ACKNOWLEDGE);
        TopicSubscriber subscriber = sess.createSubscriber((Topic) c.lookup("jms/Topic"), "id = '" + username + "'", false);
        subscriber.setMessageListener(this);
        conn.start();
        
        System.out.println("[COM] Messenger ready");
    }
    
    @Override
    public void onMessage(Message m) {
        try {
            ObjectMessage msg = (ObjectMessage) m;
            MessageProtocol data = m.getBody(MessageProtocol.class);
            System.out.println("[MSG] Source: " + data.source + ", Action: " + data.action + ", Payload: " + data.payload);
            
            if(currentGrid != null) {
                if(data.action.equals("TRY")) {
                    currentGrid.editGrid(data);
                    
                    // reset sequence
                    sequence = 0;
                }
                
                if(data.action.equals("JOIN-ACK")) {
                    currentGrid.setPlayer2(data.payload);
                    currentGrid.setMycolor(data.color);
                    
                    gameid = data.gameid;
                    save = data.save;
                    sequence = 0;
                    
                    System.out.println("[COM] My color: " + data.color);
                }
                
                if(data.action.equals("LEAVE")) {
                    // currentGrid.setPlayer2("<unknown>");
                    if(currentGrid != null)
                        currentGrid.Winner();
                }
                
                if(data.action.equals("NEXT-TRY")) {
                    // it's for me
                    if(data.payload.equals(username)) {
                        currentGrid.enableGrid();
                        currentGrid.setInfo("C'est à vous de jouer !");
                        sequence = data.x;
                        
                    // other player
                    } else {
                        currentGrid.disableGrid();
                        currentGrid.setInfo("En attente d'un coup de l'adversaire");
                    }
                }
                
                if(data.action.equals("END")) {
                    currentGrid.UpdateScore();
                    
                    if(currentGrid.myscore > currentGrid.score2) {
                        currentGrid.Winner();
                        SendScore();
                    
                    } else currentGrid.Looser();
                }
                
            } else {
                if(data.action.equals("JOIN-ACK")) {
                    currentGrid = new GameGrid(this, username);
                    currentGrid.setVisible(true);
                    currentGrid.setPlayer2(data.payload);
                    currentGrid.setMycolor(data.color);
                    
                    gameid = data.gameid;
                    save = data.save;
                    sequence = 0;
                    
                    System.out.println("[COM] My color: " + data.color);
                }
            }
            
        } catch (JMSException ex) {
            Logger.getLogger(Communication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    //
    // magic
    //

    private Message createJMSMessageForjmsTopic(Session session, Object messageData) throws JMSException {
        // TODO create and populate message to send
        ObjectMessage tm = session.createObjectMessage();
        if(username != null)
            tm.setStringProperty("id", "server");
        
        tm.setObject((Serializable) messageData);
        return tm;
    }

    private void sendJMSMessageToTopic2(Object messageData) throws JMSException, NamingException {
        Context c = new InitialContext();
        ConnectionFactory cf = (ConnectionFactory) c.lookup("jms/TopicFactory");
        Connection conn = null;
        Session s = null;
        try {
            conn = cf.createConnection();
            s = conn.createSession(false, s.AUTO_ACKNOWLEDGE);
            Destination destination = (Destination) c.lookup("jms/Topic");
            MessageProducer mp = s.createProducer(destination);
            mp.send(createJMSMessageForjmsTopic(s, messageData));
        } finally {
            if (s != null) {
                try {
                    s.close();
                } catch (JMSException e) {
                    Logger.getLogger(this.getClass().getName()).log(Level.WARNING, "Cannot close session", e);
                }
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    
}
