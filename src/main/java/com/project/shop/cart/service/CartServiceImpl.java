package com.project.shop.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.cart.CartVO;
import com.project.shop.cart.dao.CartDAO;
import com.project.shop.product.ProductVO;

@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public boolean findCartProducts(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCarts(cartVO);
	}
	
	@Override
	public boolean findCartProduct(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);
	}
	
	@Override
	public void addProductInCart(CartVO cartVO) throws Exception {
		cartDAO.insertProductInCart(cartVO);
	}
	
	@Override
	public Map<String, List> myCartList(CartVO cartVO) throws Exception {
		Map<String,List> cartMap = new HashMap<String,List>();
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		if(myCartList.size()==0) {
			return null;
		}
			
		List<ProductVO> myProductList=cartDAO.selectProductList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myProductList", myProductList);
		return cartMap;
	}
	@Override
	public void plusQuantity(CartVO cartVO) throws Exception {
		cartDAO.plusQuantity(cartVO);
	}

	@Override
	public void minusQuantity(CartVO cartVO) throws Exception {
		cartDAO.minusQuantity(cartVO);
	}

	@Override
	public void deleteProductInCart(CartVO cartVO) throws Exception {
		cartDAO.deleteProductInCart(cartVO);
	}

	@Override
	public void deleteAllProduct(CartVO cartVO) throws Exception {
		cartDAO.deleteAllProduct(cartVO);
	}

	@Override
	public String cartChkCount(CartVO cartVO) throws Exception {
		return cartDAO.cartChkCount(cartVO);
	}


}
