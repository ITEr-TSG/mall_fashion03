package ink.tsg.customer.beans;

import java.io.Serializable;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * @author ITEr
 * @since 2019-10-02
 */
@TableName("tb_customer")
public class Customer extends Model<Customer> {

    private static final long serialVersionUID = 1L;

    /**
     * 客户id
     */
    @TableId(value = "cust_id", type = IdType.AUTO)
    private Integer custId;
    /**
     * 客户登录名
     */
    private String custName;
    /**
     * 客户昵称
     */
    private String custNick;
    /**
     * 客户的邮箱
     */
    private String custEmail;
    /**
     * 客户密码
     */
    private String custPassword;
    /**
     * 客户性别（1是男，0是女）
     */
    private Integer custGender;
    /**
     * 客户年龄
     */
    private Integer custAge;
    /**
     * 客户状态（1是未删除，-1是已经删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer custState;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String creatTime;
    /**
     * 数据更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private String updataTime;


    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustNick() {
        return custNick;
    }

    public void setCustNick(String custNick) {
        this.custNick = custNick;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    public Integer getCustGender() {
        return custGender;
    }

    public void setCustGender(Integer custGender) {
        this.custGender = custGender;
    }

    public Integer getCustAge() {
        return custAge;
    }

    public void setCustAge(Integer custAge) {
        this.custAge = custAge;
    }

    public Integer getCustState() {
        return custState;
    }

    public void setCustState(Integer custState) {
        this.custState = custState;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    public String getUpdataTime() {
        return updataTime;
    }

    public void setUpdataTime(String updataTime) {
        this.updataTime = updataTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.custId;
    }

    @Override
    public String toString() {
        return "Customer{" +
        "custId=" + custId +
        ", custName=" + custName +
        ", custNick=" + custNick +
        ", custEmail=" + custEmail +
        ", custPassword=" + custPassword +
        ", custGender=" + custGender +
        ", custAge=" + custAge +
        ", custState=" + custState +
        ", creatTime=" + creatTime +
        ", updataTime=" + updataTime +
        "}";
    }
}
