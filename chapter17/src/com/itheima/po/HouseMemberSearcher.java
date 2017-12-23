package com.itheima.po;


/**
 * 
 * @author fanxinyu
 *
 */
public class HouseMemberSearcher{
	
    private Long id;

    private String name;

    private Long belongHouseId;

    private String relationship;

    private String sex;

    private String birthday;

    private String telephone;
    
    private String memo;
    
    private String masterName;  //户主名 
    
    private String houseAddress;  //家庭住址
    
    private String birthdayFlag;   //生日标识
    
    private String masterFlag;   //是否户主标识
    
    
    
    

	public String getMasterFlag() {
		return masterFlag;
	}

	public void setMasterFlag(String masterFlag) {
		this.masterFlag = masterFlag;
	}

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

    public Long getBelongHouseId() {
        return belongHouseId;
    }

    public void setBelongHouseId(Long belongHouseId) {
        this.belongHouseId = belongHouseId;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship == null ? null : relationship.trim();
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

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	public String getHouseAddress() {
		return houseAddress;
	}

	public void setHouseAddress(String houseAddress) {
		this.houseAddress = houseAddress;
	}

	public String getBirthdayFlag() {
		return birthdayFlag;
	}

	public void setBirthdayFlag(String birthdayFlag) {
		this.birthdayFlag = birthdayFlag;
	}

	@Override
	public String toString() {
		return "HouseMember [id=" + id + ", name=" + name + ", belongHouseId=" + belongHouseId + ", relationship="
				+ relationship + ", sex=" + sex + ", birthday=" + birthday + ", telephone=" + telephone + ", memo="
				+ memo + ", masterName=" + masterName + ", houseAddress=" + houseAddress + ", birthdayFlag="
				+ birthdayFlag + ", masterFlag=" + masterFlag + "]";
	}



}
