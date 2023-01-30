package io.ionic.cs.portals.ecommerce.data.model;

import java.util.ArrayList;

public class User {
    public int id;
    public String firstName;
    public String lastName;
    public String email;
    public ArrayList<Address> addresses;
    public ArrayList<CreditCard> creditCards;
}
