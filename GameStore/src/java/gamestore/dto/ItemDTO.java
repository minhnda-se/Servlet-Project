/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.dto;

/**
 *
 * @author Anh Minh
 */
public class ItemDTO {
    private GameDTO game;
    private int quantity;

    public ItemDTO() {
    }

    public ItemDTO(GameDTO game, int quantity) {
        this.game = game;
        this.quantity = quantity;
    }

    public GameDTO getGame() {
        return game;
    }

    public void setGame(GameDTO game) {
        this.game = game;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public float getSubPrice(){
        return Float.parseFloat(String.format("%.2f", quantity * game.getPrice()));
    }
}
