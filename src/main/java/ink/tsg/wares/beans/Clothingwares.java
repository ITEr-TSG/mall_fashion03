package ink.tsg.wares.beans;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 这个实体是关于商品是帽子、下装、上衣...
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
@TableName("tb_clothingwares")
public class Clothingwares extends Model<Clothingwares> {

    private static final long serialVersionUID = 1L;

    /**
     * 商品使用位置
     */
    @TableId(value = "clothing_id", type = IdType.AUTO)
    private Integer clothingId;
    private String clothingName;


    public Integer getClothingId() {
        return clothingId;
    }

    public void setClothingId(Integer clothingId) {
        this.clothingId = clothingId;
    }

    public String getClothingName() {
        return clothingName;
    }

    public void setClothingName(String clothingName) {
        this.clothingName = clothingName;
    }

    @Override
    protected Serializable pkVal() {
        return this.clothingId;
    }

    @Override
    public String toString() {
        return "Clothingwares{" +
        ", clothingId=" + clothingId +
        ", clothingName=" + clothingName +
        "}";
    }
}
