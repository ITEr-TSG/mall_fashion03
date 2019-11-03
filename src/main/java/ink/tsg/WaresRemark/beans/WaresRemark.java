package ink.tsg.WaresRemark.beans;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
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
 * @since 2019-11-03
 */
@TableName("tb_wares_remark")
public class WaresRemark extends Model<WaresRemark> {

    private static final long serialVersionUID = 1L;

    /**
     * 修改商品的备注表id
     */
    @TableId(value = "remark_id", type = IdType.AUTO)
    private Integer remarkId;
    /**
     * 订单表的id
     */
    private String orderId;
    /**
     * 备注的信息
     */
    private String remarkText;


    public Integer getRemarkId() {
        return remarkId;
    }

    public void setRemarkId(Integer remarkId) {
        this.remarkId = remarkId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getRemarkText() {
        return remarkText;
    }

    public void setRemarkText(String remarkText) {
        this.remarkText = remarkText;
    }

    @Override
    protected Serializable pkVal() {
        return this.remarkId;
    }

    @Override
    public String toString() {
        return "WaresRemark{" +
        "remarkId=" + remarkId +
        ", orderId=" + orderId +
        ", remarkText=" + remarkText +
        "}";
    }
}
