package com.bookshopweb.beans;

import java.sql.Timestamp;

public class StatisticalProduct {
    private long idProduct;
    private String nameProduct;
//    private Timestamp begin;
//    private Timestamp end;
    private int importQuatity;
    private int sellQuantity;
    private double totalImportPrice;
    private double totalSellPrice;
    private double totalProfit;

    public StatisticalProduct(long idProduct, String nameProduct, int importQuatity,
                              int sellQuantity, double totalImportPrice, double totalSellPrice, double totalProfit) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.importQuatity = importQuatity;
        this.sellQuantity = sellQuantity;
        this.totalImportPrice = totalImportPrice;
        this.totalSellPrice = totalSellPrice;
        this.totalProfit = totalProfit;
    }

    public long getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(long idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getImportQuatity() {
        return importQuatity;
    }

    public void setImportQuatity(int importQuatity) {
        this.importQuatity = importQuatity;
    }

    public int getSellQuantity() {
        return sellQuantity;
    }

    public void setSellQuantity(int sellQuantity) {
        this.sellQuantity = sellQuantity;
    }

    public double getTotalImportPrice() {
        return totalImportPrice;
    }

    public void setTotalImportPrice(double totalImportPrice) {
        this.totalImportPrice = totalImportPrice;
    }

    public double getTotalSellPrice() {
        return totalSellPrice;
    }

    public void setTotalSellPrice(double totalSellPrice) {
        this.totalSellPrice = totalSellPrice;
    }

    public double getTotalProfit() {
        return totalProfit;
    }

    public void setTotalProfit(double totalProfit) {
        this.totalProfit = totalProfit;
    }
}
