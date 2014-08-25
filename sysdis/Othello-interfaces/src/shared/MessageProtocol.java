/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package shared;

import java.awt.Color;
import java.io.Serializable;

/**
 *
 * @author root
 */
public class MessageProtocol implements Serializable {
    public String source;
    public String action;
    public String payload;
    public int x;
    public int y;
    public String player2;
    public Color color;
    public int gameid;
    public int score1;
    public int score2;
    public boolean save;
    
    public MessageProtocol() {
        source = "unknown";
        action = "UNDEFINED";
        payload = "";
        
        x = 0;
        y = 0;
        
        player2 = "";
        gameid = 0;
        save = false;
    }
    
    public MessageProtocol(int gameid) {
        this();
        this.gameid = gameid;
    }
            
}
