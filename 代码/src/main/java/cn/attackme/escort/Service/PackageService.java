package cn.attackme.escort.Service;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

/**
 * Created by hujian on 2017/3/25.
 */
@Service
public class PackageService extends BaseService<Package> {

    public PageResults<Package> getPackageByStatus(@NotNull final PackageStatus packageStatus,
                                                   @NotNull final int pageNumber,
                                                   @NotNull final int pageSize){

        Query query=new Query(entityManager);
        query.from(Package.class)
                .whereEqual("packageStatus",packageStatus)
                .setOrder("id","desc");
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }

}
