package cn.attackme.escort.Model;

import cn.attackme.escort.Annotations.NotCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 代理费标准
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Standard implements Serializable{

    private static final long serialVersionUID = -4015895339720531822L;

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    //标准描述
    @NotBlank
    @NotCode
    private String description;
}
