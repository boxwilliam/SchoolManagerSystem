package com.school.dao.impl;

import com.school.dao.NewsDao;
import com.school.entity.Admin;
import com.school.entity.News;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class NewsDaoImpl extends BaseDaoImpl implements NewsDao{
    public NewsDaoImpl(Connection conn) {
        super(conn);
    }

    /**
     * 实现数据增加操作
     *
     * @param vo 表示要执行操作的对象
     * @return 成功返回 true，失败返回 false
     * @throws SQLException
     */
    @Override
    public boolean createData(News vo) throws SQLException {
        String sql = "insert into news (content,author,publishdate,isBackground,desc,newsImage,newsTitle,newsArea,newsType) values(?,?,?,?,?,?,?,?,?)";
        int rel=super.executeUpdate(sql,vo.getContent(),vo.getAuthor(),new Timestamp(new Date().getTime()),vo.getIsBackground(),vo.getDescrib(),vo.getNewsImage(),vo.getNewsTitle(),vo.getNewsArea(),vo.getNewsType());
        return rel > 0;
    }

    /**
     * 实现数据更新操作
     *
     * @param vo 表示要执行更新的对象
     * @return 成功返回 true，失败返回 false
     * @throws SQLException
     */
    @Override
    public boolean updateData(News vo) throws SQLException {
        return false;
    }

    /**
     * 实现数据批量删除
     *
     * @param ids 表示要执行删除的数据集合
     * @return 成功返回 true，失败返回 false
     * @throws SQLException
     */
    @Override
    public boolean removeData(Set<?> ids) throws SQLException {
        return false;
    }

    /**
     * 根据用户提供的id执行查询
     *
     * @param id 表示要查询的id
     * @return 查询成功返回该数据行的记录，失败返回null
     * @throws SQLException
     */
    @Override
    public News findById(String id) throws SQLException {
        News vo = null;
        String sql = "select newsId,content,author,publishdate,isBackground,desc,newsImage,newsTitle,newsArea,newsType from news where content=?";
        ResultSet rs = super.executeQuery(sql,id);
        if(rs.next()){
            vo = new News();
            vo.setNewsId(rs.getInt(1));
            vo.setContent(rs.getString(2));
            vo.setAuthor(rs.getString(3));
            vo.setPublishdate(rs.getDate(4));
            vo.setIsBackground(rs.getShort(5));
            vo.setDescrib(rs.getString(6));
            vo.setNewsImage(rs.getLong(7));
            vo.setNewsTitle(rs.getString(8));
            vo.setNewsArea(rs.getInt(9));
            vo.setNewsType(rs.getString(10));
        }
        return vo;
    }

    /**
     * 实现数据全部查询
     *
     * @return 成功返回全部数据，失败返回null
     * @throws SQLException
     */
    @Override
    public List<News> findAll() throws SQLException {
        return null;
    }

    @Override
    public List<News> findBySplit(String column, String keyWord, Integer currentPage, Integer lineSize) throws SQLException {
        List<News> news=new ArrayList<News>();
        String sql= "select * from news where "+column+" like ?"
                + " order by newsId limit ?,?";
        ResultSet rst=super.executeQuery(sql, "%" + keyWord + "%", (currentPage - 1)*lineSize,lineSize);
        while (rst.next()){
            News newes=new News();
            newes.setNewsId(rst.getInt(1));
            newes.setContent(rst.getString(2));
            newes.setAuthor(rst.getString(3));
            newes.setPublishdate(rst.getDate(4));
            newes.setIsBackground(rst.getShort(5));
            newes.setDescrib(rst.getString(6));
            newes.setNewsImage(rst.getLong(7));
            newes.setNewsTitle(rst.getString(8));
            newes.setNewsArea(rst.getInt(9));
            newes.setNewsType(rst.getString(10));
            news.add(newes);
        }
        return news;
    }
    @Override
    public Integer getAllCount(String column, String keyWord) throws SQLException {
        String sql = "select count(newsType) num from news where ? like ?";
        ResultSet rst=super.executeQuery(sql, column,"%" + keyWord + "%");
        if(rst.next()){
            return rst.getInt("num");
        }
        return 0;
    }


}
