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
 * 	这个实体是关于商品是否是热销、折扣。。。。
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
@TableName("tb_hotwares")
public class Hotwares extends Model<Hotwares> {

    private static final long serialVersionUID = 1L;

    /**
     * 热销商品的id
     */
    @TableId(value = "hot_id", type = IdType.AUTO)
    private Integer hotId;
    private String hotName;


    public Integer getHotId() {
        return hotId;
    }

    public void setHotId(Integer hotId) {
        this.hotId = hotId;
    }

    public String getHotName() {
        return hotName;
    }

    public void setHotName(String hotName) {
        this.hotName = hotName;
    }

    @Override
    protected Serializable pkVal() {
        return this.hotId;
    }

    @Override
    public String toString() {
        return "Hotwares{" +
        " hotId=" + hotId +
        ", hotName=" + hotName +
        "}";
    }
}
