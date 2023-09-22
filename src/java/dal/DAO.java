/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author tuant
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("cateID"),
                        rs.getInt("sell_ID"),
                        rs.getInt("quantity"));

                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("uID"), 
                        rs.getString("user"), 
                        rs.getString("pass"), 
                        rs.getInt("isSell"), 
                        rs.getInt("isAdmin"));

                list.add(a);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"),
                        rs.getString("cname"));
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Product> getProductsById(int cateID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product"
                + "  where 1=1";
        if (cateID != 0) {
            sql += " and cateID=" + cateID;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("cateID"),
                        rs.getInt("sell_ID"),
                        rs.getInt("quantity"));

                list.add(p);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Product getProductsByPId(int id) {

        String sql = "select * from product"
                + "  where id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("cateID"),
                        rs.getInt("sell_ID"),
                        rs.getInt("quantity"));
                return p;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public List<Product> searchByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where 1=1";
        if (name != null && !name.equals("")) {
            sql += " and name like '%" + name + "%'";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("cateID"),
                        rs.getInt("sell_ID"),
                        rs.getInt("quantity"));

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account login(String username, String password) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[isSell]\n"
                + "      ,[isAdmin]\n"
                + "  FROM [dbo].[Account]\n"
                + "  where [user]=? and pass=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);

            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("uID"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getInt("isSell"),
                        rs.getInt("isAdmin"));
                return a;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public Account checkAccountExist(String username) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[isSell]\n"
                + "      ,[isAdmin]\n"
                + "  FROM [dbo].[Account]\n"
                + "  where [user]=? ";
        try {
            PreparedStatement st = connection.prepareCall(sql);

            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("uID"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getInt("isSell"),
                        rs.getInt("isAdmin"));
                return a;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public void register(String username, String pass) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([user]\n"
                + "           ,[pass]\n"
                + "           ,[isSell]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (?,?,0,0)";
        try {
            PreparedStatement st = connection.prepareCall(sql);

            st.setString(1, username);
            st.setString(2, pass);
            st.executeQuery();

        } catch (SQLException e) {
        }
    }

    public List<Product> getProductsBySId(int sellID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product"
                + "  where 1=1";
        if (sellID != 0) {
            sql += " and sell_ID=" + sellID;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("cateID"),
                        rs.getInt("sell_ID"),
                        rs.getInt("quantity"));

                list.add(p);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[product]\n"
                + "      WHERE id=?";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void insert(String name, String image, String price, String title,
            String des, String cate,String quantity, int sid) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[image]\n"
                + "           ,[price]\n"
                + "           ,[title]\n"
                + "           ,[description]\n"
                + "           ,[cateID]\n"
                + "           ,[quantity]\n"
                + "           ,[sell_ID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, title);
            st.setString(5, des);
            st.setString(6, cate);
            st.setString(7, quantity);
            st.setInt(8, sid);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String name, String image, String price, String title,
            String des, String cate,String quantity, String pid) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "		,[image]=?\n"
                + "      ,[price] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[cateID] = ?\n"
                + "      ,[quantity]=?\n"
                + " WHERE id=?";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, title);
            st.setString(5, des);
            st.setString(6, cate);
            st.setString(7, quantity);
            st.setString(8, pid);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getTotalProduct() {
        String sql = "select count(*) from product";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "order by id \n"
                + "offset ? row fetch next 8 rows only";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            
            st.setInt(1, (index-1)*8);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setCateID(rs.getInt("cateID"));
                p.setSell_ID(rs.getInt("sell_ID"));
                p.setQuantity(rs.getInt("quantity"));

                list.add(p);
                
            }
            
        } catch (SQLException e) {
        }
        return list;
    }

}
