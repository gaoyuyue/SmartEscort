package cn.attackme.escort.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by arthurme on 2017/7/8.
 */
@Entity
@Table

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UMIPackage {
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    private String name;
    private String phoneNumber;
    private String message;
    private School school;
    private Area area;
    private String detailAddress;
}
