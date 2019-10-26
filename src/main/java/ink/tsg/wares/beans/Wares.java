package ink.tsg.wares.beans;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.enums.FieldFill;
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
 * @since 2019-10-12
 */
@TableName("tb_wares")
public class Wares extends Model<Wares> {

    private static final long serialVersionUID = 1L;

    /**
     * 商品的id
     */
    @TableId(value = "wares_id", type = IdType.AUTO)
    private Integer waresId;
    /**
     * 商品名称
     */
    private String waresName;
    /**
     * 商品的价格
     */
    private BigDecimal waresPrice;
    /**
     * 商品简单描述
     */
    private String waresDes;
    /**
     * 商品的状态（热销商品 外表）
     */
    private Integer waresHotId;
    /**
     * 商品使用人群
     */
    private String waresOfMan;
    /**
     * 商品图片路径
     */
    private String waresImg;
    /**
     * 商品分类（头饰。。。外表）
     */
    private Integer waresClothingId;
    /**
     * 商品适宜季节
     */
    private String waresSeaso;
    /**
     * 商品尺寸
     */
    private String waresSize;
    /**
     * 商品上架时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String creatTime;
    /**
     * 1是未删除，-1是已经删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer waresDel;
    
    @TableField(exist=false)
    private Hotwares hotwares;
    
    @TableField(exist=false)
    private Clothingwares clothingwares;
    

    public Hotwares getHotwares() {
		return hotwares;
	}

	public void setHotwares(Hotwares hotwares) {
		this.hotwares = hotwares;
	}

	public Clothingwares getClothingwares() {
		return clothingwares;
	}

	public void setClothingwares(Clothingwares clothingwares) {
		this.clothingwares = clothingwares;
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

    public BigDecimal getWaresPrice() {
        return waresPrice;
    }

    public void setWaresPrice(BigDecimal waresPrice) {
        this.waresPrice = waresPrice;
    }

    public String getWaresDes() {
        return waresDes;
    }

    public void setWaresDes(String waresDes) {
        this.waresDes = waresDes;
    }

    public Integer getWaresHotId() {
        return waresHotId;
    }

    public void setWaresHotId(Integer waresHotId) {
        this.waresHotId = waresHotId;
    }

    public String getWaresOfMan() {
        return waresOfMan;
    }

    public void setWaresOfMan(String waresOfMan) {
        this.waresOfMan = waresOfMan;
    }

    public String getWaresImg() {
        return waresImg;
    }

    public void setWaresImg(String waresImg) {
        this.waresImg = waresImg;
    }

    public Integer getWaresClothingId() {
        return waresClothingId;
    }

    public void setWaresClothingId(Integer waresClothingId) {
        this.waresClothingId = waresClothingId;
    }

    public String getWaresSeaso() {
        return waresSeaso;
    }

    public void setWaresSeaso(String waresSeaso) {
        this.waresSeaso = waresSeaso;
    }

    public String getWaresSize() {
        return waresSize;
    }

    public void setWaresSize(String waresSize) {
        this.waresSize = waresSize;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    public Integer getWaresDel() {
        return waresDel;
    }

    public void setWaresDel(Integer waresDel) {
        this.waresDel = waresDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.waresId;
    }

    @Override
    public String toString() {
        return "Wares{" +
        " waresId=" + waresId +
        ", waresName=" + waresName +
        ", waresPrice=" + waresPrice +
        ", waresDes=" + waresDes +
        ", waresHotId=" + waresHotId +
        ", waresOfMan=" + waresOfMan +
        ", waresImg=" + waresImg +
        ", waresClothingId=" + waresClothingId +
        ", waresSeaso=" + waresSeaso +
        ", waresSize=" + waresSize +
        ", creatTime=" + creatTime +
        ", waresDel=" + waresDel +
        "}";
    }
}
