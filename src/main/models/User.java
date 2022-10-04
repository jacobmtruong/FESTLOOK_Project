package com.example.festlook.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;


	@NotNull(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;
	
	@NotNull(message = "Username is required!")
	@Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
	private String username;

	@NotNull(message = "Password is required!")
	@Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
	private String password;

	@Transient
	@NotNull(message = "Confirm Password is required!")
	@Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
	private String confirm;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	// ----- RELATIONSHIPS -----
	
	
	@Column(updatable = false)
	@OneToMany(mappedBy = "poster", fetch = FetchType.LAZY)
	private List<Look> looks;
	
	
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private UserInfos userinfos;
	
	
	
	@ManyToMany( fetch = FetchType.LAZY)
	@JoinTable (name = "likes",
				joinColumns = @JoinColumn(name = "user_id"),
				inverseJoinColumns = @JoinColumn (name = "look_id"))
	private List<Look> likes;
	
	
	@Column(updatable = false)
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Item> items;
	
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="cart_id")
	private Cart cart;
	
	// ----- CONSTRUCTOR -----
	

	
	public User() {}
	
	// ----- GETTERS & SETTERS -----

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public UserInfos getUserinfos() {
		return userinfos;
	}

	public void setUserinfos(UserInfos userinfos) {
		this.userinfos = userinfos;
	}

	public List<Look> getLooks() {
		return looks;
	}

	public void setLooks(List<Look> looks) {
		this.looks = looks;
	}

	public List<Look> getLikes() {
		return likes;
	}

	public void setLikes(List<Look> likes) {
		this.likes = likes;
	}
	
	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	

	
}
