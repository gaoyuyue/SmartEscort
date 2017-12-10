package cn.attackme.escort.Service;

import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by hujian on 2017/3/25.
 */
@Service
public class PackageService extends BaseService<Package> {

    /**
     * 筛选包裹
     * @param area
     * @param courierCompany
     * @param standard
     * @param packageStatus
     * @param school
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public PageResults<Package> getPackageByFilter(@NotNull Area area,
                                                   @NotNull CourierCompany courierCompany,
                                                   @NotNull Standard standard,
                                                   @NotNull PackageStatus packageStatus,
                                                   @NotNull School school,
                                                   @NotNull int pageNumber,
                                                   @NotNull int pageSize){
        Query query = new Query(entityManager);
        query.from(Package.class)
                .whereEqual("packageStatus",packageStatus)
                .whereEqual("school",school)
                .whereEqual("area",area)
                .whereEqual("courierCompany",courierCompany)
                .whereEqual("standard",standard)
                .setOrder("id","desc");
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }

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

    /**
     * 根据快递类型、状态、区域获取分页列表
     * @param area
     * @param packageStatus
     * @param courierCompany
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public PageResults<Package> getListPageByAreaAndStatusAndType(@NotNull Area area,
                                                                     @NotNull PackageStatus packageStatus,
                                                                     @NotNull CourierCompany courierCompany,
                                                                     @NotNull int pageNumber,
                                                                     @NotNull int pageSize){
        Query query = new Query(entityManager);
        query.from(Package.class).
                whereEqual("area",area).
                whereEqual("packageStatus",packageStatus).
                whereEqual("courierCompany",courierCompany);
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }

    /**
     * 根据代理人、快递类型、状态、区域获取分页列表
     * @param user
     * @param area
     * @param packageStatus
     * @param courierCompany
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public PageResults<Package> getListPageByAreaAndStatusAndTypeAndUser(@NotNull User user,
                                                                  @NotNull Area area,
                                                                  @NotNull PackageStatus packageStatus,
                                                                  @NotNull CourierCompany courierCompany,
                                                                  @NotNull int pageNumber,
                                                                  @NotNull int pageSize){
        Query query = new Query(entityManager);
        query.from(Package.class).
                whereEqual("agency",user);
        return this.getListPageByAreaAndStatusAndType(area,packageStatus,courierCompany,pageNumber,pageSize);
    }

    /**
     * 根据状态列表获取包裹列表
     * @param packageStatusList
     * @return
     */
    public List<Package> getListByStatusList(@NotNull List<Object> packageStatusList){
        Query query = new Query(entityManager);
        return query.from(Package.class).
                whereValueIn("packageStatus", packageStatusList).
                createTypedQuery().
                getResultList();
    }
    //根据用户搜索
    public PageResults<Package> getListBySearch(@NotNull School school,
                                                          @NotNull String packageId,
                                                          @NotNull int pageNumber,
                                                          @NotNull int pageSize){
        Query query = new Query(entityManager);
        query.from(Package.class)
                .whereEqual("school",school)
                .whereEqual("id",packageId)
                .setOrder("publishTime","desc");
        return this.getListByPageAndQuery(pageNumber,pageSize,query);
    }
}
