package cn.attackme.escort.Annotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

/**
 * Created by arthurme on 2017/7/16.
 */
public class NotCodeConstraintValidator implements ConstraintValidator<NotCode,String>{
    @Override
    public void initialize(NotCode notCode) {
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if (s == null) return true;
        Pattern p=Pattern.compile("<[a-zA-Z/][^>]+>");
        return !p.matcher(s).find();
    }
}
