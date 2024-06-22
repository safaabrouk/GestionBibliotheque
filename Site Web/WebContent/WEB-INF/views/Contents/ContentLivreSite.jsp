<%@page import="java.util.List"%>
<%@page import="models.Categorie"%>
<%@page import="dao.connexion"%>
<%@page import="dao.DaoCategorie"%>
<%@page import="services.ServiceCategorie"%>
<%
List<Categorie> Categories = ServiceCategorie.ConsulterCategories();
%>


<div class="super_container">
	
	<!-- Home -->

	<div class="home">
		
	</div>

	<!-- Blog -->

	<div class="blog">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="welcome_title">Bienvenue dans notre site web !</div>
				</div>
			</div>
			<div class="row categories_row">

				<!-- Category -->
				<div class="col-xl-2 col-lg-4 col-md-6 blog_category_col">
					<a >
						<div class="blog_category">
							<div class="blog_category_image"><img src="./Ressources/images/categorie/informatic.PNG" alt=""></div>
							<div class="blog_category_title">Informatique</div>
						</div>
					</a>
				</div>

				<!-- Category -->
				<div class="col-xl-2 col-lg-4 col-md-6 blog_category_col">
					<a >
						<div class="blog_category">
							<div class="blog_category_image"><img src="./Ressources/images/categorie/M.jpg" alt=""></div>
							<div class="blog_category_title">Mathematique</div>
						</div>
					</a>
				</div>

				<!-- Category -->
				<div class="col-xl-2 col-lg-4 col-md-6 blog_category_col">
					<a >
						<div class="blog_category">
							<div class="blog_category_image"><img src="./Ressources/images/categorie/physi.jpg" alt=""></div>
							<div class="blog_category_title">Physique</div>
						</div>
					</a>
				</div>

				<!-- Category -->
				<div class="col-xl-2 col-lg-4 col-md-6 blog_category_col">
					<a >
						<div class="blog_category">
							<div class="blog_category_image"><img src="./Ressources/images/categorie/chimi.PNG" alt=""></div>
							<div class="blog_category_title">Chimie</div>
						</div>
					</a>
				</div>

				<!-- Category -->
				<div class="col-xl-2 col-lg-4 col-md-6 blog_category_col">
					<a >
						<div class="blog_category">
							<div class="blog_category_image"><img src="./Ressources/images/categorie/bi.PNG" alt=""></div>
							<div class="blog_category_title">Biologie</div>
						</div>
					</a>
				</div>

				<!-- Category -->
				<div class="col-xl-2 col-lg-4 col-md-6 blog_category_col">
					<a >
						<div class="blog_category">
							<div class="blog_category_image"><img src="./Ressources/images/categorie/fr.PNG" alt=""></div>
							<div class="blog_category_title">Litterature Francaise</div>
						</div>
					</a>
				</div>
			</div>
			<%for(int i=0; i<Categories.size(); i++){ %>

			<!-- Blog Posts -->
			<div class="row blog_row">

				<!-- Blog Post info -->
                  <div class="container-fluid">
                   <br><br>
                           <div class="row CCategorie" >
                                   <div>
                                      <span > <%= Categories.get(i).getNom_categorie() %> </span> 
                                      
                                   </div>
                             
                           </div>
                           <br><br>
                   </div>
                          					<%for(int j=0; j<Categories.get(i).getLivres().size(); j++){ %>
                          
                          
				<div class="col-lg-3 cop ">
					<br>
					<div class="blog_post">
						<div class="blog_image" style="background-image:url(./Ressources/images/CouvertureLivre/<%= Categories.get(i).getLivres().get(j).getUrl_couverture() %>)"></div>
						<div class="blog_title_container">
							<div class="blog_post_title titre"><a><%= Categories.get(i).getLivres().get(j).getTitre() %></a></div>
							<br>
							<div class="blog_post_text">
								<p> <%= Categories.get(i).getLivres().get(j).getDescription_livre() %></p>
							</div>
						</div>
					</div>
				</div>
				
									<% }%>
				
	

				<!-- Blog Post math -->
				

   


			</div>
					<% }%>
			
		</div>
	</div>
</div>