package cn.attackme.escort.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private String id;

    @OneToOne
    @JoinColumn(name = "agency")
    private User agency;

    @OneToOne
    @JoinColumn(name = "delegation")
    private User delegation;

    private Integer agencyScore;
    private Integer delegationScore;

    @Enumerated(EnumType.STRING)
    private EvaluationDescription evaluationDescription;
}
