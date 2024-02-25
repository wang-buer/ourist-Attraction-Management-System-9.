package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TJingdianDAO;
import com.model.TJingdian;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport
{
	private TJingdianDAO jingdianDAO;
	public String index()
	{
		List jingdianList =jingdianDAO.getHibernateTemplate().find("from TJingdian where del='no'");
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jingdianList", jingdianList);
		return ActionSupport.SUCCESS;
	}
	public TJingdianDAO getJingdianDAO()
	{
		return jingdianDAO;
	}
	public void setJingdianDAO(TJingdianDAO jingdianDAO)
	{
		this.jingdianDAO = jingdianDAO;
	}

}
