


package database;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import com.sun.media.jfxmedia.track.Track.Encoding;

public class Login {
	private String username;
	private String password;
	private String state;
	private String from;
	private String why;
	private DBUtil db;
	public Login(){
		db=new DBUtil();
	}
	public String getFrom(){
		return from;
	}
	public String getusername(){
		return username;
	}
	public String getpassword(){
		return password;
	}
	public String getstate(){
		return state;
	}
	public String getwhy(){
		return why;
	}
	public void setFrom(String from){
		this.from=from;
	}
	public void setusername(String username){
		this.username=username;
	}
	public void setpassword(String password){
		this.password=password;
	}
	public void setstate(String state){
		this.state=state;
	}
	public void setwhy(String why){
		this.why=why;
	}
	public List alluser(){
		List user=null;
		String sql="select * from newsuser";
		user=db.getList(sql, null);
		return user;
	}
	public Map checkuser(){
		Map reslut=null;
		String sql="select * from newsuser where username=?";
		String[] params={username};
		reslut=db.getMap(sql, params);
		return reslut;
	}
	public Map checkuser2(){
		Map reslut=null;
		String sql="select * from newsuser where username=?";
		String[] params={from};
		reslut=db.getMap(sql, params);
		return reslut;
	}
	public int adduser(){
		int reslut=0;
		String sql="insert into newsuser (username,password,state) values(?,?,0)";
		String[] params={username,password};
		reslut=db.update(sql, params);
		return reslut;
	}
	public int addwhy(){
		int reslut=0;
		String sql="update newsuser set why=? where username=?";
		String[] params={why,username};
		reslut=db.update(sql, params);
		return reslut;
	}
	public int changestate(){
		int reslut=0;
		String sql="update newsuser set state=? where username=?";
		String[] params={state,username};
		reslut=db.update(sql, params);
		return reslut;
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