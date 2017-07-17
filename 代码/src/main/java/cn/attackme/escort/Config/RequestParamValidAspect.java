package cn.attackme.escort.Config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.hibernate.validator.internal.engine.path.PathImpl;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.core.ParameterNameDiscoverer;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidatorFactory;
import javax.validation.executable.ExecutableValidator;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Created by arthurme on 2017/7/16.
 */
@Aspect
@Component
public class RequestParamValidAspect {
    ParameterNameDiscoverer parameterNameDiscoverer = new LocalVariableTableParameterNameDiscoverer();

    @Before("execution(* cn.attackme.escort.Controller..*.*(..))")
    public void before(JoinPoint point) throws ParamValidException {
        Object target = point.getThis();
        Object [] args = point.getArgs();
        Method method = ((MethodSignature)point.getSignature()).getMethod();

        Set<ConstraintViolation<Object>> validResult = validMethodParams(target, method, args);

        if (!validResult.isEmpty()) {
            String [] parameterNames = parameterNameDiscoverer.getParameterNames(method);
            List<FieldError> errors = validResult.stream().map(constraintViolation -> {
                PathImpl pathImpl = (PathImpl) constraintViolation.getPropertyPath();
                int paramIndex = pathImpl.getLeafNode().getParameterIndex();
                String paramName = parameterNames[paramIndex];
                FieldError error = new FieldError();
                error.setName(paramName);
                error.setMessage(constraintViolation.getMessage());
                return error;
            }).collect(Collectors.toList());
            throw new ParamValidException(errors);
        }
    }
    private final ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    private final ExecutableValidator validator = factory.getValidator().forExecutables();

    private <T> Set<ConstraintViolation<T>> validMethodParams(T obj, Method method, Object [] params){
        return validator.validateParameters(obj, method, params);
    }
}
