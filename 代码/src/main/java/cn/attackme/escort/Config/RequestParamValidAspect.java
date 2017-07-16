package cn.attackme.escort.Config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/**
 * Created by arthurme on 2017/7/16.
 */
@Aspect
@Component
public class RequestParamValidAspect {
    @Before("execution(* cn.attackme.escort.Controller..*.*(..))")
    public void before(JoinPoint joinPoint){
//        Object target = joinPoint.getThis();
//        Object[] args = joinPoint.getArgs();
    }
}
