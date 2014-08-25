/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gui;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.resource.spi.CommException;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import othelloclient.Communication;
import shared.MessageProtocol;

/**
 *
 * @author root
 */
class Grid {
    String player;
    Color color;
    JButton button;
}

public class GameGrid extends javax.swing.JFrame {
    Grid[][] content = new Grid[8][8];
    Communication communication = null;
    String username = "unknown";
    String player2 = "";
    public Color mycolor = Color.green;
    Color hint = new Color(0, 128, 0);
    boolean ingame = true;
    
    public int myscore = 0;
    public int score2 = 0;

    public Color getMycolor() {
        return mycolor;
    }

    public void setMycolor(Color mycolor) {
        this.mycolor = mycolor;
        
        for(int i = 0; i < 8; i++) {
            for(int j = 0; j < 8; j++) {
                // it's me !
                if(content[i][j].color.equals(mycolor))
                    content[i][j].player = username;
                
                // it's not me and it's not the default color
                else if(!content[i][j].color.equals(Color.green))
                    content[i][j].player = player2; 
            }
        }
    }
    
    /**
     * Creates new form GameGrid
     */
    public GameGrid() {
        initComponents();
        this.setLocationRelativeTo(null);
        
        for(int i = 0; i < 8; i++) {
            for(int j = 0; j < 8; j++) {
                content[i][j] = new Grid();
                content[i][j].player = null;
                content[i][j].color  = Color.green;
                content[i][j].button = new JButton(" ");
                
                content[i][j].button.setName("button-" + i + "-" + j);
                content[i][j].button.setBackground(Color.green);
                content[i][j].button.setEnabled(false);
                content[i][j].button.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        actionButton(e);
                    }
                });
                
