/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.dto;

/**
 *
 * @author huusa
 */
public class GameDTO {
    private int gameId;
    private String name;
    private String platform;
    private String publisher;
    private int publication_year;
    private String category;
    private float price;
    private int stock;
    private String description;
    private String image_game;

    public GameDTO() {
    }

    public GameDTO(int gameId, String name, String platform, String publisher, int publication_year, String category, float price, int stock, String description, String image_game) {
        this.gameId = gameId;
        this.name = name;
        this.platform = platform;
        this.publisher = publisher;
        this.publication_year = publication_year;
        this.category = category;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.image_game = image_game;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPublication_year() {
        return publication_year;
    }

    public void setPublication_year(int publication_year) {
        this.publication_year = publication_year;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String text) {
        this.description = text;
    }

    public String getImage_game() {
        return image_game;
    }

    public void setImage_game(String image_game) {
        this.image_game = image_game;
    }
    
    public String getSubString(){
        String subString = "";
        if (this.description != null) subString = this.description.substring(0,description.length()/2);
        return subString;
    }
}
