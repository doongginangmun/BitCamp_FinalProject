package com.project.shop.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.shop.product.ProductVO;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//아진
	public List<ProductVO> selectProductList(int product_category_num, Map map) throws DataAccessException{
		List<ProductVO> productList= 
				sqlSession.selectList("mappers.product.selectGoodsList",map );
		for(ProductVO vo : productList) {
			vo.setSale_price();
		}
		return productList;
	}
	public String selectProductCategoryName(int product_category_num) {
		String productCategoryName = sqlSession.selectOne("mappers.product.selectProductCategoryName",product_category_num );
		return productCategoryName;
	}
	//product 갯수 조회
	public int getTotalCount(int productCategoryNum) {
		int totalCount = sqlSession.selectOne("mappers.product.totalCount", productCategoryNum);
		return totalCount;
		
	} 
	public ProductVO selectProductDetail(String product_id )throws DataAccessException{
		ProductVO productVO=sqlSession.selectOne("mappers.product.selectProductDetail", product_id);
		productVO.setSale_price();
		return productVO;
	}
	
	public List<ProductVO> selectOption(String product_id) throws DataAccessException{
		List<ProductVO> optionList= sqlSession.selectList("mappers.product.selectOption", product_id);
		return optionList;
	}
	
	//상연
	public List<ProductVO> bestList() {
		return sqlSession.selectList("mappers.product.bestList");
	}
	
	public List<ProductVO> newList() {
		return sqlSession.selectList("mappers.product.newList");
	}
	public List<ProductVO> discountList() {
		return sqlSession.selectList("mappers.product.discountList");
	}
	public int insertProduct (ProductVO vo) {
		sqlSession.insert("mappers.product.insertProduct",vo);
		return sqlSession.insert("mappers.product.insertItem",vo);
	}
	
	public List<ProductVO> allList(){
		return sqlSession.selectList("mappers.product.allList");
	}
	
	public void deleteProduct(String rq) {
		sqlSession.delete("mappers.product.deleteProductOption",rq);
		sqlSession.delete("mappers.product.deleteItem",rq);
		sqlSession.delete("mappers.product.deleteProduct",rq);
	}
	
	public List<ProductVO> loadOne(String rq){
		return sqlSession.selectList("mappers.product.loadOne", rq);
	}
	public void updateOne(ProductVO vo) {
		sqlSession.update("mappers.product.updateItem", vo);
		sqlSession.update("mappers.product.updateItem", vo);
		sqlSession.update("mappers.product.updateProduct", vo);
		
	}
	public List<ProductVO> loadOption(String rq) {
		return sqlSession.selectList("mappers.product.loadOption", rq);
	}
	public void deleteOption(String name) {
		sqlSession.delete("mappers.product.deleteProductOptionName",name);
	}
	public void insertOption(ProductVO vo) {
		sqlSession.insert("mappers.product.insertProductOption",vo);
	}
	public String checkProduct(String id) {
		return sqlSession.selectOne("mappers.product.checkProduct", id);
	}
	public String checkItem(String id) {
		return sqlSession.selectOne("mappers.product.checkItem", id);
	}
	public int getTotalCount() {
		return sqlSession.selectOne("mappers.product.totalList");
	}
	public List<ProductVO> listProduct(Map map) {
		return sqlSession.selectList("mappers.product.listProduct",map );
	}
	public List<ProductVO> searchProductName(Map map) {
		return sqlSession.selectList("mappers.product.searchProductName",map );
	}
	public List<ProductVO> searchProductId(Map map){
		return sqlSession.selectList("mappers.product.searchProductId",map );
	}
	public List<ProductVO> searchItemNum(Map map){
		return sqlSession.selectList("mappers.product.searchItemNum",map );
	}
	public int getSearchCountPN(String word) {
		return sqlSession.selectOne("mappers.product.searchCountProductName",word);
	}
	public int getSearchCountPI(String word) {
		return sqlSession.selectOne("mappers.product.searchCountProductId",word);
	}
	public int getSearchCountIN(String word) {
		return sqlSession.selectOne("mappers.product.searchCountItemNum",word);
	}
}
