package com.project.shop.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.shop.cart.CartVO;
import com.project.shop.product.ProductVO;

public interface CartDAO {
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException;
	public boolean selectCountInCarts(CartVO cartVO) throws DataAccessException;
	public void insertProductInCart(CartVO cartVO) throws DataAccessException;
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;
	public List<ProductVO> selectProductList(List<CartVO> myCartList) throws DataAccessException;
	public void plusQuantity(CartVO cartVO) throws DataAccessException;
	public void minusQuantity(CartVO cartVO) throws DataAccessException;
	public void deleteProductInCart(CartVO cartVO) throws DataAccessException;
	public void deleteAllProduct(CartVO cartVO) throws DataAccessException;
	public String cartChkCount(CartVO cartVO) throws DataAccessException;
}
