package cn.attackme.escort.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.ManyToAny;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 收货地址
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table

@AllArgsConstructor
@NoArgsConstructor
public class Address implements Serializable{

    private static final long serialVersionUID = 4321293707808080387L;

    @Setter
    @Getter
    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    @Setter
    @Getter
    @OneToOne
    @JoinColumn(name = "area")
    private Area area;

    //详细地址
    @Setter
    @Getter
    private String detail;

    @Setter
    @Getter
    private String phoneNumber;

    @Setter
    @Getter
    private String receiverName;

    //是否是默认地址
    @Setter
    @Getter
    private boolean isDefault;

    @Setter
    @ManyToOne
    @JoinColumn(name = "user")
    private User user;

    @JsonIgnore
    public User getUser(){
        return user;
    }
}
