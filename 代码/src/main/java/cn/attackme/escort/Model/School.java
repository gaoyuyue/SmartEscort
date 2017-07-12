package cn.attackme.escort.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
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

@AllArgsConstructor
@NoArgsConstructor
public class School implements Serializable {

    private static final long serialVersionUID = 8028574764523803574L;

    @Getter
    @Setter
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    @Getter
    @Setter
    private String schoolName;

    @Setter
    @OneToMany(mappedBy = "school",cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.EXTRA)
    private List<Area> areaList;

    public School(String schoolName, List<Area> areaList) {
        this.schoolName = schoolName;
        this.areaList = areaList;
    }

    @JsonIgnore
    public List<Area> getAreaList(){
        return areaList;
    }
}
