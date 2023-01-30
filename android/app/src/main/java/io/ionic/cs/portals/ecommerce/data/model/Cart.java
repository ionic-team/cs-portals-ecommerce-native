package io.ionic.cs.portals.ecommerce.data.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    final private int id = (int) (Math.random() * 100) + 1;
    final private Map<Product, Integer> contents;

    public Cart() { this.contents = new HashMap<>(); }

    public int getSubTotal() {
        int subTotal = 0;
        for(Map.Entry<Product, Integer> product : this.contents.entrySet()) {
            subTotal += product.getKey().price * product.getValue();
        }
        return subTotal;
    }

    public void add(Product product, int quantity) {
        if (this.contents.containsKey(product)) {
            update(product, contents.get(product) + quantity);
        } else {
            update(product, quantity);
        }
    }

    public void update(Product product, int quantity) {
        if(quantity > 0) {
            this.contents.put(product, quantity);
        } else {
            this.contents.remove(product);
        }
    }

    public void clear() {
        this.contents.clear();
    }
}
