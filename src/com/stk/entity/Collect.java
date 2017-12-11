package com.stk.entity;
/**收藏*/
public class Collect {
	private Integer id;
	private Integer uid;
	private Integer vid;
	private String addtimes;
	
	
	/**扩展属性*/
	private int Sort;//视频集数
	private String Title;//视频标题
	private String PicURL;//图片地址
	private Integer SID;
	
	
	public Integer getSID() {
		return SID;
	}
	public void setSID(Integer sID) {
		SID = sID;
	}
	public int getSort() {
		return Sort;
	}
	public void setSort(int sort) {
		Sort = sort;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getPicURL() {
		return PicURL;
	}
	public void setPicURL(String picURL) {
		PicURL = picURL;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public String getAddtimes() {
		return addtimes;
	}
	public void setAddtimes(String addtimes) {
		this.addtimes = addtimes;
	}
	@Override
	public String toString() {
		return "Collect [id=" + id + ", uid=" + uid + ", vid=" + vid
				+ ", addtimes=" + addtimes + ", Sort=" + Sort + ", Title="
				+ Title + ", PicURL=" + PicURL + "]";
	}
	
	
	
}
