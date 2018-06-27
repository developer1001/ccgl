package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dyj.model.Log;
import com.dyj.model.PageBean;
import com.dyj.util.StringUtil;

public class LogDao {
	public ResultSet logList(Connection con,PageBean pageBean,Log log, String s_timefrom ,String s_timeto)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_log where 1 = 1 ");
		if(log!=null&&StringUtil.isNotEmpty(log.getLoguser())){	
			sb.append(" and loguser like '%"+log.getLoguser()+"%'");
		}
		if(s_timefrom!=null&&StringUtil.isNotEmpty(s_timefrom)){	
			sb.append(" and logtime >= '"+s_timefrom+"'");
		}
		if(s_timeto!=null&&StringUtil.isNotEmpty(s_timeto)){	
			sb.append(" and logtime <= '"+s_timeto+"'");
		}
		
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int logCount(Connection con,Log log,String s_timefrom,String s_timeto)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_log where 1 = 1 ");
		if(StringUtil.isNotEmpty(log.getLoguser())){
			sb.append(" and loguser like '%"+log.getLoguser()+"%'");
		}
		if(s_timefrom!=null&&StringUtil.isNotEmpty(s_timefrom)){	
			sb.append(" and logtime >= '"+s_timefrom+"'");
		}
		if(s_timeto!=null&&StringUtil.isNotEmpty(s_timeto)){	
			sb.append(" and logtime <= '"+s_timeto+"'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int logRecord(Connection con,Log log)throws Exception {		
		String sql="insert into t_log (loguser,logtime,logtype) values (?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, log.getLoguser());
		pstmt.setString(2, log.getLogtime());
		pstmt.setInt(3, log.getLogtype());
		return pstmt.executeUpdate();
	}
	
}
