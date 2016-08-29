package psf.framework;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;


import psf.PsfItem;

import com.ibatis.sqlmap.client.SqlMapClient;


public class Dao {
	
	protected SqlMapClient sqlmap = null;
	protected Map paramMap = null;
	protected String sql = null;
	protected String sqlForPrepare = null;
	protected boolean isPrintSQL = false;
	protected boolean isPrintTranslatedSQL = false;
	protected Logger logger = Logger.getLogger(getClass().getName());
	
	public Dao(SqlMapClient sqlmap) {
		this.sqlmap = sqlmap;
	}
	
	public int insert(IBasicEntity entity,boolean updateNullFields) throws Exception {
		String [] fields = entity.getFields();
		String tableName = entity.getTableName();
		String pkName = entity.getPrimaryKey();
		boolean isAutoIncrease = entity.isAutoIncrease();
		String sql = "insert into "+tableName+" (";
		for(int i=0;i<fields.length;i++) {
			String f = fields[i];
			if(!updateNullFields) {
				Method m = entity.getClass().getMethod("get"+firstLetterUpper(f), new Class[0]);
				Object o = m.invoke(entity, new Object[0]);
				if(o==null) continue;
			}
			if(isAutoIncrease && pkName!=null && pkName.equals(f)) continue;
			sql += f+",";
		}
		if(sql.endsWith(",")) sql = sql.substring(0, sql.length()-1);
		sql+=") values (";
		for(int i=0;i<fields.length;i++) {
			String f = fields[i];
			if(!updateNullFields) {
				Method m = entity.getClass().getMethod("get"+firstLetterUpper(f), new Class[0]);
				Object o = m.invoke(entity, new Object[0]);
				if(o==null) continue;
			}
			if(isAutoIncrease && pkName!=null && pkName.equals(f)) continue;
			sql += "#"+f+"#,";
		}
		if(sql.endsWith(",")) sql = sql.substring(0, sql.length()-1);
		sql+=") ";
		prepare(sql);
		for(int i=0;i<fields.length;i++) {
			String f = fields[i];
			Method m = entity.getClass().getMethod("get"+firstLetterUpper(f), new Class[0]);
			Object o = m.invoke(entity, new Object[0]);
			bind(f,o);
		}
		update();
		Integer id = 0;
		if(entity.getPrimaryKey()!=null && entity.isAutoIncrease()) {
			sql = "select last_insert_id()";
			prepare(sql);
			id = queryForInt();
		}
		return id;
	}
	
	public int insert(IBasicEntity entity) throws Exception {
		return insert(entity,true);
	}
	
	public String firstLetterUpper(String str) {
		if(str==null) return null;
		char [] charArray = str.toCharArray();
		if(charArray.length>0) {
			charArray[0] = Character.toUpperCase(charArray[0]);
		}
		return new String(charArray);
	}
	
	public void update(IBasicEntity entity,boolean updateNullFields) throws Exception {
		String tableName = entity.getTableName();
		String pkName = entity.getPrimaryKey();
		String [] fields = entity.getFields();
		if(pkName==null) throw new Exception("无主键表不能使用update方法更新");
		String sql = "update "+tableName+" set ";
		for(int i=0;i<fields.length;i++) {
			String f = fields[i];
			
			if(!updateNullFields) {
				Method m = entity.getClass().getMethod("get"+firstLetterUpper(f), new Class[0]);
				Object o = m.invoke(entity, new Object[0]);
				if(o==null) continue;
			}
						
			if(!f.equals(pkName)) {
				sql+=f+"=#"+f+"#,";
			}
		}
		if(sql.endsWith(",")) sql = sql.substring(0, sql.length()-1);
		sql+=" where "+pkName+"=#"+pkName+"#";
		prepare(sql);
		for(String f:fields) {
			Method m = entity.getClass().getMethod("get"+firstLetterUpper(f), new Class[0]);
			Object o = m.invoke(entity, new Object[0]);
			bind(f, o);
		}
		update();
	}
	
	public void update(IBasicEntity entity) throws Exception {
		update(entity, true);
	}
	
	public void prepare(String sql) throws Exception {
		paramMap = new HashMap();
		this.sql = sql;
	}
	
	public void bind(String key,Object value) throws Exception {
		paramMap.put(key, value);
	}
	
