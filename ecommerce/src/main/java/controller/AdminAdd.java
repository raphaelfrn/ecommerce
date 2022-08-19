package controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.IssuerSerialNumRequest;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategorieDao;
import dao.ProduitsDao;
import dao.SlidesDao;
import dao.Sous_categoriesDao;
import model.CategorieM;
import model.ProduitsM;
import model.SlidesM;
import model.Sous_categoriesM;
import model.UtilisateursM;

/**
 * Servlet implementation class AdminAdd
 */
@WebServlet("/adminAdd")
public class AdminAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CategorieDao catDao = new CategorieDao();
	Sous_categoriesDao subCatDao = new Sous_categoriesDao();
	ProduitsDao productDao = new ProduitsDao();
	SlidesDao slidesDao = new SlidesDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("listCategories", catDao.read());
		request.setAttribute("listSubCategories", subCatDao.read());
		
	
		//Update Slide
			
		if (request.getParameter("updateSlide") != null) {
			
			String SlideSelectedUpdate = request.getParameter("SlideSelectedUpdate");
			String updateTitleSlide = request.getParameter("updateTitleSlide");
			String updateSubTitlteSlide = request.getParameter("updateSubTitlteSlide");
			String updateImgVideoSlide = request.getParameter("updateImgVideoSlide");
			String updateUrlSlide = request.getParameter("updateUrlSlide");
			
			boolean SlideUpdateNo=false;
			
			if (SlideSelectedUpdate != "" && updateTitleSlide != "" && updateSubTitlteSlide != "" && updateImgVideoSlide != "" && updateUrlSlide !="") {
				
				int slideSelectedId = Integer.parseInt(request.getParameter("SlideSelectedUpdate"));
				
				SlidesM slide = new SlidesM();
				slide.setTitre(updateTitleSlide);
				slide.setSous_titre(updateSubTitlteSlide);
				slide.setImage(updateImgVideoSlide);
				slide.setUrl(updateUrlSlide);
				request.setAttribute("SlideMsgUpdate", slidesDao.update(slide, slideSelectedId));
				
			} else {
				SlideUpdateNo = true;
			}
			request.setAttribute("SlideUpdateNo", SlideUpdateNo);
		}

		
		// Delete slide
			if (request.getParameter("deleteSlide") != null) {
				String deleteSlideId = request.getParameter("SlideSelectedDelete");
				
				boolean SlidemsgNoDelete=false;
				if (deleteSlideId != ""  ) {
					int selectedSlide = Integer.parseInt(request.getParameter("SlideSelectedDelete"));
					request.setAttribute("SlideMsgDelete", slidesDao.delete(selectedSlide));
				} else {
					SlidemsgNoDelete = true;
				}
				request.setAttribute("SlidemsgNoDelete", SlidemsgNoDelete);
			}
		
			request.setAttribute("listSlides", slidesDao.read());
		
		request.getRequestDispatcher("view/admin/admin-add.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Ajout categorie
		if (request.getParameter("addCat") != null) {
			String titleCat = request.getParameter("addTitleCat");
			String videoCat = request.getParameter("addVideoCat");
			String descriptionCat = request.getParameter("addDescriptionCat");
			String imageCat = request.getParameter("addImgCat");
			
			CategorieM categorie = new CategorieM();
			categorie.setTitre(titleCat);
			categorie.setVideo(videoCat);
			categorie.setDescription(descriptionCat);
			categorie.setImage(imageCat);
			
			boolean CatmsgNo=false;
			if (titleCat != "" && videoCat != "" && descriptionCat != "" && imageCat != "") {
				request.setAttribute("Catmsg", catDao.create(categorie));
			} else {
				CatmsgNo = true;
			}
			request.setAttribute("CatmsgNo", CatmsgNo);
		}
		

		// Ajout sous categorie		
		if (request.getParameter("addSubCat") != null) {
			String catSelectedNull = request.getParameter("catSelected");
			String TitleSubCat = request.getParameter("addTitleSubCat");
			String ImgSubCat = request.getParameter("addImgSubCat");
			String VideoSubCat = request.getParameter("addVideoSubCat");
			boolean SubCatmsgNo=false;

			if(catSelectedNull != "") {
				int catSelected = Integer.parseInt(request.getParameter("catSelected"));

				Sous_categoriesM SubCategorie = new Sous_categoriesM();
				SubCategorie.setId_categorie(new CategorieM(catSelected));
				SubCategorie.setTitre(TitleSubCat);
				SubCategorie.setImage(ImgSubCat);
				SubCategorie.setVideo(VideoSubCat);
				 SubCatmsgNo=false;
				if (TitleSubCat != "" && ImgSubCat != "" && VideoSubCat != "" && catSelectedNull != "") {
					request.setAttribute("SubCatmsg", subCatDao.create(SubCategorie));
				} else {
					SubCatmsgNo = true;
				}
				request.setAttribute("SubCatmsgNo", SubCatmsgNo);
			} else {
				SubCatmsgNo = true;
			}
			request.setAttribute("SubCatmsgNo", SubCatmsgNo);

		}
		
		// Ajout produits	
		if (request.getParameter("addProduct") != null) {
			String subCatSelectedNull = request.getParameter("subCatSelected");
			String titleProd = request.getParameter("addTitleProduct");
			String descriptionProd = request.getParameter("addDescriptionProduct");
			String imgProd = request.getParameter("addImgProduct");
			
			
			boolean prodMsgNo=false;

			if(subCatSelectedNull != "" && titleProd!="" && descriptionProd!="" && imgProd!="" &&
				request.getParameter("addPriceProduct") != "" && request.getParameter("addStockProduct") 
				!="" && request.getParameter("addStockMinProduct") != "" ) {
				
				int subCatSelected = Integer.parseInt(request.getParameter("subCatSelected"));
				int priceProd = Integer.parseInt(request.getParameter("addPriceProduct"));
				int stockProd = Integer.parseInt(request.getParameter("addStockProduct"));
				int stockminProd = Integer.parseInt(request.getParameter("addStockMinProduct"));

				ProduitsM product = new ProduitsM();
				product.setId_sous_categorie(new Sous_categoriesM(subCatSelected));
				product.setTitre(titleProd);
				product.setDescription(descriptionProd);
				product.setPrix(priceProd);
				product.setImage(imgProd);
				product.setStock(stockProd);
				product.setStock_minimum(stockminProd);
				
				request.setAttribute("prodMsg", productDao.create(product));
				
			} else {
				prodMsgNo = true;

			}
			request.setAttribute("prodMsgNo", prodMsgNo);
		}
		
		
		// Ajout slide
		if (request.getParameter("addSlide") != null) {
			String addTitleSlide = request.getParameter("addTitleSlide");
			String addSubTitlteSlide = request.getParameter("addSubTitlteSlide");
			String addImgVideoSlide = request.getParameter("addImgVideoSlide");
			String addUrlSlide = request.getParameter("addUrlSlide");
			
			SlidesM slide = new SlidesM();
			slide.setTitre(addTitleSlide);
			slide.setSous_titre(addSubTitlteSlide);
			slide.setImage(addImgVideoSlide);
			slide.setUrl(addUrlSlide);
			
			boolean SlidemsgNo=false;
			if (addTitleSlide != "" && addSubTitlteSlide != "" && addImgVideoSlide != "" && addUrlSlide != "") {
				request.setAttribute("SlideMsg", slidesDao.create(slide));
			} else {
				SlidemsgNo = true;
			}
			request.setAttribute("SlidemsgNo", SlidemsgNo);
		}
		
		
		doGet(request, response);
	}

}
