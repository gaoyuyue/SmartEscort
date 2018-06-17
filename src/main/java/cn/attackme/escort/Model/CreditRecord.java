package cn.attackme.escort.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by arthurme on 2017/7/11.
 */
@Entity
@Table
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreditRecord implements Serializable {
    private static final long serialVersionUID = -5076385879045820251L;

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    @OneToOne
    @JoinColumn(name = "userId")
    private User user;

    private Integer score;

    @Enumerated(EnumType.STRING)
    private CreditRecordDescription description;
}
