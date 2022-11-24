/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import javax.swing.JOptionPane;

import javax.swing.WindowConstants;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author La Văn Khánh
 */
public class DisplayEmpData extends View_data implements ActionListener   {
    
    String ids;
    String[] columnNames = {"ParentID", "LAofResiden", "GenderAgeGrouped", "EthnicityGrouped","MainContact","FirstContact",""};
    String from;
    private Object con;
    String pst;
    String stm;
    DisplayEmpData() {
        setTitle("Lay du lieu tu csdl ");
        setLayout(null);
        setVisible(true);
        setSize(500, 500);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        try {
            Class.forName("com.mysql.jdbc.Driver");  // (1)
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", ""); // (2)
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select ParentID from laofdata");
            Vector v = new Vector();
            while (rs.next()) {
                ids = rs.getString(1);
                v.add(ids);
            }
           
            st.close();
            rs.close();
        } catch (Exception e) {
        }
    }

//    DisplayEmpData(JTable jTable2) {
//      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//        public void loaddata(){
           
//        }
   public void actionPerformed(ActionEvent ae) {
//         if(jButton1 != null){
//             if (ae.getSource() != null) {
//            showTableData();
//        }
//             else 
//                 throw new UnsupportedOperationException("Du lieu bi trong");
 
//      }
       
   }

    public void showTableData() {

//TableModel tm = new TableModel();
        DefaultTableModel model = new DefaultTableModel();
        model.setColumnIdentifiers(columnNames);
//DefaultTableModel model = new DefaultTableModel(tm.getData1(), tm.getColumnNames());
//table = new JTable(model);
        jTable2.setModel(model);
        jTable2.setAutoResizeMode(jTable2.AUTO_RESIZE_ALL_COLUMNS);
        jTable2.setFillsViewportHeight(true);
      
//String textvalue = textbox.getText();
        String ParentID = "";
        String LAofResiden = "";
        String GenderAgeGrouped = "";
        String EthnicityGrouped = "";
        String MainContact = "";
        String FirstContact = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");  // (1)
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "");
            PreparedStatement stmt = con.prepareStatement("select * from laofdata");
            ResultSet rs = stmt.executeQuery();
            int i = 0;
            if (rs.next()) {
                ParentID = rs.getString("ParentID");
                LAofResiden = rs.getString("LAofResiden");
                GenderAgeGrouped = rs.getString("GenderAgeGrouped");
                EthnicityGrouped = rs.getString("EthnicityGrouped");
                MainContact = rs.getString("MainContact");
                FirstContact = rs.getString("FirstContact");
                
                model.addRow(new Object[]{ParentID, LAofResiden, GenderAgeGrouped, EthnicityGrouped, MainContact, FirstContact});
                i++;
            }
            if (i < 1) {
                JOptionPane.showMessageDialog(null, "No Record Found", "Error", JOptionPane.ERROR_MESSAGE);
            }
            if (i == 1) {
                System.out.println(i + " Record Found");
            } else {
                System.out.println(i + " Records Found");
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        
    }
}