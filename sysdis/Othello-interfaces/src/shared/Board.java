/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package shared;

import java.io.Serializable;

/**
 *
 * @author root
 */
public class Board implements Serializable {
    public String username;
    public int win;
    public int lost;
    public int total;
    
    public Board(String username) {
        this.username = username;
        win = 0;
        lost = 0;
        total = 0;
    }
}
