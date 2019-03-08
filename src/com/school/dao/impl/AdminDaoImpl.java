package com.school.dao.impl;

import com.school.dao.AdminDao;
import com.school.entity.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class AdminDaoImpl extends BaseDaoImpl implements AdminDao {
    public AdminDaoImpl(Connection conn) {
        super(conn);
    }

    @Override
    public boolean checkLogin(Admin admin) throws Exception {
        boolean flag=false;
        String sql = "select * from admin where name=? and password=?";
        ResultSet rst=super.executeQuery(sql, admin.getName(), admin.getPassword());
        if(rst.next()){
            flag=true;
            admin.setId(rst.getInt(1));
            admin.setName(rst.getString(2));
            admin.setPassword(rst.getString(3));
            admin.setPhone(rst.getString(4));
            admin.setType(rst.getShort(5));
            admin.setStatus(rst.getShort(6));
            admin.setCreateTime(rst.getTime(7));
            admin.setLastDate(rst.getTimestamp(8));
        }
        return flag;
    }

    @Override
    public boolean updateByLastDate(String name) throws Exception  {
        boolean flag = false;
        String sql = "update admin set lastDate=? where name=?";
        //登陆成功后，使用当前日期为最后一次登陆日期
        int rel = super.executeUpdate(sql,new Timestamp(new Date().getTime()),name);
        if(rel > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean delById(int id) throws Exception {
        String sql ="delete from admin where id=?";
        int rel=super.executeUpdate(sql,id);
        return rel>0;
    }


    @Override
    public boolean  createData(Admin vo) throws SQLException {
        String sql = "insert into admin (name,password,phone,type,status,createTime) values(?,?,?,?,?,?)";
        int rel=super.executeUpdate(sql,vo.getName(),vo.getPassword(),vo.getPhone(),vo.getType(),vo.getStatus(),new Timestamp(new Date().getTime()));
        return rel > 0;
    }


    @Override
    public boolean updateData(Admin vo) throws SQLException {
        String sql="update admin set password=?,phone=?,type=?,status=? where id=?";
        int rel= super.executeUpdate(sql,vo.getPassword(),vo.getPhone(),vo.getType(),vo.getStatus(),vo.getId());
        return rel>0;
    }


    @Override
    public boolean removeData(Set<?> ids) throws SQLException {
        return false;
    }


    @Override
    public Admin findById(String id) throws SQLException {
        Admin vo = null;
        String sql = "select id,name,password,phone,type,status,createTime,lastdate from admin where name=?";
        ResultSet rs = super.executeQuery(sql,id);
        if(rs.next()){
            vo = new Admin();
            vo.setId(rs.getInt(1));
            vo.setType(rs.getShort(5));
            vo.setStatus(rs.getShort(6));
            vo.setPassword(rs.getString(3));
            vo.setCreateTime(rs.getTimestamp(7));
            vo.setLastDate(rs.getTimestamp(8));
            vo.setPhone(rs.getString(4));
        }
        return vo;
    }


    @Override
    public List<Admin> findAll() throws SQLException {
        return null;
    }


    @Override
    public List<Admin> findBySplit(String column, String keyWord, Integer currentPage, Integer lineSize) throws SQLException {
        List<Admin> admins=new ArrayList<Admin>();
        String sql= "select * from admin where "+column+" like ?"
                + " order by id limit ?,?";
        ResultSet rst=super.executeQuery(sql, "%" + keyWord + "%", (currentPage - 1)*lineSize,lineSize);
        while (rst.next()){
            Admin admin=new Admin();
            admin.setId(rst.getInt(1));
            admin.setName(rst.getString(2));
            admin.setPassword(rst.getString(3));
            admin.setPhone(rst.getString(4));
            admin.setType(rst.getShort(5));
            admin.setStatus(rst.getShort(6));
            admin.setCreateTime(rst.getTime(7));
            admin.setLastDate(rst.getTimestamp(8));
            admins.add(admin);
        }
        return admins;
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
