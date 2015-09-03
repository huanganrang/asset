
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
@Table(name = "jb_administrative_division")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TjbAdministrativeDivision implements java.io.Serializable,IEntity{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "JbAdministrativeDivision";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "名称";
	public static final String ALIAS_PID = "父级ID";
	public static final String ALIAS_LEVEL = "行政级别";
	public static final String ALIAS_ADDTIME = "addtime";
	
	//date formats
	public static final String FORMAT_ADDTIME = jb.util.Constants.DATE_FORMAT_FOR_ENTITY;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//@Length(max=36)
	private java.lang.String id;
	//@Length(max=72)
	private java.lang.String name;
	//@Length(max=36)
	private java.lang.String pid;
	//@Length(max=4)
	private java.lang.String level;
	//
	private java.util.Date addtime;
	//columns END


		public TjbAdministrativeDivision(){
		}
		public TjbAdministrativeDivision(String id) {
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
	
	@Column(name = "name", unique = false, nullable = true, insertable = true, updatable = true, length = 72)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	@Column(name = "pid", unique = false, nullable = true, insertable = true, updatable = true, length = 36)
	public java.lang.String getPid() {
		return this.pid;
	}
	
	public void setPid(java.lang.String pid) {
		this.pid = pid;
	}
	
	@Column(name = "level", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	public java.lang.String getLevel() {
		return this.level;
	}
	
	public void setLevel(java.lang.String level) {
		this.level = level;
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
			.append("Pid",getPid())
			.append("Level",getLevel())
			.append("Addtime",getAddtime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof JbAdministrativeDivision == false) return false;
		if(this == obj) return true;
		JbAdministrativeDivision other = (JbAdministrativeDivision)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

