<%@page import="java.util.UUID"%>
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

	// 파일 업로드 추가 
	String path = "D:\\cyj\\UPLOAD";
	
	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax(10*1000*1000); 		// 10MB - 파일 최대 크기
	upload.setSizeThreshold( 4 * 1024 );	// 4MB	- 메모리상의 최대 크기
	upload.setRepositoryPath(path);			// 임시 저장 경로
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Product product = new Product();
	String file = "";
	
	
	boolean newFile = false; //새 이미지 파일 업로드 여부
	
	/* 추가 */
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		/* 
		// FileItem  
		//-->일반데이터일 경우에 쓰는 두 메소드
		// .getFieldName()		: 요청 파라미터 이름 - productId
		// .getString()			: 요청 파라미터 값   - P1001
		// 이미지데이터일 경우에 쓰는 한 메소드
		// .getName()            : 파일이름을 가져옴. 
		*/
		
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
			String fileName = item.getName(); //파일이름을 가져옴. 
			if (item==null  || fileName==null || fileName=="") continue;	//이미지 없이 업로드한 경우 null 체크
			
			//업로드파일명 중복 방지
			//실제파일명이 강아지.png면 업로드파일명은 UID_강아지.png로 바뀝니다.
			//날짜시간을 지정해도 좋겠긴 하겠다용.
			fileName = UUID.randomUUID().toString().substring(0,11) + "_" + fileName;
			
			//이미지가 있는 경우엔 이미지를 저장
			File fileObj = new File(path + "/" + fileName); //경로, 이름이 들어있는 파일객체 생성
			item.write(fileObj);			// 파일 저장
			file = fileObj.getPath();	//파일 경로 문자열임	
			product.setFile(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
			//추가	
			newFile = true;	//업로드한 이미지 파일이 있음.
			
			
			
			
		}
	}
	
	
	/* 기존 이미지 삭제 */
	Product oldProduct = productDAO.getProductById( product.getProductId() );
	//새로운 이미지를 업로드 하지 않은 경우엔 기존의 이미지파일이 그대로 가져와줘야 한다. 
	//새로운이미지를 업로드한경우
	if (newFile ){
		//Product oldProduct = productDAO.getProductById( product.getProductId() );
		String oldFilePath = oldProduct.getFile();
		//oldFilePath 가 null인 경우엔 new File(oldFilePath); 이거를 못하나봐 ㅠ퓨ㅠㅠ
		if (oldFilePath ==null){
			oldFilePath ="";
		}
		File oldFile = new File(oldFilePath);
		//파일 존재여부 확인해서  이미지 삭제처리하고있음. 
		if( oldFile.exists() ) {
			// delete()
			// * 하위 경로에 파일이 존재하면 삭제가 되지 않는다.
			if( oldFile.delete() ) {
				System.out.println("파일 삭제 성공!!!");
			}
			else {
				System.err.println("파일 삭제 실패!!!");
			}
		} else {
			System.err.println("파일이 존재하지 않습니다!!!");
		}
	} else {
		//새로운이미지를 업로드하지 않은 경우 (이전이미지파일경로를 세팅해줌. 안그러면 null처리 됨. 위에서 새 product를 생성했기 때문에)
		product.setFile(oldProduct.getFile());
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

	int result = productDAO.update(product);		// 상품 데이터 등록
	
	String productId = product.getProductId();
	if (result >0){
		response.sendRedirect("product.jsp?id="+productId);
		} else {		
		response.sendRedirect("update.jsp?id="+productId);
		}
%>





