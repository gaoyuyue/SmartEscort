package cn.attackme.escort.Service;


import cn.attackme.escort.Model.Log;
import cn.attackme.escort.Repository.Query;
import org.springframework.stereotype.Service;

@Service
public class LogService extends BaseService<Log> {

    public Long getExceptionCountByCallerFilename(String callerFilename){
        Query query = new Query(entityManager);
        return (Long) query.from(Log.class)
                .whereEqual("caller_filename", callerFilename)
                .selectCount()
                .createTypedQuery()
                .getSingleResult();
    }

    public Long getExceptionCount(){
        Query query = new Query(entityManager);
        return (Long) query.from(Log.class)
                .selectCount()
                .createTypedQuery()
                .getSingleResult();
    }
}
