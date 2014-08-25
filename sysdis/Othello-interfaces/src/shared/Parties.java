/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package shared;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author root
 */
public class Parties implements Serializable {
    public Long id;
    public String name;
    public Boolean save;
    public Boolean finished;
    public Date created;
    public int winner;
    public String author;
    public String player2;
    public int score1;
    public int score2;
}
