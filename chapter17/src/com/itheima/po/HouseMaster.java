package com.itheima.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class HouseMaster {
	
    private Long id;

    private String name;         //户主名称

    private String sex;

    private String birthday;

    private String address;
    
    private String relationShip;

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


	public String getRelationShip() {
		return relationShip;
	}

	public void setRelationShip(String relationShip) {
		this.relationShip = relationShip;
	}

	@Override
	public String toString() {
		return "HouseMaster [id=" + id + ", name=" + name + ", sex=" + sex + ", birthday=" + birthday + ", address="
				+ address + ", relationShip=" + relationShip + ", telephone=" + telephone + ", memo=" + memo + "]";
	}

    
}