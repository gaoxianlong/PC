package com.stk.entity;

import java.util.Date;

public class Users
{
  private Integer ID;
  private String NickName;
  private String RealName;
  private String Telephone;
  private String Password;
  private String HeadUrl;
  private String Sex;
  private String Birthday;
  private String City1;
  private String City2;
  private String City3;
  private String Sign;
  private Date Registertime;
  private Date Lasttime;
  private String Salt;
  private String School;
  private String Grade;
  private String Education;
  private String Teacher;
  private String HelpCode;
  private Integer Prestudent;
  private Integer Qqid;
  private Integer WXopendID;
  private String Unionid;
  private String demo1;
  private String wxclass;
  private Integer vip;
  private Date viptime;
  
public Date getViptime() {
	return viptime;
}
public void setViptime(Date viptime) {
	this.viptime = viptime;
}
public Integer getVip() {
	return vip;
}
public void setVip(Integer vip) {
	this.vip = vip;
}
public Integer getID() {
	return ID;
}
public void setID(Integer iD) {
	ID = iD;
}
public String getNickName() {
	return NickName;
}
public void setNickName(String nickName) {
	NickName = nickName;
}
public String getRealName() {
	return RealName;
}
public void setRealName(String realName) {
	RealName = realName;
}
public String getTelephone() {
	return Telephone;
}
public void setTelephone(String telephone) {
	Telephone = telephone;
}
public String getPassword() {
	return Password;
}
public void setPassword(String password) {
	Password = password;
}
public String getHeadUrl() {
	return HeadUrl;
}
public void setHeadUrl(String headUrl) {
	HeadUrl = headUrl;
}
public String getSex() {
	return Sex;
}
public void setSex(String sex) {
	Sex = sex;
}
public String getBirthday() {
	return Birthday;
}
public void setBirthday(String birthday) {
	Birthday = birthday;
}
public String getCity1() {
	return City1;
}
public void setCity1(String city1) {
	City1 = city1;
}
public String getCity2() {
	return City2;
}
public void setCity2(String city2) {
	City2 = city2;
}
public String getCity3() {
	return City3;
}
public void setCity3(String city3) {
	City3 = city3;
}
public String getSign() {
	return Sign;
}
public void setSign(String sign) {
	Sign = sign;
}
public Date getRegistertime() {
	return Registertime;
}
public void setRegistertime(Date registertime) {
	Registertime = registertime;
}
public Date getLasttime() {
	return Lasttime;
}
public void setLasttime(Date lasttime) {
	Lasttime = lasttime;
}
public String getSalt() {
	return Salt;
}
public void setSalt(String salt) {
	Salt = salt;
}
public String getSchool() {
	return School;
}
public void setSchool(String school) {
	School = school;
}
public String getGrade() {
	return Grade;
}
public void setGrade(String grade) {
	Grade = grade;
}
public String getEducation() {
	return Education;
}
public void setEducation(String education) {
	Education = education;
}
public String getTeacher() {
	return Teacher;
}
public void setTeacher(String teacher) {
	Teacher = teacher;
}
public String getHelpCode() {
	return HelpCode;
}
public void setHelpCode(String helpCode) {
	HelpCode = helpCode;
}
public Integer getPrestudent() {
	return Prestudent;
}
public void setPrestudent(Integer prestudent) {
	Prestudent = prestudent;
}

public Integer getQqid() {
	return Qqid;
}
public void setQqid(Integer qqid) {
	Qqid = qqid;
}
public Integer getWXopendID() {
	return WXopendID;
}
public void setWXopendID(Integer wXopendID) {
	WXopendID = wXopendID;
}
public String getUnionid() {
	return Unionid;
}
public void setUnionid(String unionid) {
	Unionid = unionid;
}
public String getDemo1() {
	return demo1;
}
public void setDemo1(String demo1) {
	this.demo1 = demo1;
}
public String getWxclass() {
	return wxclass;
}
public void setWxclass(String wxclass) {
	this.wxclass = wxclass;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((Birthday == null) ? 0 : Birthday.hashCode());
	result = prime * result + ((City1 == null) ? 0 : City1.hashCode());
	result = prime * result + ((City2 == null) ? 0 : City2.hashCode());
	result = prime * result + ((City3 == null) ? 0 : City3.hashCode());
	result = prime * result + ((Education == null) ? 0 : Education.hashCode());
	result = prime * result + ((Grade == null) ? 0 : Grade.hashCode());
	result = prime * result + ((HeadUrl == null) ? 0 : HeadUrl.hashCode());
	result = prime * result + ((HelpCode == null) ? 0 : HelpCode.hashCode());
	result = prime * result + ((ID == null) ? 0 : ID.hashCode());
	result = prime * result + ((Lasttime == null) ? 0 : Lasttime.hashCode());
	result = prime * result + ((NickName == null) ? 0 : NickName.hashCode());
	result = prime * result + ((Password == null) ? 0 : Password.hashCode());
	result = prime * result
			+ ((Prestudent == null) ? 0 : Prestudent.hashCode());
	result = prime * result + ((Qqid == null) ? 0 : Qqid.hashCode());
	result = prime * result + ((RealName == null) ? 0 : RealName.hashCode());
	result = prime * result
			+ ((Registertime == null) ? 0 : Registertime.hashCode());
	result = prime * result + ((Salt == null) ? 0 : Salt.hashCode());
	result = prime * result + ((School == null) ? 0 : School.hashCode());
	result = prime * result + ((Sex == null) ? 0 : Sex.hashCode());
	result = prime * result + ((Sign == null) ? 0 : Sign.hashCode());
	result = prime * result + ((Teacher == null) ? 0 : Teacher.hashCode());
	result = prime * result + ((Telephone == null) ? 0 : Telephone.hashCode());
	result = prime * result + ((Unionid == null) ? 0 : Unionid.hashCode());
	result = prime * result + ((WXopendID == null) ? 0 : WXopendID.hashCode());
	result = prime * result + ((demo1 == null) ? 0 : demo1.hashCode());
	result = prime * result + ((wxclass == null) ? 0 : wxclass.hashCode());
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Users other = (Users) obj;
	if (Birthday == null) {
		if (other.Birthday != null)
			return false;
	} else if (!Birthday.equals(other.Birthday))
		return false;
	if (City1 == null) {
		if (other.City1 != null)
			return false;
	} else if (!City1.equals(other.City1))
		return false;
	if (City2 == null) {
		if (other.City2 != null)
			return false;
	} else if (!City2.equals(other.City2))
		return false;
	if (City3 == null) {
		if (other.City3 != null)
			return false;
	} else if (!City3.equals(other.City3))
		return false;
	if (Education == null) {
		if (other.Education != null)
			return false;
	} else if (!Education.equals(other.Education))
		return false;
	if (Grade == null) {
		if (other.Grade != null)
			return false;
	} else if (!Grade.equals(other.Grade))
		return false;
	if (HeadUrl == null) {
		if (other.HeadUrl != null)
			return false;
	} else if (!HeadUrl.equals(other.HeadUrl))
		return false;
	if (HelpCode == null) {
		if (other.HelpCode != null)
			return false;
	} else if (!HelpCode.equals(other.HelpCode))
		return false;
	if (ID == null) {
		if (other.ID != null)
			return false;
	} else if (!ID.equals(other.ID))
		return false;
	if (Lasttime == null) {
		if (other.Lasttime != null)
			return false;
	} else if (!Lasttime.equals(other.Lasttime))
		return false;
	if (NickName == null) {
		if (other.NickName != null)
			return false;
	} else if (!NickName.equals(other.NickName))
		return false;
	if (Password == null) {
		if (other.Password != null)
			return false;
	} else if (!Password.equals(other.Password))
		return false;
	if (Prestudent == null) {
		if (other.Prestudent != null)
			return false;
	} else if (!Prestudent.equals(other.Prestudent))
		return false;
	if (Qqid == null) {
		if (other.Qqid != null)
			return false;
	} else if (!Qqid.equals(other.Qqid))
		return false;
	if (RealName == null) {
		if (other.RealName != null)
			return false;
	} else if (!RealName.equals(other.RealName))
		return false;
	if (Registertime == null) {
		if (other.Registertime != null)
			return false;
	} else if (!Registertime.equals(other.Registertime))
		return false;
	if (Salt == null) {
		if (other.Salt != null)
			return false;
	} else if (!Salt.equals(other.Salt))
		return false;
	if (School == null) {
		if (other.School != null)
			return false;
	} else if (!School.equals(other.School))
		return false;
	if (Sex == null) {
		if (other.Sex != null)
			return false;
	} else if (!Sex.equals(other.Sex))
		return false;
	if (Sign == null) {
		if (other.Sign != null)
			return false;
	} else if (!Sign.equals(other.Sign))
		return false;
	if (Teacher == null) {
		if (other.Teacher != null)
			return false;
	} else if (!Teacher.equals(other.Teacher))
		return false;
	if (Telephone == null) {
		if (other.Telephone != null)
			return false;
	} else if (!Telephone.equals(other.Telephone))
		return false;
	if (Unionid == null) {
		if (other.Unionid != null)
			return false;
	} else if (!Unionid.equals(other.Unionid))
		return false;
	if (WXopendID == null) {
		if (other.WXopendID != null)
			return false;
	} else if (!WXopendID.equals(other.WXopendID))
		return false;
	if (demo1 == null) {
		if (other.demo1 != null)
			return false;
	} else if (!demo1.equals(other.demo1))
		return false;
	if (wxclass == null) {
		if (other.wxclass != null)
			return false;
	} else if (!wxclass.equals(other.wxclass))
		return false;
	return true;
}
@Override
public String toString() {
	return "Users [ID=" + ID + ", NickName=" + NickName + ", RealName="
			+ RealName + ", Telephone=" + Telephone + ", Password=" + Password
			+ ", HeadUrl=" + HeadUrl + ", Sex=" + Sex + ", Birthday="
			+ Birthday + ", City1=" + City1 + ", City2=" + City2 + ", City3="
			+ City3 + ", Sign=" + Sign + ", Registertime=" + Registertime
			+ ", Lasttime=" + Lasttime + ", Salt=" + Salt + ", School="
			+ School + ", Grade=" + Grade + ", Education=" + Education
			+ ", Teacher=" + Teacher + ", HelpCode=" + HelpCode
			+ ", Prestudent=" + Prestudent + ", Qqid=" + Qqid + ", WXopendID="
			+ WXopendID + ", Unionid=" + Unionid + ", demo1=" + demo1
			+ ", wxclass=" + wxclass + "]";
}
  
  
}
