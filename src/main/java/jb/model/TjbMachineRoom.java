
/*
 * @author John
 * @date - 2015-08-03
 */

package jb.model;

import javax.persistence.*;

import java.util.Date;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@SuppressWarnings("serial")
@Entity
@Table(name = "jb_machine_room")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TjbMachineRoom implements java.io.Serializable,IEntity{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "JbMachineRoom";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "机房名称";
	public static final String ALIAS_IMAGE_PATH = "图片地址";
	public static final String ALIAS_AREA_CODE = "地区代码";
	public static final String ALIAS_ADDRESS = "详细地址";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_ADDTIME = "addtime";
	
	//date formats
	public static final String FORMAT_ADDTIME = jb.util.Constants.DATE_FORMAT_FOR_ENTITY;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//@Length(max=36)
	private java.lang.String id;
	//@Length(max=36)
	private java.lang.String name;
	//@Length(max=128)
	private java.lang.String imagePath;
	//@Length(max=36)
	private java.lang.String areaCode;
	//@Length(max=256)
	private java.lang.String address;
	//@Length(max=256)
	private java.lang.String remark;
	//
	private java.util.Date addtime;
	//columns END


		public TjbMachineRoom(){
		}
		public TjbMachineRoom(String id) {
			this.id = id;
		}
	

	public void setId(java.lang.String id) {
		this.id = id;
	}
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public java.lang.String getId() {
		return this.id;
	}
	
	@Column(name = "name", unique = false, nullable = true, insertable = true, updatable = true, length = 36)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	@Column(name = "image_path", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	public java.lang.String getImagePath() {
		return this.imagePath;
	}
	
	public void setImagePath(java.lang.String imagePath) {
		this.imagePath = imagePath;
	}
	
	@Column(name = "areaCode", unique = false, nullable = true, insertable = true, updatable = true, length = 36)
	public java.lang.String getAreaCode() {
		return this.areaCode;
	}
	
	public void setAreaCode(java.lang.String areaCode) {
		this.areaCode = areaCode;
	}
	
	@Column(name = "address", unique = false, nullable = true, insertable = true, updatable = true, length = 256)
	public java.lang.String getAddress() {
		return this.address;
	}
	
	public void setAddress(java.lang.String address) {
		this.address = address;
	}
	
	@Column(name = "remark", unique = false, nullable = true, insertable = true, updatable = true, length = 256)
	public java.lang.String getRemark() {
		return this.remark;
	}
	
	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}
	

	@Column(name = "addtime", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.util.Date getAddtime() {
		return this.addtime;
	}
	
	public void setAddtime(java.util.Date addtime) {
		this.addtime = addtime;
	}
	
	
	/*
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("ImagePath",getImagePath())
			.append("AreaCode",getAreaCode())
			.append("Address",getAddress())
			.append("Remark",getRemark())
			.append("Addtime",getAddtime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof JbMachineRoom == false) return false;
		if(this == obj) return true;
		JbMachineRoom other = (JbMachineRoom)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

