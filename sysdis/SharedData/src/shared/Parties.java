/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package shared;

import java.io.Serializable;
import java.util.Date;
import javax.sql.rowset.serial.SerialArray;

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
}
