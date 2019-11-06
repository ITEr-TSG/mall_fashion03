package ink.tsg.contact.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ITEr
 * @since 2019-11-06
 */
@TableName("tb_contact")
public class Contact extends Model<Contact> {

    private static final long serialVersionUID = 1L;

    /**
     * 联系我们id
     */
    @TableId(value = "contact_id", type = IdType.AUTO)
    private Integer contactId;
    /**
     * 名字
     */
    private String contactName;
    /**
     * 邮箱
     */
    private String contactEmail;
    /**
     * 内容
     */
    private String contactText;
    /**
     * 留言状态
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer contactState;
    /**
     * 时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String creatTime;


    public Integer getContactId() {
        return contactId;
    }

    public void setContactId(Integer contactId) {
        this.contactId = contactId;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactText() {
        return contactText;
    }

    public void setContactText(String contactText) {
        this.contactText = contactText;
    }

    public Integer getContactState() {
        return contactState;
    }

    public void setContactState(Integer contactState) {
        this.contactState = contactState;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.contactId;
    }

    @Override
    public String toString() {
        return "Contact{" +
        ", contactId=" + contactId +
        ", contactName=" + contactName +
        ", contactEmail=" + contactEmail +
        ", contactText=" + contactText +
        ", contactState=" + contactState +
        ", creatTime=" + creatTime +
        "}";
    }
}
