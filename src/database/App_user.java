package database;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class App_user {
	private String num;
	private String id;
	private String pass;
	private String ip;
	private String sex;
	private String phonenum;
	private String local;
	Date nowTime=new Date();  
	SimpleDateFormat time=new SimpleDateFormat("yyyy"+"年"+"MM"+"月"+"dd"+"日\n"+"HH"+":"+"mm"+":"+"ss"); 
	public String register_time=time.format(nowTime);
	private DBUtil db;
	public App_user(){
		db=new DBUtil();
	}
	public String getNum(){
		return num;
	}
	public String getId(){
		return id;
	}
	public String getPass(){
		return pass;
	}
	public String getIp(){
		return ip;
	}
	public String getSex(){
		return sex;
	}
	public String getPhonenum(){
		return phonenum;
	}
	public String getLocal(){
		return local;
	}
	public String getRegister_time(){
		return register_time;
	}
	public void setId(String id){
		this.id=id;
	}
	public void setPass(String pass){
		this.pass=pass;
	}
	public void setIp(String ip){
		this.ip=ip;
	}
	public void setSex(String sex){
		this.sex=sex;
	}
	public void setPhonenum(String phonenum){
		this.phonenum=phonenum;
	}
	public void setLocal(String local){
		this.local=local;
	}
	public List alluser(){
		List user=null;
		String sql="select * from app_user";
		user=db.getList(sql, null);
		return user;
	}
	public Map checkuser(){
		Map reslut=null;
		String sql="select * from app_user where id=?";
		String[] params={id};
		reslut=db.getMap(sql, params);
		return reslut;
	}
	public int adduser(){
		int reslut=0;
		String sql="insert into app_user (id,pass,register_time) values(?,?,?)";
		String[] params={id,pass,register_time};
		reslut=db.update(sql, params);
		return reslut;
	}
	public int adddetails(){
		int reslut=0;
		String sql="update app_user set ip=?,sex=?,phonenum=?,local=? where id=?";
		String[] params={ip,sex,phonenum,local,id};
		reslut=db.update(sql, params);
		return reslut;
	}
	public int shutup(){
		int reslut=0;
		String sql="update app_user set state=1 where id=?";
		String[] params={id};
		reslut=db.update(sql, params);
		return reslut;
	}
	public int speak(){
		int reslut=0;
		String sql="update app_user set state=0 where id=?";
		String[] params={id};
		reslut=db.update(sql, params);
		return reslut;
	}
	public int deluser(){
		int result=0;
		String sql="delete from app_user where id=?";
		String[] params={id};
		result=db.update(sql, params);
		return result;
	}
	public static String stringToAscii(String value)  
    {  
        StringBuffer sbu = new StringBuffer();  
        char[] chars = value.toCharArray();   
        for (int i = 0; i < chars.length; i++) {  
            if(i != chars.length - 1)  
            {  
                sbu.append((int)chars[i]).append(",");  
            }  
            else {  
                sbu.append((int)chars[i]);  
            }  
        }  
        return sbu.toString();  
     }
	public static String asciiToString(String value)
    {
        StringBuffer sbu = new StringBuffer();
        String[] chars = value.split(",");
        for (int i = 0; i < chars.length; i++) {
            sbu.append((char) Integer.parseInt(chars[i]));
        }
        return sbu.toString();
    }
	public String Enc(String string){
		try {
			string=URLEncoder.encode(string, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return string;
	}
}
