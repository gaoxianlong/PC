package com.stk.entity;
/**注册发送短息验证*/
public class OrderSms {
	private String PhoneNumbers;
	private String SignName;
	private String TemplateCode;
	private String Code;
	private String RequestId;
	private boolean Message;
	private String BizId;
	public String getPhoneNumbers() {
		return PhoneNumbers;
	}
	public void setPhoneNumbers(String phoneNumbers) {
		PhoneNumbers = phoneNumbers;
	}
	public String getSignName() {
		return SignName;
	}
	public void setSignName(String signName) {
		SignName = signName;
	}
	public String getTemplateCode() {
		return TemplateCode;
	}
	public void setTemplateCode(String templateCode) {
		TemplateCode = templateCode;
	}
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	public String getRequestId() {
		return RequestId;
	}
	public void setRequestId(String requestId) {
		RequestId = requestId;
	}
	public boolean isMessage() {
		return Message;
	}
	public void setMessage(boolean message) {
		Message = message;
	}
	public String getBizId() {
		return BizId;
	}
	public void setBizId(String bizId) {
		BizId = bizId;
	}
	@Override
	public String toString() {
		return "OrderSms [PhoneNumbers=" + PhoneNumbers + ", SignName="
				+ SignName + ", TemplateCode=" + TemplateCode + ", Code="
				+ Code + ", RequestId=" + RequestId + ", Message=" + Message
				+ ", BizId=" + BizId + "]";
	}
	
	
	
	
	
}
