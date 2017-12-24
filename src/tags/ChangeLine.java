package tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
 
public class ChangeLine implements Tag {
	private PageContext pageContext;
	private Tag parent; 
	public ChangeLine() {
		// TODO 自动生成的构造函数存根
	}

	@Override
	public int doEndTag() throws JspException {
		// TODO 自动生成的方法存根
		JspWriter out=pageContext.getOut();
		try {
			out.println("$Next_Line$");
		} catch (Exception e) {
			// TODO: handle exception
			throw new JspException("IOError:"+e.getMessage());
		}
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO 自动生成的方法存根
		return SKIP_BODY;
	}

	@Override
	public Tag getParent() {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public void release() {
		// TODO 自动生成的方法存根

	}

	@Override
	public void setPageContext(PageContext arg0) {
		// TODO 自动生成的方法存根
		this.pageContext=arg0;
	}

	@Override
	public void setParent(Tag arg1) {
		// TODO 自动生成的方法存根
		this.parent=arg1;
	}

}
