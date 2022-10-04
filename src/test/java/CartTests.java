package com.example.festlook;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.example.festlook.models.Item;
import com.example.festlook.repos.CartRepo;

@DataJpaTest
@AutoConfigureTestDatabase (replace = Replace.NONE)
@Rollback(false)
public class CartTests {

	@Autowired
	private CartRepo cartRepo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	
//	@Test
//	public void testAddOneCartItem () {
//		entityManager.find(Item.class, primaryKey);
//	}
}
