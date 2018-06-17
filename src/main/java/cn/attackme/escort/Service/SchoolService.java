package cn.attackme.escort.Service;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * Created by hujian on 2017/4/17.
 */
@Service
public class SchoolService extends BaseService<School> {

    public School getByName(@NotNull String schoolName){
        Query query = new Query(entityManager);
        return (School) query.from(School.class)
                .whereEqual("schoolName",schoolName)
                .createTypedQuery()
                .setFirstResult(0)
                .setMaxResults(1)
                .getSingleResult();
    }
}
