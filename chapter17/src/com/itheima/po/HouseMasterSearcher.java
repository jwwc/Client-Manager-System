package com.itheima.po;

import java.util.Date;

import com.itheima.util.vo.Page;

public class HouseMasterSearcher{
	

	private Long id;

	    private String name;

	    private String sex;

	    private String birthday;
	    
	    private String beginDate;
	    
	    private String month;
	    
	    private String day;
	    
	    private String address;

	    private String telephone;

	    private String memo;

	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name == null ? null : name.trim();
	    }

	    public String getSex() {
	        return sex;
	    }

	    public void setSex(String sex) {
	        this.sex = sex == null ? null : sex.trim();
	    }

	    public String getBirthday() {
	        return birthday;
	    }

	    public void setBirthday(String birthday) {
	        this.birthday = birthday;
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address == null ? null : address.trim();
	    }

	    public String getTelephone() {
	        return telephone;
	    }

	    public void setTelephone(String telephone) {
	        this.telephone = telephone == null ? null : telephone.trim();
	    }

	    public String getMemo() {
	        return memo;
	    }

	    public void setMemo(String memo) {
	        this.memo = memo == null ? null : memo.trim();
	    }

		public String getBeginDate() {
			return beginDate;
		}

		public void setBeginDate(String beginDate) {
			this.beginDate = beginDate;
		}

		public String getMonth() {
			return month;
		}

		public void setMonth(String month) {
			this.month = month;
		}

		public String getDay() {
			return day;
		}

		public void setDay(String day) {
			this.day = day;
		}
		   @Override
			public String toString() {
				return "HouseMasterSearcher [id=" + id + ", name=" + name + ", sex=" + sex + ", birthday=" + birthday
						+ ", beginDate=" + beginDate + ", month=" + month + ", day=" + day + ", address=" + address
						+ ", telephone=" + telephone + ", memo=" + memo + "]";
			}


}
