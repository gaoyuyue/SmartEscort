package cn.attackme.escort.Service;

import cn.attackme.escort.Model.CreditRecord;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Repository.Query;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;

/**
 * Created by arthurme on 2017/7/11.
 */
@Service
public class CreditRecordService extends BaseService<CreditRecord> {
    public CreditRecord getByUserInformation(@NotNull User user){
        Query query = new Query(entityManager);
        return (CreditRecord) query.from(CreditRecord.class)
                .whereEqual("user",user)
                .createTypedQuery()
                .setFirstResult(0)
                .setMaxResults(1)
                .getSingleResult();
    }
}
