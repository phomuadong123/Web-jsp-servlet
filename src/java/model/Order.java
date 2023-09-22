/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author tuant
 */
public class Order {

    private int id;
    private Account customer;
    private List<Item> items;
    private int status;
    
    public Order() {
    }
    
    public Order(int id, Account customer, List<Item> items, int status) {
        this.id = id;
        this.customer = customer;
        this.items = items;
        this.status = status;
    }
    
    public int getId() {
        return id;
    }
    
    public Account getCustomer() {
        return customer;
    }
    
    public List<Item> getItems() {
        return items;
    }
    
    public int getStatus() {
        return status;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public void setCustomer(Account customer) {
        this.customer = customer;
    }
    
    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    public void setStatus(int status) {
        this.status = status;
    }
    
    private Item getItemById(int id) {
        for (Item item : items) {
            if(item.getProduct().getId()==id){
                return item;
            }
        }
        return null;
    }
    
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    
    public double getTotalMoney(){
        double t = 0;
        for (Item item : items) {
            t+=(item.getQuantity()*item.getProduct().getPrice());
        }
        return t;
    }
    
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    
    public void addItem(Item t){
        if(getItemById(t.getProduct().getId())!=null){
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }else{
            items.add(t);
        }
    }
    
}
