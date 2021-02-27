package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.cart;
import model.product;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-01-11T10:57:34")
@StaticMetamodel(cartItem.class)
public class cartItem_ { 

    public static volatile SingularAttribute<cartItem, Integer> unitPrice;
    public static volatile SingularAttribute<cartItem, product> product;
    public static volatile SingularAttribute<cartItem, Integer> quantity;
    public static volatile SingularAttribute<cartItem, Integer> id;
    public static volatile SingularAttribute<cartItem, cart> cart;

}