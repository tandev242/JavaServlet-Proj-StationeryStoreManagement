package model;

import java.time.LocalDateTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-01-11T10:57:34")
@StaticMetamodel(bill.class)
public class bill_ { 

    public static volatile SingularAttribute<bill, Boolean> Completed;
    public static volatile SingularAttribute<bill, LocalDateTime> CreatedDate;
    public static volatile SingularAttribute<bill, Integer> ID;
    public static volatile SingularAttribute<bill, Boolean> Confirmed;
    public static volatile SingularAttribute<bill, Boolean> Canceled;

}