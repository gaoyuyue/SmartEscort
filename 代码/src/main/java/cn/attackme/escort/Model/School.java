package cn.attackme.escort.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table

@Data
@AllArgsConstructor
@NoArgsConstructor
public class School implements Serializable {

    private static final long serialVersionUID = 8028574764523803574L;

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    private String schoolName;

    @OneToMany(mappedBy = "school",cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.EXTRA)
    private List<Area> areaList;

    public School(String schoolName, List<Area> areaList) {
        this.schoolName = schoolName;
        this.areaList = areaList;
    }
}
