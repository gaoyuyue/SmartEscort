package cn.attackme.escort.Model;

import cn.attackme.escort.Annotations.NotCode;
import cn.attackme.escort.Annotations.Phone;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

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

    @NotBlank
    @NotCode
    private String name;
    @Phone
    private String phoneNumber;
    @NotBlank
    @NotCode
    private String message;
    private PackageStatus packageStatus;

    @ManyToOne(cascade={CascadeType.ALL}, fetch=FetchType.EAGER)
    @JoinColumn(name = "school")
    private School school;

    @OneToOne
    @JoinColumn(name = "area")
    private Area area;

    @OneToOne
    @JoinColumn(name = "courierCompany")
    private CourierCompany courierCompany;

    @NotBlank
    @NotCode
    private String detailAddress;
    private Date createDate;
    private Date receiveDate;
    private Date endDate;
}
