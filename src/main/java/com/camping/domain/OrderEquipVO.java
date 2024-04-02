package com.camping.domain;

import lombok.Data;

@Data
public class OrderEquipVO {
    private int order_no;
    private int reserve_no;
    private int equip_no;
    private String equip_name;
    private String order_quantity;
    private int order_price;
}
