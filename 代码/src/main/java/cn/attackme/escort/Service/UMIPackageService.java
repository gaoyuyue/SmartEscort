package cn.attackme.escort.Service;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.UMIPackage;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;

/**
 * Created by arthurme on 2017/7/8.
 */
@Service
public class UMIPackageService extends BaseService<UMIPackage>{
    public PageResults<UMIPackage> getListPageBySchoolAndArea(@NotNull School school,
                                                              @NotNull Area area,
                                                              @NotNull int pageNumber,
                                                              @NotNull int pageSize){
        Query query = new Query(entityManager);
        query.from(UMIPackage.class)
                .whereEqual("school",school)
                .whereEqual("area",area);
        return this.getListByPageAndQuery(pageNumber, pageSize, query);
    }
}
