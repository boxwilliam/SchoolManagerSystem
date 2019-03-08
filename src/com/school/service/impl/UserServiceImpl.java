package com.school.service.impl;

import com.school.dao.impl.UserDaoImpl;
import com.school.service.UserService;
import com.school.tools.Database;

import java.util.HashMap;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private Database db=new Database();

    @Override
    public Map<String, Object> listBySplit(String column, String keyword, int currentPage, int lineSize) throws Exception {
        Map<String,Object> map=null;
        try{
            map=new HashMap<String, Object>();
            map.put("readers",new UserDaoImpl(db.getConn()).findBySplit(column,keyword,currentPage,lineSize));
            map.put("recordSize",new UserDaoImpl(db.getConn()).getAllCount(column,keyword));
        } catch(Exception e){
            throw e;
        } finally{
            this.db.close();
        }
        return map;
    }
}
