package cn.attackme.escort.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 区域
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table

@AllArgsConstructor
@NoArgsConstructor
public class Area implements Serializable{

    private static final long serialVersionUID = -1246212064166871355L;

    @Id
    @Setter
    @Getter
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator" ,strategy = "increment")
    private Integer id;

    //区域名称
    @Getter
    @Setter
    private String areaName;

    @ManyToOne
    @JoinColumn(name = "school")
    @Setter
    private School school;

    @JsonIgnore
    public School getSchool() {return school;}
}
