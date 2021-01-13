package com.project.shop.cart.service;

import java.util.List;
import java.util.Map;

import com.project.shop.cart.CartVO;

public interface CartService {
 public boolean findCartProduct(CartVO cartVO) throws Exception;
 public boolean findCartProducts(CartVO cartVO) throws Exception;
 public void addProductInCart(CartVO cartVO) throws Exception;
 public Map<String, List> myCartList(CartVO cartVO) throws Exception;
 public void plusQuantity(CartVO cartVO) throws Exception;
 public void minusQuantity(CartVO cartVO) throws Exception;
 public void deleteProductInCart(CartVO cartVO) throws Exception;
 public void deleteAllProduct(CartVO cartVO) throws Exception;
 public String cartChkCount(CartVO cartVO) throws Exception;
}
