package cn.attackme.escort.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

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
    private String orderNumber;

    private String name;
    private String phoneNumber;
    private String message;

    @ManyToOne(cascade={CascadeType.ALL}, fetch=FetchType.EAGER)
    @JoinColumn(name = "school")
    private School school;

    @OneToOne
    @JoinColumn(name = "area")
    private Area area;
    private String detailAddress;
    private Date createDate;
}