                jPanel1.add(content[i][j].button);
            }
        }
        
        //
        // initial grid
        //
        content[3][3].color = Color.white;
        content[3][3].button.setBackground(content[3][3].color);
        
        content[3][4].color = Color.black;
        content[3][4].button.setBackground(content[3][4].color);
        
        content[4][3].color = Color.black;
        content[4][3].button.setBackground(content[4][3].color);
        
        content[4][4].color = Color.white;
        content[4][4].button.setBackground(content[4][4].color);
    }
    
    public GameGrid(Communication communication, String username) {
        this();
        this.communication = communication;
        this.username = username;
        communication.currentGrid = this;
        
        jLabel2.setText(username);
    }
    
    public void editGrid(MessageProtocol data) {
        content[data.y][data.x].player = data.payload;
        setColor(data.x, data.y, data.color);
        
        UpdateGridFlip(data);
        UpdateScore();
    }
    
    public void actionButton(ActionEvent e) {
        JButton button = (JButton) e.getSource();
        
        MessageProtocol data = new MessageProtocol(communication.gameid);
        data.source = username;
        data.action = "TRY";
        data.payload = username;
        data.player2 = player2;
        data.color = mycolor;
        data.save = communication.save;
        
        String parts[] = button.getName().split("-");
        data.y = Integer.parseInt(parts[1]);
        data.x = Integer.parseInt(parts[2]);
        
        communication.SendMessage(data);
        RemovingHints();
    }
    
    public void setPlayer2(String player) {
        jLabel4.setText(player);
        jLabel5.setText("");
        player2 = player;
    }
    
    public void setInfo(String msg) {
        jLabel5.setText(msg);
    }
    
    private void setColor(int x, int y, Color color) {
        content[y][x].color = color;
        content[y][x].button.setBackground(content[y][x].color);
    }
    
    //
    // Game Logic
    //
    private boolean isOnBounds(int x, int y) {
        return !(x < 0 || x > 7 || y < 0 || y > 7);
    }
    
    private boolean isSomeone(int x, int y) {
        return (content[y][x].player != null);
    }
    
    private boolean isThisOne(int x, int y, String thisone) {
        if(content[y][x].player == null)
            return false;
        
        return content[y][x].player.equals(thisone);
    }
    
    private boolean validFollow(int x, int y, int xstep, int ystep, String who) {
        while(isOnBounds(x, y) && isThisOne(x, y, who)) {
            x += xstep;
            y += ystep;
        }
        
        // we reached a limit
        if(!isOnBounds(x, y))
            return false;
        
        return isThisOne(x, y, InvertPlayer(who));
    }
    
    // [0]  [1]  [2]  [3]  [4]  [5]  [6]  [7]
    // ...  ...  .#.  ...  #..  ...  ...  ..#
    // .O#  #O.  .O.  .O.  .O.  .O.  .O.  .O.
    // ...  ...  ...  .#.  ...  #..  ..#  ...
    private final int[] xdir = {1, -1,  0, 0, -1, -1, 1,  1};
    private final int[] ydir = {0,  0, -1, 1, -1,  1, 1, -1};
    
    private boolean isValidMove(int x, int y) {
        // out of bounds
        if(!isOnBounds(x, y))
            return false;
        
        // already something
        if(isSomeone(x, y))
            return false;
        
        // for each neigbhors
        for(int i = 0; i < xdir.length; i++) {
            int tx = x + xdir[i];
            int ty = y + ydir[i];
            
            if(isOnBounds(tx, ty) && isThisOne(tx, ty, player2)) {                
                if(validFollow(tx, ty, xdir[i], ydir[i], player2))
                    return true;
            }
        }
        
        // nop
        return false;
    }
    
    private void FlipPath(int x, int y, int xstep, int ystep, MessageProtocol data) {
        while(isOnBounds(x, y) && isThisOne(x, y, InvertPlayer(data.payload))) {
            content[y][x].player = data.payload;
            setColor(x, y, data.color);
            
            x += xstep;
            y += ystep;
        }
    }
    
    private void UpdateGridFlip(MessageProtocol data) {
        for(int i = 0; i < xdir.length; i++) {
            int tx = data.x + xdir[i];
            int ty = data.y + ydir[i];
            
            if(isOnBounds(tx, ty) && isThisOne(tx, ty, InvertPlayer(data.payload))) {
                if(validFollow(tx, ty, xdir[i], ydir[i], InvertPlayer(data.payload))) {
                    FlipPath(tx, ty, xdir[i], ydir[i], data);
                }
            }
        }
    }
    
    public void RemovingHints() {
        for(int i = 0; i < 8; i++)
            for(int j = 0; j < 8; j++)
                setColor(j, i, content[i][j].color);
    }
    
    public void UpdateScore() {
        myscore = 0;
        score2 = 0;
        
        for(int i = 0; i < 8; i++) {
            for(int j = 0; j < 8; j++) {                
                if(content[i][j].color.equals(mycolor))
                    myscore++;
                
                else if(content[i][j].color.equals(InvertColor(username)))
                    score2++;
            }
        }
        
        jLabel7.setText(String.valueOf(myscore));
        jLabel8.setText(String.valueOf(score2));
    }
    
    private String InvertPlayer(String player) {
        return (player.equals(username)) ? player2 : username;
    }
    
    private Color InvertColor(String player) {
        return (player.equals(username)) ? (mycolor.equals(Color.white) ? Color.black : Color.white) : mycolor;
    }
    
    //
    //
    //
    public void enableGrid() {
        int possible = 0;
        
        for(int y = 0; y < 8; y++) {
            for(int x = 0; x < 8; x++) {
                if(isValidMove(x, y)) {
                    content[y][x].button.setEnabled(true);
                    content[y][x].button.setBackground(this.hint);
                    possible++;
                }
            }
        }
        
        if(possible == 0) {
            jLabel6.setText("Vous n'avez plus de coup possible");
            communication.Skip();
            
        } else jLabel6.setText("");
    }
    
    public void disableGrid() {
        for(int i = 0; i < 8; i++)
            for(int j = 0; j < 8; j++)
                content[i][j].button.setEnabled(false);
    }
    
    //
    //
    //
    public String getPlayer2() {
        return player2;
    }
    
    public void Winner() {
        if(ingame) {
            JOptionPane.showMessageDialog(this, "Félicitation, vous avez gagné !", "Bravo !", JOptionPane.INFORMATION_MESSAGE);
            this.setVisible(false);
            
        } else ingame = false;
    }
    
    public void Looser() {
        if(ingame) {
            JOptionPane.showMessageDialog(this, "Vous avez perdu.", "HA-HA", JOptionPane.INFORMATION_MESSAGE);
            this.setVisible(false);
            
        } else ingame = false;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jPanel1.setLayout(new java.awt.GridLayout(8, 8));

        jLabel1.setText("Joueur 1:");

        jLabel2.setText("<en attente>");

        jLabel3.setText("Joueur 2:");

        jLabel4.setText("<en attente>");

        jLabel5.setText("En attente du serveur de jeu");

        jLabel6.setForeground(new java.awt.Color(255, 0, 0));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel2))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel4)))
                        .addGap(34, 34, 34)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel8)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel6))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel7)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 84, Short.MAX_VALUE)
                                .addComponent(jLabel5)))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2)
                    .addComponent(jLabel5)
                    .addComponent(jLabel7))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jLabel4)
                    .addComponent(jLabel6)
                    .addComponent(jLabel8))
                .addGap(18, 18, 18)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 349, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    public void Disconnection() {
        communication.LeaveGame();
        communication.gameList.setVisible(true);
    }
    
    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        Disconnection();
    }//GEN-LAST:event_formWindowClosing

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GameGrid.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GameGrid.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GameGrid.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GameGrid.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GameGrid().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
