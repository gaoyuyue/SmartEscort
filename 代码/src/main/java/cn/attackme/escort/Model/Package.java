package cn.attackme.escort.Model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 包裹
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Package implements Serializable {

    private static final long serialVersionUID = -4591451869882553177L;

    @Id
    private String id;

    //代理人
    @OneToOne
    @JoinColumn(name = "agency")
    private User agency;

    //委托人
    @OneToOne
    @JoinColumn(name = "delegation")
    private User delegation;

    //代理费
    @OneToOne
    @JoinColumn(name = "standard")
    private Standard standard;

    //快递公司
    @OneToOne
    @JoinColumn(name = "courierCompany")
    private CourierCompany courierCompany;

    //取件短信
    private String message;

    //价格
    private String price;

    //留言
    private String note;

    //是否被取消
    private boolean isCancel;

    //任务发布时间
    private Date publishTime;

    //任务领取时间
    private Date receiveTime;

    //代理人送达时间
    private Date deliveryTime;

    //委托人签收时间
    private Date endTime;

    //包裹状态
    @Enumerated(EnumType.STRING)
    private PackageStatus packageStatus;

    @Enumerated(EnumType.STRING)
    private OrderResult orderResult;

    //所属学校
    @ManyToOne (cascade={CascadeType.ALL}, fetch=FetchType.EAGER)
    @JoinColumn(name = "school")
    private School school;

    //所属区域
    @OneToOne
    @JoinColumn(name = "area")
    private Area area;

    //详细地址
    private String addressDetail;

    private String receiverPhoneNumber;

    private String receiverName;

    //委托人是否评价
    private boolean isDelegationEvaluated;
    //代理人是否评价
    private boolean isAgencyEvaluate;
}
