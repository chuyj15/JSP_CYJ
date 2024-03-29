<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%> 
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<%       
	request.setCharacterEncoding("UTF-8");
 
	// [NEW] - 파일 업로드 추가 
	String path = "C:\\CYJ\\upload";
	
	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax(10*1000*1000); 		// 10MB - 파일 최대 크기
	upload.setSizeThreshold( 4 * 1024 );	// 4MB	- 메모리상의 최대 크기
	upload.setRepositoryPath(path);			// 임시 저장 경로
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Product product = new Product();
	String file = "";
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		// FileItem
		// .getFieldName()		: 요청 파라미터 이름 - productId
		// .getString()			: 요청 파라미터 값   - P1001
		
		String value = item.getString("utf-8");			// P1001
		// 일반 데이터
		if( item.isFormField() ) {
			switch(item.getFieldName()) {
				case "productId" 		: product.setProductId( value );  break;
				case "name" 			: product.setName( value );  break;
				case "unitPrice" 		: product.setUnitPrice(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
				case "description" 		: product.setDescription( value );  break;
				case "manufacturer" 	: product.setManufacturer( value );  break;
				case "category" 		: product.setCategory( value );  break;
				case "unitsInStock" 	: product.setUnitsInStock( value.isEmpty() ? 0 : Integer.parseInt(value) );  break;
				case "condition" 		: product.setCondition( value );  break;
			}
		}
		// 파일 데이터
		else {
			String fileName = item.getName();
			
			if( item == null || fileName == null || fileName == "" ) continue;	// 이미지 없이 업로드한 경우 null 체크
			File fileObj = new File(path + "/" + fileName);
			item.write(fileObj);			// 파일 저장
			file = fileObj.getPath();		
			product.setFile(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
		}
	}

// 	String productId = request.getParameter("productId");
// 	String name = request.getParameter("name");
// 	String unitPrice = request.getParameter("unitPrice");
// 	String description = request.getParameter("description");
// 	String manufacturer = request.getParameter("manufacturer");
// 	String category = request.getParameter("category");
// 	String unitsInStock = request.getParameter("unitsInStock");
// 	String condition = request.getParameter("condition");
	
// 	// 가격, 재고 수는 int, long 타입으로 변환
// 	Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
// 	long stock = unitsInStock.isEmpty() ? 0 : Long.parseLong(unitsInStock);
	
// 	Product product = new Product();
// 	product.setProductId(productId);
// 	product.setName(name);
// 	product.setUnitPrice(price);
// 	product.setDescription(description);
// 	product.setManufacturer(manufacturer);
// 	product.setCategory(category);
// 	product.setUnitsInStock(stock);
// 	product.setCondition(condition);

	int result = productDAO.insert(product);		// 상품 데이터 등록
	 
	response.sendRedirect("products.jsp");			// 상품 목록으로 이동
%>





