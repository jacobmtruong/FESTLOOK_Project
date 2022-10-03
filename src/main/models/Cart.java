package com.example.festlook.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "carts")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	
	@Column(updatable = false)
	@OneToMany(mappedBy = "cart", fetch = FetchType.LAZY)
	private List<Item> itemInCart;
	
	

	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;

	public Cart () {}
	
	
	

	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public List<Item> getItemInCart() {
		return itemInCart;
	}

	public void setItemInCart(List<Item> itemInCart) {
		this.itemInCart = itemInCart;
	}
}
