/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author KHOA
 */
public class Cart {

    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO p) {
        boolean result = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(p.getId())) {
                int currentQuantity = this.cart.get(p.getId()).getQuantity();
                p.setQuantity(currentQuantity + p.getQuantity());
            }
            this.cart.put(p.getId(), p);
            result = true;
        } catch (Exception e) {
        }
        return result;
    }

    public boolean remove(String id) {
        boolean result = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    result = true;
                }
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public boolean update(ProductDTO p){
        boolean result = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(p.getId())) {
                    this.cart.replace(p.getId(), p);
                    result = true;
                }
            }
        } catch (Exception e) {
        }
        return result;
    }
}
