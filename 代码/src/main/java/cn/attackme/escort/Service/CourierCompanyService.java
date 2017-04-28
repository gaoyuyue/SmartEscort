package cn.attackme.escort.Service;

import cn.attackme.escort.Model.CourierCompany;
import cn.attackme.escort.Repository.Query;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;

/**
 * Created by hujian on 2017/3/26.
 */
@Service
public class CourierCompanyService extends BaseService<CourierCompany> {
    public CourierCompany getByName(@NotNull String name){
        Query query = new Query(entityManager);
        return (CourierCompany) query.from(CourierCompany.class)
                .whereEqual("companyName",name)
                .createTypedQuery()
                .setFirstResult(0)
                .setMaxResults(1)
                .getSingleResult();
    }
}
