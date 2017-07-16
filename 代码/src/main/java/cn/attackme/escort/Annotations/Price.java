package cn.attackme.escort.Annotations;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * Created by arthurme on 2017/7/16.
 */
@Documented
@Constraint(validatedBy = PriceConstraintValidator.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface Price {
    String message() default "{Price}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
