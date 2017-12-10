package cn.attackme.escort.Annotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Created by arthurme on 2017/7/16.
 */
public class PhoneConstraintValidator implements ConstraintValidator<Phone,String> {
    @Override
    public void initialize(Phone phone) {

    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if(s == null) return false;
        return s.matches("^1[34578]\\d{9}$");
    }
}
