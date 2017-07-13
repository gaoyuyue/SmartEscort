package cn.attackme.escort.Service;

import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.springframework.stereotype.Service;

import org.jetbrains.annotations.NotNull;

/**
 * Created by arthurme on 2017/7/8.
 */
@Service
public class UMIPackageService extends BaseService<UMIPackage>{
    /**
     * 根据学校和区域获取分页列表
     * @param school
     * @param area
     * @param pageNumber
     * @param pageSize
     * @return
     */
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

    /**
     * 根据快递类型、状态、区域获取分页列表
     * @param area
     * @param packageStatus
     * @param courierCompany
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public PageResults<UMIPackage> getListPageByAreaAndStatusAndType(@NotNull Area area,
                                                                     @NotNull PackageStatus packageStatus,
                                                                     @NotNull CourierCompany courierCompany,
                                                                     @NotNull int pageNumber,
                                                                     @NotNull int pageSize){
        Query query = new Query(entityManager);
        query.from(UMIPackage.class)
                .whereEqual("area",area)
                .whereEqual("packageStatus",packageStatus)
                .whereEqual("courierCompany",courierCompany);
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }

    public PageResults<UMIPackage> getPackageByStatusAndSchool(@NotNull School school,
                                                               @NotNull PackageStatus packageStatus,
                                                               @NotNull int pageNumber,
                                                               @NotNull int pageSize){
        Query query = new Query(entityManager);
        query.from(UMIPackage.class)
                .whereEqual("school",school)
                .whereEqual("packageStatus",packageStatus);
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }

    public PageResults<UMIPackage> getListBySearch(@NotNull School school, @NotNull String name,@NotNull int pageNumber,@NotNull int pageSize) {
        Query query = new Query(entityManager);
        query.from(UMIPackage.class)
                .whereEqual("name",name)
                .whereEqual("school",school)
                .setOrder("publishTime","desc");;
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }
}
