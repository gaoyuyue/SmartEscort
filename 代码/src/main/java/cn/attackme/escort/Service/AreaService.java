package cn.attackme.escort.Service;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Repository.Query;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;

/**
 * Created by hujian on 2017/4/17.
 */
@Service
public class AreaService extends BaseService<Area>{
    public Area getByName(@NotNull String areaName){
        Query query = new Query(entityManager);
        return (Area) query.from(Area.class)
                .whereEqual("areaName",areaName)
                .createTypedQuery()
                .setFirstResult(0)
                .setMaxResults(1)
                .getSingleResult();
    }
}
