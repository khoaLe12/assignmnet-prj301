/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author KHOA
 */
public class FoodDAO {

    private static final String SEARCH="SELECT id, name, description, price, cookingTime, status FROM tblFoods WHERE name like ?";
    private static final String SEARCH_V2="SELECT id, name, description, price, cookingTime, status FROM tblFoods WHERE name like ? AND status = 1";
    private static final String DELETE="UPDATE tblFoods SET status = ? WHERE id = ?";
    private static final String UPDATE="UPDATE tblFoods SET name = ?, description = ?, price = ?, cookingTime = ? WHERE id = ?";

    public List<FoodDTO> searchFood(String search) throws SQLException {
        
        List<FoodDTO> listFood = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1,"%"+ search+"%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int cookingTime = rs.getInt("cookingTime");
                    boolean status = rs.getBoolean("status");
                    listFood.add(new FoodDTO(id, name, description, price, cookingTime, status));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return listFood;
    }

    public boolean delete(String id, boolean status) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(DELETE);
                ptm.setBoolean(1, status);
                ptm.setString(2, id);
                int check = ptm.executeUpdate();
                if(check > 0){
                    checkDelete = true;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return checkDelete;
    }

    public boolean update(FoodDTO food) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, food.getName());
                ptm.setString(2, food.getDescription());
                ptm.setFloat(3, food.getPrice());
                ptm.setInt(4, food.getCookingTime());
                ptm.setString(5, food.getId());
                
                int check = ptm.executeUpdate();
                if(check > 0){
                    checkUpdate = true;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return checkUpdate;
    }
    
    public List<FoodDTO> searchFoodV2(String search) throws SQLException {
        
        List<FoodDTO> listFood = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SEARCH_V2);
                ptm.setString(1,"%"+ search+"%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int cookingTime = rs.getInt("cookingTime");
                    boolean status = rs.getBoolean("status");
                    listFood.add(new FoodDTO(id, name, description, price, cookingTime, status));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return listFood;
    }
}
