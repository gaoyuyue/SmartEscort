package cn.attackme.escort.Service;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

/**
 * Created by hujian on 2017/3/25.
 */
@Service
public class PackageService extends BaseService<Package> {

    /**
     * 根据状态来获取包裹
     * @param packageStatus 包裹状态
     * @param pageNumber 页码
     * @param pageSize 页数
     * @return
     */
    public PageResults<Package> getPackageByStatus(@NotNull final PackageStatus packageStatus,
                                                   @NotNull final int pageNumber,
                                                   @NotNull final int pageSize){

        Query query=new Query(entityManager);
        query.from(Package.class)
                .whereEqual("packageStatus",packageStatus)
                .setOrder("id","desc");
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }

    /**
     * 根据状态和学校来获取包裹
     * @param packageStatus
     * @param school
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public PageResults<Package> getPackageByStatusAndSchool(@NotNull final PackageStatus packageStatus,
                                                            @NotNull final School school,
                                                            @NotNull final int pageNumber,
                                                            @NotNull final int pageSize){
        Query query=new Query(entityManager);
        query.from(Package.class)
                .whereEqual("packageStatus",packageStatus)
                .whereEqual("school",school)
                .setOrder("id","desc");
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }
}
