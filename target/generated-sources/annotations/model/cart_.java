package model;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.userInfo;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-01-11T10:57:34")
@StaticMetamodel(cart.class)
public class cart_ { 

    public static volatile SingularAttribute<cart, Date> buyDate;
    public static volatile SingularAttribute<cart, Integer> id;
    public static volatile SingularAttribute<cart, userInfo> buyer;

}