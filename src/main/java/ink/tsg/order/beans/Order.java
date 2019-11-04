package ink.tsg.order.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
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
 * @since 2019-11-01
 */
@TableName("tb_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单表主键
     */
    @TableId(value = "order_id", type = IdType.AUTO)
    private Integer orderId;
    /**
     * 订单号
     */
    private String orderNum;
    /**
     * 收货人姓名
     */
    private String orderConsignee;
    /**
     * 收货人地址
     */
    private String orderAddr;
    /**
     * 收货人eamil
     */
    private String orderEmail;
    /**
     * 下单人用户id
     */
    private Integer orderCustId;
    /**
     * 商品条目id
     */
    private Integer orderCarId;
    /**
     * 是否收货（-1未收货，1表示已收货）
     */
    private Integer isShip;
    /**
     * 订单状态（已经支付，待发货。。。。）
     */
    private String orderState;
    /**
     * 支付时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String payTime;
    /**
             *收货时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private String shipTime;


    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getorderConsignee() {
        return orderConsignee;
    }

	public void setorderConsignee(String orderConsignee) {
        this.orderConsignee = orderConsignee;
    }

    public String getOrderAddr() {
        return orderAddr;
    }

    public void setOrderAddr(String orderAddr) {
        this.orderAddr = orderAddr;
    }

    public String getOrderEmail() {
        return orderEmail;
    }

    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail;
    }

    public Integer getOrderCustId() {
        return orderCustId;
    }

    public void setOrderCustId(Integer orderCustId) {
        this.orderCustId = orderCustId;
    }

    public Integer getOrderCarId() {
        return orderCarId;
    }

    public void setOrderCarId(Integer orderCarId) {
        this.orderCarId = orderCarId;
    }

    public Integer getIsShip() {
        return isShip;
    }

    public void setIsShip(Integer isShip) {
        this.isShip = isShip;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.orderId;
    }

    @Override
    public String toString() {
        return "Order{" +
        "orderId=" + orderId +
        ", orderNum=" + orderNum +
        ", orderConsignee=" + orderConsignee +
        ", orderAddr=" + orderAddr +
        ", orderEmail=" + orderEmail +
        ", orderCustId=" + orderCustId +
        ", orderCarId=" + orderCarId +
        ", isShip=" + isShip +
        ", orderState=" + orderState +
        ", payTime=" + payTime +
        "}";
    }
}
