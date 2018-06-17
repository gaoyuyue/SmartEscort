package cn.attackme.escort.Model;

import cn.attackme.escort.Annotations.NotCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 区域
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Area implements Serializable{

    private static final long serialVersionUID = -1246212064166871355L;

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator" ,strategy = "increment")
    private Integer id;

    //区域名称
    @NotBlank
    @NotCode
    private String areaName;

    @ManyToOne
    @JoinColumn(name = "school")
    private School school;

    public Area(String areaName, School school) {
        this.areaName = areaName;
        this.school = school
        ;
    }
}
