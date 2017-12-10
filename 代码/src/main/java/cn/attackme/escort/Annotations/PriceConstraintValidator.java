package cn.attackme.escort.Annotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Created by arthurme on 2017/7/16.
 */
public class PriceConstraintValidator implements ConstraintValidator<Price,String> {
    @Override
    public void initialize(Price price) {
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if (s == null) return false;
        return s.matches("^[0-9]+(.[0-9]{1,2})?$")||s.matches("^\\d+$");
    }
}
