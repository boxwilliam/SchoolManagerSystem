package com.school.dao.impl;

import com.school.dao.UserDao;
import com.school.entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {


    public UserDaoImpl(Connection conn) {
        super(conn);
    }

    @Override
    public boolean createData(User vo) throws SQLException {
        return false;
    }

    @Override
    public boolean updateData(User vo) throws SQLException {
        return false;
    }

    @Override
    public boolean removeData(Set<?> ids) throws SQLException {
        return false;
    }

    @Override
    public User findById(String id) throws SQLException {
        return null;
    }

    @Override
    public List<User> findAll() throws SQLException {
        return null;
    }

    @Override
    public List<User> findBySplit(String column, String keyWord, Integer currentPage, Integer lineSize) throws SQLException {
        List<User> list=new ArrayList<User>();
        String sql= "select * from user " +
                " where "+column+" like ?"
                + " order by createTime limit ?,?";
        ResultSet rst=super.executeQuery(sql, "%" + keyWord + "%", (currentPage - 1)*lineSize,lineSize);

        while (rst.next()){
            User user=new User();
            user.setId(rst.getInt("id"));
            user.setName(rst.getString("name"));
            user.setGender(rst.getShort("gender"));
            user.setPhone(rst.getString("phone"));
            user.setCreateTime(rst.getTimestamp("createTime"));
            user.setLastDate(rst.getTimestamp("lastDate"));
            list.add(user);
        }

        return list;
    }

    @Override
    public Integer getAllCount(String column, String keyWord) throws SQLException {
        String sql = "select count(name) num from admin where ? like ?";
        ResultSet rst=super.executeQuery(sql, column,"%" + keyWord + "%");
        if(rst.next()){
            return rst.getInt("num");
        }
        return 0;
    }
}
