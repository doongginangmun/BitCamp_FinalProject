package com.project.shop.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.cart.CartVO;
import com.project.shop.member.MemberVO;
import com.project.shop.product.ProductVO;

@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//�씠誘� 諛붽뎄�땲�뿉 異붽��맂 �긽�뭹�씤吏� 議고쉶
	@Override 
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mappers.cart.selectCountInCart", cartVO);
		return Boolean.parseBoolean(result);
	}
	
	@Override
	public boolean selectCountInCarts(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mappers.cart.selectCountInCarts", cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void insertProductInCart(CartVO cartVO) throws DataAccessException {
		int cart_id=selectMaxCartId();
		cartVO.setCart_id(cart_id);
		if(cartVO.getMember_id()!=null) {
		sqlSession.insert("mappers.cart.insertProductInCart", cartVO);
		}else {
		 sqlSession.insert("mappers.cart.insertProductInCartNon", cartVO);
		}
	}
	private int selectMaxCartId() throws DataAccessException{
		int cart_id =sqlSession.selectOne("mappers.cart.selectMaxCartId");
		return cart_id;
	}

	@Override
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList = (List)sqlSession.selectList("mappers.cart.selectCartList", cartVO);
		return cartList;
	}

	@Override
	public List<ProductVO> selectProductList(List<CartVO> myCartList) throws DataAccessException {
		List<ProductVO> myProductList;
		myProductList = sqlSession.selectList("mappers.cart.selectProductList",myCartList);
		return myProductList;
	}

	@Override
	public void plusQuantity(CartVO cartVO) throws DataAccessException {
		sqlSession.update("mappers.cart.plusQuantity",cartVO);
	}

	@Override
	public void minusQuantity(CartVO cartVO) throws DataAccessException {
		sqlSession.update("mappers.cart.minusQuantity",cartVO);
		
	}

	@Override
	public void deleteProductInCart(CartVO cartVO) throws DataAccessException {
		sqlSession.delete("mappers.cart.deleteProductInCart",cartVO);
	}

	@Override
	public void deleteAllProduct(CartVO cartVO) throws DataAccessException {
		sqlSession.delete("mappers.cart.deleteAllProduct", cartVO);
	}

	@Override
	public String cartChkCount(CartVO cartVO) throws DataAccessException {
		String result = (String)sqlSession.selectOne("mappers.cart.cartChkCount", cartVO);
		return result;
	}

	
	
}