	public static void main(String [] args) throws Exception {
		try {
			Dao dao = new Dao(null);
			dao.sql = "select * from t_user where uid=#uid# and username = #username# and gogo=#uid#";
			List<String> list = dao.parseKeyList();
			for (String s:list) {
				System.out.println(s);
			}
			System.out.println(dao.sqlForPrepare);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected List<String> parseKeyList() throws Exception {
		List<String> keyList = new ArrayList<String>();
		
		if(sql==null) throw new Exception("parseKeyList Error,sql is null");
		
		StringBuffer sbSqlForPrepare = new StringBuffer();
		StringBuffer sbKey = new StringBuffer();
		int sqlLen = sql.length();
		char [] sqlChars = sql.toCharArray();
		boolean inParam = false;
		
		for(int i=0;i<sqlLen;i++) {			
			char c = sqlChars[i];
			if(inParam) {
				if(c=='#') {
					String key = sbKey.toString();
					keyList.add(key);
					sbKey = new StringBuffer();
					if(paramMap.containsKey(key)) {
						Object value = paramMap.get(key);
						if(value!=null) {
							if(value instanceof List) {
								List valueList = (List)value;
								for (int j=0;j<valueList.size();j++) {
									sbSqlForPrepare.append("?");
									if(j<valueList.size()-1) {
										sbSqlForPrepare.append(",");
									}
								}
							} else if(value instanceof Object[]) {
								Object[] array = (Object[])value;
								for (int j=0;j<array.length;j++) {
									sbSqlForPrepare.append("?");
									if(j<array.length-1) {
										sbSqlForPrepare.append(",");
									}
								}
							} else {
								sbSqlForPrepare.append("?");
							}
							
						} else {
							sbSqlForPrepare.append("?");
						}
					} else {
						throw new Exception("参数["+key+"]未绑定");
					}
					inParam = false;
				} else {
					sbKey.append(c);
				}
			} else {
				if(c=='#') {
					inParam = true;
				} else {
					sbSqlForPrepare.append(c);
				}
			}
		}
		
		sqlForPrepare = sbSqlForPrepare.toString();
		
		return keyList;
	}
	
	public Connection getConnection() throws Exception {
		return sqlmap.getCurrentConnection();
	}
		
	public void setStmt(PreparedStatement stmt,List<String> keyList) throws Exception {
		int i = 1;
		for(String key:keyList) {
			Object value = paramMap.get(key);
			if(value==null) {
				stmt.setNull(i, Types.NULL);
			} else {
				if(value instanceof String) {
					stmt.setString(i, (String)value);
				} else if(value instanceof Integer) {
					stmt.setInt(i, (Integer)value);
				} else if(value instanceof Long) {
					stmt.setLong(i, (Long)value);
				} else if(value instanceof BigDecimal) {
					stmt.setBigDecimal(i, (BigDecimal)value);
				} else if(value instanceof byte[]) {
					stmt.setBytes(i, (byte[])value);
				} else if(value instanceof List) {
					for(Object o:(List)value) {
						stmt.setObject(i, o);
						i++;
					}
					i--;
				}  else if(value instanceof Object[]) {
					for(Object o:(Object[])value) {
						stmt.setObject(i, o);
						i++;
					}
					i--;
				}
			}
			i++;
		}
	}
	
	public void printTranslatedSQL(List<String> keyList) throws Exception {
		String tSQL = sql;
		for(String key:keyList) {
			Object o = paramMap.get(key);
			if(o==null) {
				tSQL = tSQL.replaceAll("#"+key+"#", "null");
			} else if(o instanceof String) {
				tSQL = tSQL.replaceAll("#"+key+"#", "'"+o+"'");
			} else {
				tSQL = tSQL.replaceAll("#"+key+"#", ""+o);
			}
		}
		logger.info("translatedSQL:"+tSQL);
	}
	
	public int update() throws Exception {
		List<String> keyList = parseKeyList();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		int updateCount = 0;
		
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sqlForPrepare);
			if(isPrintSQL) logger.info(sql);
			if(isPrintTranslatedSQL) printTranslatedSQL(keyList);
			setStmt(stmt, keyList);
			updateCount = stmt.executeUpdate();
		} catch (SQLException e) {
			printTranslatedSQL(keyList);
			throw e;
		} finally {
			try {if(stmt!=null) stmt.close();} catch (Exception e) {}
		}
		
		return updateCount;
	}
	
	public List queryForList() throws Exception {
		return queryForList(-1);
	}
	
	public List queryForList(int maxRows) throws Exception {
		List<String> keyList = parseKeyList();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		List<Map> result = new ArrayList<Map>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sqlForPrepare);
			if(isPrintSQL) logger.info(sql);
			if(isPrintTranslatedSQL) printTranslatedSQL(keyList);
			setStmt(stmt, keyList);
			ResultSet rs = stmt.executeQuery();
			String [] fields = null;
			int rowCount = 0;
			while(rs.next() && (rowCount<maxRows||maxRows==-1)) {
				if(fields==null) {
					List<String> fieldList = new ArrayList<String>();
					int columnCount = rs.getMetaData().getColumnCount();
					for (int i = 0; i < columnCount; i++) {
						fieldList.add(rs.getMetaData().getColumnName(i+1));
					}
					fields = new String[fieldList.size()];
					fieldList.toArray(fields);
				}
				PsfItem m = new PsfItem();
				for (int i = 0; i < fields.length; i++) {
					m.put(fields[i], rs.getObject(i+1));
				}
				result.add(m);
				rowCount++;
			}
		} catch (SQLException e) {
			printTranslatedSQL(keyList);
			throw e;
		} finally {
			try {if(stmt!=null) stmt.close();} catch (Exception e) {}
		}
		
		return result;
	}
	
	public PsfItem queryForOneRow() throws Exception {
		List<PsfItem> list = queryForList(1);
		return (list.size()>0)?list.get(0):null;
	}
	
	public Integer queryForInt() throws Exception {
		Object o = queryForObject();
		if(o==null) return null;
		if(o instanceof Integer) return (Integer)o;
		if(o instanceof Long) return ((Long)o).intValue();
		return Integer.parseInt(o.toString());
	}
	
	public BigDecimal queryForDecimal() throws Exception {
		return (BigDecimal)queryForObject();
	}
	
	public String queryForStr() throws Exception {
		Object o = queryForObject();
		if(o==null) return null;
		return o.toString();
	}
	
	public Object queryForObject() throws Exception {
		PsfItem m = (PsfItem)queryForOneRow();
		return (m==null)?null:(m.getValue(0));
	}
	
}
