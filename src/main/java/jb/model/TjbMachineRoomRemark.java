
/*
 * @author John
 * @date - 2015-08-03
 */

package jb.model;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@SuppressWarnings("serial")
@Entity
@Table(name = "jb_machine_room_remark")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TjbMachineRoomRemark implements java.io.Serializable,IEntity{
	private static final long serialVersionUID = 5454155825314635342L;

	//alias
	public static final String TABLE_ALIAS = "JbMachineRoomRemark";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_ROOM_ID = "机房ID";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_ADDTIME = "addtime";

	//date formats
	public static final String FORMAT_ADDTIME = jb.util.Constants.DATE_FORMAT_FOR_ENTITY;


	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//@Length(max=36)
	private String id;
	//@Length(max=36)
	private String roomId;
	private String remark;
	//
	private Date addtime;
	//columns END


		public TjbMachineRoomRemark(){
		}
		public TjbMachineRoomRemark(String id) {
			this.id = id;
		}


	public void setId(String id) {
		this.id = id;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	@Column(name = "room_id", unique = false, nullable = true, insertable = true, updatable = true, length = 36)
	public String getRoomId() {
		return this.roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	@Column(name = "remark", unique = false, nullable = true, insertable = true, updatable = true, length = 256)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	@Column(name = "addtime", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public Date getAddtime() {
		return this.addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	
	/*
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("RoomId",getRoomId())
			.append("Name",getName())
			.append("Scope",getScope())
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
		if(obj instanceof JbMachineRoomArea == false) return false;
		if(this == obj) return true;
		JbMachineRoomArea other = (JbMachineRoomArea)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

