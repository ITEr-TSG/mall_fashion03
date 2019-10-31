package ink.tsg.shopcar.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;

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
 * @since 2019-10-31
 */
@TableName("tb_wares_shopcar")
public class WaresShopcar extends Model<WaresShopcar> {

    private static final long serialVersionUID = 1L;

    /**
     * 购物车表的id
     */
    @TableId(value = "shop_car_id", type = IdType.AUTO)
    private Integer shopCarId;
    /**
     * 用户表的id
     */
    private Integer custId;
    /**
     * 商品的id
     */
    private Integer waresId;
    /**
     * 商品的名称
     */
    private String waresName;
    /**
     * 商品的尺码
     */
    private String waresSize;
    /**
     * 商品的单价
     */
    private BigDecimal waresPrice;
    /**
     * 商品的数量
     */
    private Integer waresNum;
    /**
     * 加入购物车的商品的小计
     */
    private BigDecimal waresTotal;
    /**
     * 购物车的状态
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer carState;
    /**
     * 创建的时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String createTime;


    public Integer getShopCarId() {
        return shopCarId;
    }

    public void setShopCarId(Integer shopCarId) {
        this.shopCarId = shopCarId;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public Integer getWaresId() {
        return waresId;
    }

    public void setWaresId(Integer waresId) {
        this.waresId = waresId;
    }

    public String getWaresName() {
        return waresName;
    }

    public void setWaresName(String waresName) {
        this.waresName = waresName;
    }

    public String getWaresSize() {
        return waresSize;
    }

    public void setWaresSize(String waresSize) {
        this.waresSize = waresSize;
    }

    public BigDecimal getWaresPrice() {
        return waresPrice;
    }

    public void setWaresPrice(BigDecimal waresPrice) {
        this.waresPrice = waresPrice;
    }

    public Integer getWaresNum() {
        return waresNum;
    }

    public void setWaresNum(Integer waresNum) {
        this.waresNum = waresNum;
    }

    public BigDecimal getWaresTotal() {
        return waresTotal;
    }

    public void setWaresTotal(BigDecimal waresTotal) {
        this.waresTotal = waresTotal;
    }

    public Integer getCarState() {
        return carState;
    }

    public void setCarState(Integer carState) {
        this.carState = carState;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.shopCarId;
    }

    @Override
    public String toString() {
        return "WaresShopcar{" +
        ", shopCarId=" + shopCarId +
        ", custId=" + custId +
        ", waresId=" + waresId +
        ", waresName=" + waresName +
        ", waresSize=" + waresSize +
        ", waresPrice=" + waresPrice +
        ", waresNum=" + waresNum +
        ", waresTotal=" + waresTotal +
        ", carState=" + carState +
        ", createTime=" + createTime +
        "}";
    }
}
