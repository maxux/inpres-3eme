/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tables;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author root
 */

@Entity
@Table(name = "Parties")
@NamedQueries({
@NamedQuery(
    name = "Parties.listWaiting",
    query = "SELECT P FROM Parties P WHERE P.finished = false"
),
// delete pending game without player
@NamedQuery(
    name = "Parties.removeFrom",
    query = "DELETE FROM Parties P WHERE P.author = :author AND P.finished = false AND P.player2 IS NULL"
),
@NamedQuery(
    name = "Parties.listByUser",
    query = "SELECT P FROM Parties P WHERE P.author = :username OR p.player2 = :username"
),
@NamedQuery(
    name = "Parties.getBoard",
    query = "SELECT P FROM Parties P WHERE P.author = :username OR p.player2 = :username"
),
@NamedQuery(
    name = "Parties.list",
    query = "SELECT P FROM Parties P"
),
@NamedQuery(
    name = "Parties.listFinished",
    query = "SELECT P FROM Parties P WHERE P.finished = :finished"
)
})

public class Parties implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column(length = 128)
    private String name;
    private Boolean save;
    private Boolean finished;
    private int winner;
    
    @Column(length = 128)
    private String author;
    @Column(length = 128)
    private String player2;
    
    private int score1;
    private int score2;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    
    public Parties() {
        created = new Date();
        save = false;
        name = "No name";
        author = null;
        player2 = null;
        winner = -1;
        score1 = 0;
        score2 = 0;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Parties)) {
            return false;
        }
        Parties other = (Parties) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tables.Parties[ id=" + id + " ]";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean isSave() {
        return save;
    }

    public void setSave(Boolean save) {
        this.save = save;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Boolean isFinished() {
        return finished;
    }

    public void setFinished(Boolean finished) {
        this.finished = finished;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPlayer2() {
        return player2;
    }

    public void setPlayer2(String player2) {
        this.player2 = player2;
    }

    public int getWinner() {
        return winner;
    }

    public void setWinner(int winner) {
        this.winner = winner;
    }

    public int getScore1() {
        return score1;
    }

    public void setScore1(int score1) {
        this.score1 = score1;
    }

    public int getScore2() {
        return score2;
    }

    public void setScore2(int score2) {
        this.score2 = score2;
    }
    
}
