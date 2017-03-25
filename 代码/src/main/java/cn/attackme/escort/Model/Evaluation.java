package cn.attackme.escort.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by hujian on 2017/3/25.
 */
@Entity
@Table
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Evaluation  implements Serializable{

    private static final long serialVersionUID = -5076385879045820251L;

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy="increment")
    private Integer id;
    //评价人
    @OneToOne
    @JoinColumn(name = "evaluator")
    private User evaluator;
    //被评价人
    @OneToOne
    @JoinColumn(name = "acceptor")
    private User acceptor;
}
