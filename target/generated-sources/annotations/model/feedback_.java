package model;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.product;
import model.userInfo;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-01-11T10:57:34")
@StaticMetamodel(feedback.class)
public class feedback_ { 

    public static volatile SingularAttribute<feedback, String> Comment;
    public static volatile SingularAttribute<feedback, Date> CreatedDate;
    public static volatile SingularAttribute<feedback, product> Product;
    public static volatile SingularAttribute<feedback, userInfo> Buyer;
    public static volatile SingularAttribute<feedback, Integer> ID;

}