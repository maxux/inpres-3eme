/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sysdis;

import db.DbManager;
import java.awt.Color;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.inject.Inject;
import javax.jms.JMSConnectionFactory;
import javax.jms.JMSContext;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.jms.Topic;
import shared.MessageProtocol;
import tables.Parties;

/**
 *
 * @author root
 */
@MessageDriven(activationConfig = {
    @ActivationConfigProperty(propertyName = "clientId", propertyValue = "jms/Topic"),
    @ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/Topic"),
    @ActivationConfigProperty(propertyName = "subscriptionDurability", propertyValue = "Durable"),
    @ActivationConfigProperty(propertyName = "subscriptionName", propertyValue = "jms/Topic"),
    @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Topic")
})
public class Messenger implements MessageListener {
    @Resource(mappedName = "jms/Topic")
    private Topic topic;
    @Inject
    @JMSConnectionFactory("java:comp/DefaultJMSConnectionFactory")
    private JMSContext context;
    DbManager db = null;
    
    public Messenger() {
        db = new DbManager();
    }
    
    public void GameAddUser(int partie, String username) {
        Parties game = db.PartieUpdatePlayer(partie, username);
        
        // reply to user2
        MessageProtocol data = new MessageProtocol();
        data.source = "server";
        data.action = "JOIN-ACK";
        data.payload = game.getAuthor();
        data.color = Color.white;
        data.gameid = partie;
        data.save = game.isSave();
        
        sendJMSMessageToTopic(data, username);
        
        // notify user1
        data = new MessageProtocol();
        data.source = "server";
        data.action = "JOIN-ACK";
        data.payload = username;
        data.color = Color.black;
        data.gameid = partie;
        data.save = game.isSave();
        
        sendJMSMessageToTopic(data, game.getAuthor());
        
        PrepareNextTry(game.getAuthor(), username, partie, 0);
    }
    
    public void PrepareNextTry(String usertoplay, String otherplayer, int gameid, int seq) {
        // reply to user2
        MessageProtocol data = new MessageProtocol();
        data.source = "server";
        data.action = "NEXT-TRY";
        data.payload = usertoplay;
        data.gameid = gameid;
        data.x = seq;
        
        sendJMSMessageToTopic(data, usertoplay);
        sendJMSMessageToTopic(data, otherplayer);
    }
    
    public void GameForward(MessageProtocol root) {
        MessageProtocol data = new MessageProtocol();
        data.source = "server";
        data.action = "TRY";
        data.payload = root.payload;
        data.x = root.x;
        data.y = root.y;
        data.color = root.color;
        data.gameid = root.gameid;
        data.save = root.save;
        
        sendJMSMessageToTopic(data, root.source);
        sendJMSMessageToTopic(data, root.player2);
        
        PrepareNextTry(root.player2, root.source, root.gameid, root.x);
    }
    
    public void GameLeave(MessageProtocol root) {
        MessageProtocol data = new MessageProtocol();
        data.source = "server";
        data.action = "LEAVE";
        data.gameid = root.gameid;
        sendJMSMessageToTopic(data, root.player2);
        db.EndGame(root.gameid, root.player2, root.score1, root.score2);
    }
    
    public void EndGame(String user1, String user2, int gameid) {
        MessageProtocol data = new MessageProtocol();
        data.source = "server";
        data.action = "END";
        data.gameid = gameid;
        sendJMSMessageToTopic(data, user1);
        sendJMSMessageToTopic(data, user2);
    }
    
    public void EndScore(MessageProtocol root) {
        db.EndGame(root.gameid, root.payload, root.score1, root.score2);
    }
    
    @Override
    public void onMessage(Message message) {
        try {
            ObjectMessage msg = (ObjectMessage) message;
            
            if(!msg.getStringProperty("id").equals("server")) {
                System.out.println("[MSG] Ignoring message");
                return;
            }
            
            MessageProtocol data = msg.getBody(MessageProtocol.class);
            
            System.out.println("[MSG] Source: " + data.source + ", Action: " + data.action +
                               ", Payload: " + data.payload + ", GameID: "+ data.gameid);
            
            if(data.action.equals("JOIN")) {
                GameAddUser(Integer.parseInt(data.payload), data.source);
            }
            
            if(data.action.equals("LEAVE")) {
                GameLeave(data);
            }
            
            if(data.action.equals("SCORE")) {
                GameLeave(data);
            }
            
            if(data.action.equals("TRY")) {
                // TODO: check game validity
                GameForward(data);
                
                if(data.save) {
                    System.out.println("[MSG] Saving game");
                    db.AddHistory(data.gameid, data.source, data.x, data.y);
                }
            }
            
            if(data.action.equals("SKIP")) {
                if(data.x > 2) {
                    EndGame(data.player2, data.source, data.gameid);
                    
                } else PrepareNextTry(data.player2, data.source, data.gameid, data.x);
            }
            
        } catch (JMSException ex) {
            Logger.getLogger(Messenger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void sendJMSMessageToTopic(MessageProtocol messageData, String id) {
        context.createProducer().setProperty("id", id).send(topic, messageData);
    }
    
}
