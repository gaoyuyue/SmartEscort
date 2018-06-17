package cn.attackme.escort.Config;

import java.util.List;

/**
 * Created by arthurme on 2017/7/17.
 */
public class ParamValidException extends Exception{
    private List<FieldError> fieldErrors;
    public ParamValidException(List<FieldError> errors) {
        this.fieldErrors = errors;
    }
}