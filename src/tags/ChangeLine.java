package tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
 
public class ChangeLine implements Tag {
	private PageContext pageContext;
	private Tag parent; 
	public ChangeLine() {
		// TODO �Զ����ɵĹ��캯�����
	}

	@Override
	public int doEndTag() throws JspException {
		// TODO �Զ����ɵķ������
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
		// TODO �Զ����ɵķ������
		return SKIP_BODY;
	}

	@Override
	public Tag getParent() {
		// TODO �Զ����ɵķ������
		return null;
	}

	@Override
	public void release() {
		// TODO �Զ����ɵķ������

	}

	@Override
	public void setPageContext(PageContext arg0) {
		// TODO �Զ����ɵķ������
		this.pageContext=arg0;
	}

	@Override
	public void setParent(Tag arg1) {
		// TODO �Զ����ɵķ������
		this.parent=arg1;
	}

}
