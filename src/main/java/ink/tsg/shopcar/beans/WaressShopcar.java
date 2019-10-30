package ink.tsg.shopcar.beans;

import java.io.Serializable;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * <p>
 * 购物车实体类
 * </p>
 *
 * @author ITEr
 * @since 2019-10-30
 */
@TableName("tb_waress_shopcar")
public class WaressShopcar extends Model<WaressShopcar> {

    private static final long serialVersionUID = 1L;

    /**
     * 购物车表的id
     */
    @TableId(value = "shop_car", type = IdType.AUTO)
    private Integer shopCar;
    /**
     * 用户表的id
     */
    private Integer custId;
    /**
     * 商品的id
     */
    private Integer waresId;
    /**
     * 商品的数量
     */
    private Integer waresNum;
    /**
     * 购物车的状态
     */
    private Integer carState;
    /**
     * 创建的时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String createTime;


    public Integer getShopCar() {
        return shopCar;
    }

    public void setShopCar(Integer shopCar) {
        this.shopCar = shopCar;
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

    public Integer getWaresNum() {
        return waresNum;
    }

    public void setWaresNum(Integer waresNum) {
        this.waresNum = waresNum;
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
        return this.shopCar;
    }

    @Override
    public String toString() {
        return "WaressShopcar{" +
        "shopCar=" + shopCar +
        ", custId=" + custId +
        ", waresId=" + waresId +
        ", waresNum=" + waresNum +
        ", carState=" + carState +
        ", createTime=" + createTime +
        "}";
    }
}
