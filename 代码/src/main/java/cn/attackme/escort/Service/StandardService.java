package cn.attackme.escort.Service;

import cn.attackme.escort.Model.Standard;
import cn.attackme.escort.Repository.Query;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;

/**
 * Created by arthurme on 2017/4/27.
 */
@Service
public class StandardService extends BaseService<Standard>{
    public Standard getByDescription(@NotNull String description){
        Query query = new Query(entityManager);
        return (Standard) query.from(Standard.class)
                .whereEqual("description",description)
                .createTypedQuery()
                .setFirstResult(0)
                .setMaxResults(1)
                .getSingleResult();
    }
}
