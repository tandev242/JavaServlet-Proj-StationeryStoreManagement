package model;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-01-11T10:57:34")
@StaticMetamodel(product.class)
public class product_ { 

    public static volatile SingularAttribute<product, Integer> IDSubCategory;
    public static volatile SingularAttribute<product, String> Description;
    public static volatile SingularAttribute<product, String> CreatedBy;
    public static volatile SingularAttribute<product, Integer> Price;
    public static volatile SingularAttribute<product, Date> CreatedDate;
    public static volatile SingularAttribute<product, Integer> ID;
    public static volatile SingularAttribute<product, String> Image;
    public static volatile SingularAttribute<product, String> Name;
    public static volatile SingularAttribute<product, Integer> PromotionPrice;

}