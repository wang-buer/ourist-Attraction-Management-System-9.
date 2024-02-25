package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TGonggaoDAO;
import com.dao.TJingdianDAO;
import com.dao.TUserDAO;
import com.dao.TXianluDAO;
import com.dao.TYudingDAO;
import com.model.TAdmin;
import com.model.TGonggao;
import com.model.TJingdian;
import com.model.TUser;
import com.model.TXianlu;
import com.model.TYuding;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class xianluAction extends ActionSupport
{
	private int id;
	private String xianlumincheng;
	private String fatuandidian;
	private String fatuanshiian;
	private String xianlujiage;
	private String lianxidianhua;
	private String lianxiren;
	private String fabushijian;
	
	private String message;
	private String path;
	
	private TXianluDAO xianluDAO;
	private TYudingDAO yudingDAO;
	private TUserDAO userDAO;
	
	public String xianluAdd()
	{
		TXianlu xianlu=new TXianlu();
		
		xianlu.setXianlumincheng(xianlumincheng);
		xianlu.setFatuandidian(fatuandidian);
		xianlu.setFatuanshiian(fatuanshiian);
		xianlu.setXianlujiage(xianlujiage);
		xianlu.setLianxidianhua(lianxidianhua);
		xianlu.setLianxiren(lianxiren);
		xianlu.setFabushijian(fabushijian);
		xianlu.setDel("no");
		
		xianluDAO.save(xianlu);
		this.setMessage("操作成功");
		this.setPath("xianluMana.action");
		return "succeed";
	}
	
	
	public String xianluMana()
	{
		List xianluList =xianluDAO.getHibernateTemplate().find("from TXianlu where del='no'");
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("xianluList", xianluList);
		return ActionSupport.SUCCESS;
	}
	
	public String xianluDel()
	{
		TXianlu xianlu=xianluDAO.findById(id);
		xianlu.setDel("yes");
		xianluDAO.getHibernateTemplate().update(xianlu);
		this.setMessage("操作成功");
		this.setPath("xianluMana.action");
		return "succeed";
	}
	
	
	public String xianluAll()
	{
		List xianluList =xianluDAO.getHibernateTemplate().find("from TXianlu where del='no'");
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("xianluList", xianluList);
		return ActionSupport.SUCCESS;
	}
	
	public String xianluDetailQian()
	{
		TXianlu xianlu=xianluDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("xianlu", xianlu);
		return ActionSupport.SUCCESS;
	}
	
	
	public String xianlu_yuding()
	{
		HttpServletRequest req=ServletActionContext.getRequest();
		int xianluId=Integer.parseInt(req.getParameter("xianluId"));
		int userId=Integer.parseInt(req.getParameter("userId"));
		
		TYuding yuding=new TYuding();
		yuding.setXianluId(xianluId);
		yuding.setUserId(userId);
		yudingDAO.save(yuding);
		
		this.setMessage("预订成功，我们会及时与你取得联系");
		this.setPath("xianluAll.action");
		return "succeed";
	}

	public String yudingMana()
	{
		HttpServletRequest req=ServletActionContext.getRequest();
		int xianluId=Integer.parseInt(req.getParameter("xianluId"));
		
		String sql="from TYuding where xianluId="+xianluId;
		List yudingList =yudingDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<yudingList.size();i++)
		{
			TYuding yuding=(TYuding)yudingList.get(i);
			yuding.setUser(userDAO.findById(yuding.getUserId()));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yudingList", yudingList);
		return ActionSupport.SUCCESS;
	}

	public String getFatuandidian()
	{
		return fatuandidian;
	}


	public TYudingDAO getYudingDAO()
	{
		return yudingDAO;
	}


	public void setYudingDAO(TYudingDAO yudingDAO)
	{
		this.yudingDAO = yudingDAO;
	}


	public String getFabushijian()
	{
		return fabushijian;
	}


	public TUserDAO getUserDAO()
	{
		return userDAO;
	}


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public void setFabushijian(String fabushijian)
	{
		this.fabushijian = fabushijian;
	}


	public void setFatuandidian(String fatuandidian)
	{
		this.fatuandidian = fatuandidian;
	}


	public String getFatuanshiian()
	{
		return fatuanshiian;
	}


	public void setFatuanshiian(String fatuanshiian)
	{
		this.fatuanshiian = fatuanshiian;
	}


	public int getId()
	{
		return id;
	}


	public void setId(int id)
	{
		this.id = id;
	}


	public String getLianxidianhua()
	{
		return lianxidianhua;
	}


	public void setLianxidianhua(String lianxidianhua)
	{
		this.lianxidianhua = lianxidianhua;
	}


	public String getLianxiren()
	{
		return lianxiren;
	}


	public void setLianxiren(String lianxiren)
	{
		this.lianxiren = lianxiren;
	}


	public String getMessage()
	{
		return message;
	}


	public void setMessage(String message)
	{
		this.message = message;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}


	public TXianluDAO getXianluDAO()
	{
		return xianluDAO;
	}


	public void setXianluDAO(TXianluDAO xianluDAO)
	{
		this.xianluDAO = xianluDAO;
	}


	public String getXianlujiage()
	{
		return xianlujiage;
	}


	public void setXianlujiage(String xianlujiage)
	{
		this.xianlujiage = xianlujiage;
	}

	public String getXianlumincheng()
	{
		return xianlumincheng;
	}


	public void setXianlumincheng(String xianlumincheng)
	{
		this.xianlumincheng = xianlumincheng;
	}
	
}
