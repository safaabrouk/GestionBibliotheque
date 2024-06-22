<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="models.Categorie"%>
<%@page import="dao.connexion"%>
<%@page import="dao.DaoCategorie"%>
<%@page import="services.ServiceCategorie"%>


<%ServiceCategorie service = new ServiceCategorie();
List<Categorie> Categories = service.ConsulterCategories();
%>

<div class="super_container">	
	<!-- Home -->

	<div class="home">
		<div class="home_background" style="background-image: url(./Ressources/images/Application/index_background.jpg);"></div>
		<div class="home_content">
			<div class="container">
				<div class="row">
					<div class="col text-center">
						<h1 class="home_title">Lire ... c'est réver les yeux ouverts!</h1>
						<div class="home_button trans_200"><a href="<%=request.getContextPath()+"/inscription"%>">Commencer</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Courses -->

	<div class="courses">
		<div class="courses_background"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<h2 class="section_title text-center titre">Catégories</h2>
				</div>
			</div>
			
			<div class="row courses_row">
						<%for(int i=0; i<Categories.size(); i++){ %>

				<!-- Course -->
				<div class="col-lg-4 course_col">
					<div class="course">
						<div class="course_image"><img src="./Ressources/images/categorie/<%= Categories.get(i).getUrl_couverture() %>" alt=""></div>
						<div class="course_body">
							<div class="course_title"><a href=<%=request.getContextPath()+"/livres"%>><%= Categories.get(i).getNom_categorie() %></a></div>
							
							<div class="course_text">
								<p><%= Categories.get(i).getDescription_categorie() %></p>
							</div>
						</div>
						<div class="course_footer d-flex flex-row align-items-center justify-content-start">
							<div class="course_students"><i class="fa fa-book" aria-hidden="true"></i><i class="fa fa-book" aria-hidden="true"></i><i class="fa fa-book" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>

				<!-- Course -->
				<% }%>

			</div>
		</div>
	</div>

	<!-- Instructors -->

	<div class="instructors">
		<div class="instructors_background" style="background-image:url(./Ressources/images/Application/instructors_background.png)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<h2 class="section_title text-center titre">Nos bibliothécaires</h2>
				</div>
			</div>
			<div class="row instructors_row">

				<!-- Instructor -->
				<div class="col-lg-4 instructor_col">
					<div class="instructor text-center">
						<div class="instructor_image_container">
							<div class="instructor_image"><img src="./Ressources/images/menbre/abdulah.png" alt=""></div>
						</div>
						<div class="instructor_name"><a href="instructors.html">Abdulah</a></div>
						<div class="instructor_title">Bibliothécaire</div>
						<div class="instructor_social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Instructor -->
				<div class="col-lg-4 instructor_col">
					<div class="instructor text-center">
						<div class="instructor_image_container">
							<div class="instructor_image"><img src="./Ressources/images/menbre/saad.jpg" alt=""></div>
						</div>
						<div class="instructor_name"><a href="instructors.html">Saad</a></div>
						<div class="instructor_title">Bibliothécaire</div>
						<div class="instructor_social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Instructor -->
				<div class="col-lg-4 instructor_col">
					<div class="instructor text-center">
						<div class="instructor_image_container">
							<div class="instructor_image"><img src="./Ressources/images/menbre/mouad.png" alt=""></div>
						</div>
						<div class="instructor_name"><a href="instructors.html">Mouad</a></div>
						<div class="instructor_title">Bibliothécaire</div>
						<div class="instructor_social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Register -->

	<div class="register">
		<div class="container">
			<div class="row dessous">
				
				<!-- Register Form -->

				<div class="col-lg-6">
					<div class="register_form_container">
						<div class="register_form_title">Service</div>
						<div class="register_timer_text">
							<p>Notre bibliothéque est à votre service toute la semaine n'hésitez d'y accéder pour réservez , empruntez ou visualisez nos livres.</p>
						</div>
						<div class="timer_container">
							<ul class="timer_list">
								<li><div id="day" class="timer_num">00</div><div class="timer_ss">jours</div></li>
								<li><div id="hour" class="timer_num">00</div><div class="timer_ss">heurs</div></li>
								<li><div id="minute" class="timer_num">00</div><div class="timer_ss">minutes</div></li>
								<li><div id="second" class="timer_num">00</div><div class="timer_ss">secondes</div></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Register Timer -->

				<div class="col-lg-6">
					<div class="register_timer_container">
						<div class="blog_left">
						<div class="blog_title">Les plus célébres catégories</div>

						<div class="blog_categories">
							<div class="row categories_row">

								<!-- Category -->
								<div class="col-md-4 blog_category_col">
									<a>
										<div class="blog_category">
											<div class="blog_category_image"><img src="./Ressources/images/categorie/inf.PNG" alt=""></div>
											<div class="blog_category_title">Informatique</div>
										</div>
									</a>
								</div>

								<!-- Category -->
								<div class="col-md-4 blog_category_col">
									<a >
										<div class="blog_category">
											<div class="blog_category_image"><img src="./Ressources/images/categorie/M.PNG" alt=""></div>
											<div class="blog_category_title">Mathematique</div>
										</div>
									</a>
								</div>

								<!-- Category -->
								<div class="col-md-4 blog_category_col">
									<a>
										<div class="blog_category">
											<div class="blog_category_image"><img src="./Ressources/images/categorie/P.jpg" alt=""></div>
											<div class="blog_category_title">Physique</div>
										</div>
									</a>
								</div>

								

							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</div>