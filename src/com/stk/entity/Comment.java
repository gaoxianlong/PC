package com.stk.entity;

import java.util.Date;

/**评论*/
public class Comment {
	private Integer id;
	private String content;//评论内容 
	private String addtimes;//时间
	private Integer cid;//已保存的问题id
	private Integer uid;//用户id
	private Integer vid;//视频id
	private String uname;//用户昵称
	private String HeadUrl;
	private String NickName;
	/**扩展是否赞属性*/
	private boolean zan;
	/**扩展点赞总数*/
	private Integer numzan;
	
	
	
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getHeadUrl() {
		return HeadUrl;
	}
	public void setHeadUrl(String headUrl) {
		HeadUrl = headUrl;
	}
	public Integer getNumzan() {
		return numzan;
	}
	public void setNumzan(Integer numzan) {
		this.numzan = numzan;
	}
	public boolean getZan() {
		return zan;
	}
	public void setZan(boolean zan) {
		this.zan = zan;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	public String getAddtimes() {
		return addtimes;
	}
	public void setAddtimes(String addtimes) {
		this.addtimes = addtimes;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", addtimes="
				+ addtimes + ", cid=" + cid + ", uid=" + uid + ", vid=" + vid
				+ ", uname=" + uname + ", zan=" + zan + ", numzan=" + numzan
				+ "]";
	}

}
