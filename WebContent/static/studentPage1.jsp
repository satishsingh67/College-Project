<%@page import="com.college.model.Student" %>
<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.dao.studentDao.MapStudentSubjectDao" %>
<%@page import="com.college.dao.studentDao.StudentLoginValidation" %>

<%
Student student=(Student)session.getAttribute("student");
if(student==null){
	response.sendRedirect("studentLogin.jsp");
	return;
}

Integer courseTypeId=student.getCourseTypeId();
Integer fkDepartmentId=student.getFkdepartment();
Integer fkYearId=student.getYear();
Integer fkSectionId=student.getSection();

//Feedback Link
String feedbackLink=new MapStudentSubjectDao().getLink(courseTypeId, fkDepartmentId, fkYearId, fkSectionId, "feedback");

//SubjectChoice
String subjectChoice=new MapStudentSubjectDao().getLink(courseTypeId, fkDepartmentId, fkYearId, fkSectionId, "subjectChoice");

String studentImage=new StudentLoginValidation().fetchStudentPhoto(student.getPkRegistrationId());


//Syllabus Link
String syllabus=new MapStudentSubjectDao().getLink(courseTypeId, fkDepartmentId, fkYearId, fkSectionId, "syllabus");

//Routine
String routine=new MapStudentSubjectDao().getLink(courseTypeId, fkDepartmentId, fkYearId, fkSectionId, "routine");



%>
    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
      
        <!--=============== REMIXICONS ===============-->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        
        <!--=============== SWIPER CSS ===============-->
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">

        
<style>
    /*=============== GOOGLE FONTS ===============*/
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@500;600;700&display=swap");

/*=============== VARIABLES CSS ===============*/
:root {
  --header-height: 3rem;

  /*========== Colors ==========*/
  /* Change favorite color to match images */
  /*Green dark 190 - Green 171 - Grren Blue 200*/
  --hue-color: 190;

  /* HSL color mode */
  --first-color: hsl(var(--hue-color), 64%, 22%);
  --first-color-second: hsl(var(--hue-color), 64%, 22%);
  --first-color-alt: hsl(var(--hue-color), 64%, 15%);
  --title-color: hsl(var(--hue-color), 64%, 18%);
  --text-color: hsl(var(--hue-color), 24%, 35%);
  --text-color-light: hsl(var(--hue-color), 8%, 60%);
  --input-color: hsl(var(--hue-color), 24%, 97%);
  --body-color: hsl(var(--hue-color), 100%, 99%);
  --white-color: #FFF;
  --scroll-bar-color: hsl(var(--hue-color), 12%, 90%);
  --scroll-thumb-color: hsl(var(--hue-color), 12%, 75%);

  /*========== Font and typography ==========*/
  --body-font: 'Open Sans', sans-serif;
  --title-font: 'Raleway', sans-serif;
  --biggest-font-size: 2.5rem;
  --h1-font-size: 1.5rem;
  --h2-font-size: 1.25rem;
  --h3-font-size: 1rem;
  --normal-font-size: .938rem;
  --small-font-size: .813rem;
  --smaller-font-size: .75rem;

  /*========== Font weight ==========*/
  --font-medium: 500;
  --font-semi-bold: 600;

  /*========== Margenes Bottom ==========*/
  --mb-0-25: .25rem;
  --mb-0-5: .5rem;
  --mb-0-75: .75rem;
  --mb-1: 1rem;
  --mb-1-25: 1.25rem;
  --mb-1-5: 1.5rem;
  --mb-2: 2rem;
  --mb-2-5: 2.5rem;

  /*========== z index ==========*/
  --z-tooltip: 10;
  --z-fixed: 100;

  /*========== Hover overlay ==========*/
  --img-transition: .3s;
  --img-hidden: hidden;
  --img-scale: scale(1.1);
}

@media screen and (min-width: 968px) {
  :root {
    --biggest-font-size: 4rem;
    --h1-font-size: 2.25rem;
    --h2-font-size: 1.75rem;
    --h3-font-size: 1.25rem;
    --normal-font-size: 1rem;
    --small-font-size: .875rem;
    --smaller-font-size: .813rem;
  }
}

/*========== Variables Dark theme ==========*/
body.dark-theme {
  --first-color-second: hsl(var(--hue-color), 54%, 12%);
  --title-color: hsl(var(--hue-color), 24%, 95%);
  --text-color: hsl(var(--hue-color), 8%, 75%);
  --input-color: hsl(var(--hue-color), 29%, 16%);
  --body-color: hsl(var(--hue-color), 29%, 12%);
  --scroll-bar-color: hsl(var(--hue-color), 12%, 48%);
  --scroll-thumb-color: hsl(var(--hue-color), 12%, 36%);
}

/*========== Button Dark/Light ==========*/
.nav__dark {
  display: flex;
  align-items: center;
  column-gap: 2rem;
  position: absolute;
  left: 3rem;
  bottom: 4rem;
}

.change-theme, .change-theme-name {
  color: var(--text-color);
}

.change-theme {
  cursor: pointer;
  font-size: 1rem;
}

.change-theme-name {
  font-size: var(--small-font-size);
}

/*=============== BASE ===============*/
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: var(--header-height) 0 0 0;
  font-family: var(--body-font);
  font-size: var(--normal-font-size);
  background-color: var(--body-color);
  color: var(--text-color);
}

h1, h2, h3 {
  color: var(--title-color);
  font-weight: var(--font-semi-bold);
  font-family: var(--title-font);
}

ul {
  list-style: none;
}

a {
  text-decoration: none;
}

img,
video {
  max-width: 100%;
  height: auto;
}

button,
input {
  border: none;
  font-family: var(--body-font);
  font-size: var(--normal-font-size);
}

button {
  cursor: pointer;
}

input {
  outline: none;
}

.main {
  overflow-x: hidden;
}

/*=============== REUSABLE CSS CLASSES ===============*/
.section {
  padding: 4.5rem 0 2.5rem;
}

.section__title {
  font-size: var(--h2-font-size);
  color: var(--title-color);
  text-align: center;
  text-transform: capitalize;
  margin-bottom: var(--mb-2);
}

.container {
  max-width: 968px;
  margin-left: var(--mb-1);
  margin-right: var(--mb-1);
}

.grid {
  display: grid;
  gap: 1.5rem;
}

/*=============== HEADER ===============*/
.header {
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: var(--z-fixed);
  background-color: transparent;
}

/*=============== NAV ===============*/
.nav {
  height: var(--header-height);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav__logo, .nav__toggle {
  color: var(--white-color);
}

.nav__logo {
  font-weight: var(--font-semi-bold);
}

.nav__toggle {
  font-size: 1.1rem;
  cursor: pointer;
}

.nav__menu {
  position: relative;
}

@media screen and (max-width: 767px) {
  .nav__menu {
    position: fixed;
    background-color: var(--body-color);
    top: 0;
    right: -100%;
    width: 90%;
    height: 100%;
    box-shadow: -1px 0 4px rgba(14, 55, 63, 0.15);
    padding: 3rem;
    transition: .4s;
  }
}

.nav__list {
  display: flex;
  flex-direction: column;
  row-gap: 1.1rem;
}

.nav__link {
  color: var(--text-color-light);
  font-weight: var(--font-semi-bold);
  text-transform: uppercase;
}

.nav__link:hover {
  color: var(--text-color);
}

.nav__close {
  position: absolute;
  top: .75rem;
  right: 1rem;
  font-size: 1.5rem;
  color: var(--title-color);
  cursor: pointer;
}

/* show menu */
.show-menu {
  right: 0;
}

/* Change background header */
.scroll-header {
  background-color: var(--body-color);
  box-shadow: 0 0 4px rgba(14, 55, 63, 0.15);
}

.scroll-header .nav__logo,
.scroll-header .nav__toggle {
  color: var(--title-color);
}

/* Active link */
.active-link {
  position: relative;
  color: var(--title-color);
}

.active-link::before {
  content: '';
  position: absolute;
  background-color: var(--title-color);
  width: 100%;
  height: 2px;
  bottom: -.75rem;
  left: 0;
}

/*=============== HOME ===============*/
.home__img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  object-fit: cover;
  object-position: 83%;
}

.home__container {
  position: relative;
  height: calc(100vh - var(--header-height));
  align-content: center;
  row-gap: 3rem;
}

.home__data-subtitle, 
.home__data-title, 
.home__social-link, 
.home__info {
  color: var(--white-color);
}

.home__data-subtitle {
  display: block;
  font-weight: var(--font-semi-bold);
  margin-bottom: var(--mb-0-75);
}

.home__data-title {
  font-size: var(--biggest-font-size);
  font-weight: var(--font-medium);
  margin-bottom: var(--mb-2-5);
}

.home__social {
  display: flex;
  flex-direction: column;
  row-gap: 1.5rem;
}

.home__social-link {
  font-size: 1.2rem;
  width: max-content;
}

.home__info {
  background-color: var(--first-color);
  display: flex;
  padding: 1.5rem 1rem;
  align-items: center;
  column-gap: .5rem;
  position: absolute;
  right: 0;
  bottom: 1rem;
  width: 228px;
}

.home__info-title {
  display: block;
  font-size: var(--small-font-size);
  font-weight: var(--font-semi-bold);
  margin-bottom: var(--mb-0-75);
}

.home__info-button {
  font-size: var(--smaller-font-size);
}

.home__info-overlay {
  overflow: var(--img-hidden);
}

.home__info-img {
  width: 145px;
  transition: var(--img-transition);
}

.home__info-img:hover {
  transform: var(--img-scale);
}

/*=============== BUTTONS ===============*/
.button {
  display: inline-block;
  background-color: var(--first-color);
  color: var(--white-color);
  padding: 1rem 2rem;
  font-weight: var(--font-semi-bold);
  transition: .3s;
}

.button:hover {
  background-color: var(--first-color-alt);
}

.button--flex {
  display: flex;
  align-items: center;
  column-gap: .25rem;
}

.button--link {
  background: none;
  padding: 0;
}

.button--link:hover {
  background: none;
}

/*=============== ABOUT ===============*/
.about__data {
  text-align: center;
}

.about__container {
  row-gap: 2.5rem;
}

.about__description {
  margin-bottom: var(--mb-2);
}

.about__img {
  display: flex;
  column-gap: 1rem;
  align-items: center;
  justify-content: center;
}

.about__img-overlay {
  overflow: var(--img-hidden);
}

.about__img-one {
  width: 130px;
}

.about__img-two {
  width: 180px;
}

.about__img-one, 
.about__img-two {
  transition: var(--img-transition);
}

.about__img-one:hover, 
.about__img-two:hover {
  transform: var(--img-scale);
}

/*=============== DISCOVER ===============*/
.discover__card {
  position: relative;
  width: 200px;
  overflow: var(--img-hidden);
}

.discover__data {
  position: absolute;
  bottom: 1.5rem;
  left: 1rem;
}

.discover__title, 
.discover__description {
  color: var(--white-color);
}

.discover__title {
  font-size: var(--h3-font-size);
  margin-bottom: var(--mb-0-25);
}

.discover__description {
  display: block;
  font-size: var(--smaller-font-size);
}

.discover__img {
  transition: var(--img-transition);
}

.discover__img:hover {
  transform: var(--img-scale);
}

.swiper-container-3d .swiper-slide-shadow-left,
.swiper-container-3d .swiper-slide-shadow-right {
  background-image: none;
}

/*=============== EXPERIENCE ===============*/
.experience__container {
  row-gap: 2.5rem;
  justify-content: center;
  justify-items: center;
}

.experience__content {
  grid-template-columns: repeat(3, 1fr);
  column-gap: 1rem;
  justify-items: center;
  padding: 0 2rem;
}

.experience__number {
  font-size: var(--h2-font-size);
  font-weight: var(--font-semi-bold);
  margin-bottom: var(--mb-0-5);
}

.experience__description {
  font-size: var(--small-font-size);
}

.experience__img {
  position: relative;
  padding-bottom: 2rem;
}

.experience__img-one, 
.experience__img-two {
  transition: var(--img-transition);
}

.experience__img-one:hover, 
.experience__img-two:hover {
  transform: var(--img-scale);
}

.experience__overlay {
  overflow: var(--img-hidden);
}

.experience__overlay:nth-child(1) {
  width: 263px;
  margin-right: 2rem;
}

.experience__overlay:nth-child(2) {
  width: 120px;
  position: absolute;
  top: 2rem;
  right: 0;
}

/*=============== VIDEO ===============*/
.video__container {
  padding-bottom: 1rem;
}

.video__description {
  text-align: center;
  margin-bottom: var(--mb-2-5);
}

.video__content {
  position: relative;
}

.video__button {
  position: absolute;
  right: 1rem;
  bottom: -1rem;
  padding: 1rem 1.5rem;
}

.video__button-icon {
  font-size: 1.2rem;
}

/*=============== PLACES ===============*/
.place__card, .place__img {
  height: 230px;
}

.place__container {
  grid-template-columns: repeat(2, max-content);
  justify-content: center;
}

.place__card {
  position: relative;
  overflow: var(--img-hidden);
}

.place__card:hover .place__img {
  transform: var(--img-scale);
}

.place__img {
  transition: var(--img-transition);
}

.place__content, .place__title {
  color: var(--white-color);
}

.place__content {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: .75rem .75rem 1rem;
}

.place__rating {
  align-self: flex-end;
  display: flex;
  align-items: center;
}

.place__rating-icon {
  font-size: .75rem;
  margin-right: var(--mb-0-25);
}

.place__rating-number {
  font-size: var(--small-font-size);
}

.place__subtitle, .place__price {
  display: block;
}

.place__title {
  font-size: var(--h3-font-size);
  margin-bottom: var(--mb-0-25);
}

.place__subtitle {
  font-size: var(--smaller-font-size);
  margin-bottom: var(--mb-1-25);
}

.place__button {
  position: absolute;
  right: 0;
  bottom: 0;
  padding: .75rem 1rem;
}

/*=============== SUBSCRIBE ===============*/
.subscribe__bg {
  background-color: var(--first-color-second);
  padding: 2.5rem 0;
}

.subscribe__title, 
.subscribe__description {
  color: var(--white-color);
}

.subscribe__description {
  text-align: center;
  margin-bottom: var(--mb-2-5);
}

.subscribe__form {
  background-color: var(--input-color);
  padding: .5rem;
  display: flex;
  justify-content: space-between;
}

.subscribe__input {
  width: 70%;
  padding-right: .5rem;
  background-color: var(--input-color);
  color: var(--text-color);
}

.subscribe__input::placeholder {
  color: var(--text-color);
}

/*=============== SPONSORS ===============*/
.sponsor__container {
  grid-template-columns: repeat(auto-fit, minmax(110px, 1fr));
  justify-items: center;
  row-gap: 3.5rem;
}

.sponsor__content:hover .sponsor__img {
  filter: invert(0.5);
}

.sponsor__img {
  width: 90px;
  filter: invert(0.7);
  transition: var(--img-transition);
}

/*=============== FOOTER ===============*/
.footer__container {
  row-gap: 5rem;
}

.footer__content {
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  row-gap: 2rem;
}

.footer__title, 
.footer__subtitle {
  font-size: var(--h3-font-size);
}

.footer__title {
  margin-bottom: var(--mb-0-5);
}

.footer__description {
  margin-bottom: var(--mb-2);
}

.footer__social {
  font-size: 1.25rem;
  color: var(--title-color);
  margin-right: var(--mb-1-25);
}

.footer__subtitle {
  margin-bottom: var(--mb-1);
}

.footer__item {
  margin-bottom: var(--mb-0-75);
}

.footer__link {
  color: var(--text-color);
}

.footer__link:hover {
  color: var(--title-color);
}

.footer__rights {
  display: flex;
  flex-direction: column;
  row-gap: 1.5rem;
  text-align: center;
}

.footer__copy, .footer__terms-link {
  font-size: var(--small-font-size);
  color: var(--text-color-light);
}

.footer__terms {
  display: flex;
  column-gap: 1.5rem;
  justify-content: center;
}

.footer__terms-link:hover {
  color: var(--text-color);
}

/*========== SCROLL UP ==========*/
.scrollup {
  position: fixed;
  right: 1rem;
  bottom: -20%;
  background-color: var(--first-color);
  padding: .5rem;
  display: flex;
  opacity: .9;
  z-index: var(--z-tooltip);
  transition: .4s;
}

.scrollup:hover {
  background-color: var(--first-color-alt);
  opacity: 1;
}

.scrollup__icon {
  color: var(--white-color);
  font-size: 1.2rem;
}

/* Show scroll */
.show-scroll {
  bottom: 5rem;
}

/*=============== SCROLL BAR ===============*/
::-webkit-scrollbar {
  width: .60rem;
  background-color: var(--scroll-bar-color);
}

::-webkit-scrollbar-thumb {
  background-color: var(--scroll-thumb-color);
}

::-webkit-scrollbar-thumb:hover {
  background-color: var(--text-color-light);
}

/*=============== MEDIA QUERIES ===============*/
/* For small devices */
@media screen and (max-width: 340px) {
  .place__container {
    grid-template-columns: max-content;
    justify-content: center;
  }
  .experience__content {
    padding: 0;
  }
  .experience__overlay:nth-child(1) {
    width: 190px;
  }
  .experience__overlay:nth-child(2) {
    width: 80px;
  }
  .home__info {
    width: 190px;
    padding: 1rem;
  }
  .experience__img,
  .video__container {
    padding: 0;
  }
}

/* For medium devices */
@media screen and (min-width: 568px) {
  .video__container {
    display: grid;
    grid-template-columns: .6fr;
    justify-content: center;
  }
  .place__container {
    grid-template-columns: repeat(3, max-content);
  }
  .subscribe__form {
    width: 470px;
    margin: 0 auto;
  }
}

@media screen and (min-width: 768px) {
  body {
    margin: 0;
  }
  .nav {
    height: calc(var(--header-height) + 1.5rem);
  }
  .nav__link {
    color: var(--white-color);
    text-transform: initial;
  }
  .nav__link:hover {
    color: var(--white-color);
  }
  .nav__dark {
    position: initial;
  }
  .nav__menu {
    display: flex;
    column-gap: 1rem;
  }
  .nav__list {
    flex-direction: row;
    column-gap: 4rem;
  }
  .nav__toggle, .nav__close {
    display: none;
  }
  .change-theme-name {
    display: none;
  }
  .change-theme {
    color: var(--white-color);
  }
  .active-link::before {
    background-color: var(--white-color);
  }
  .scroll-header .nav__link {
    color: var(--text-color);
  }
  .scroll-header .active-link {
    color: var(--title-color);
  }
  .scroll-header .active-link::before {
    background-color: var(--title-color);
  }
  .scroll-header .change-theme {
    color: var(--text-color);
  }
  .section {
    padding: 7rem 0 2rem;
  }
  .home__container {
    height: 100vh;
    grid-template-rows: 1.8fr .5fr;
  }
  .home__data {
    align-self: flex-end;
  }
  .home__social {
    flex-direction: row;
    align-self: flex-end;
    margin-bottom: 3rem;
    column-gap: 2.5rem;
  }
  .home__info {
    bottom: 3rem;
  }
  .about__container {
    grid-template-columns: repeat(2, 1fr);
    align-items: center;
  }
  .about__data, .about__title {
    text-align: initial;
  }
  .about__title {
    margin-bottom: var(--mb-1-5);
  }
  .about__description {
    margin-bottom: var(--mb-2);
  }
  .discover__container {
    width: 610px;
    margin-left: auto;
    margin-right: auto;
  }
  .discover__container,
  .place__container {
    padding-top: 2rem;
  }
  .experience__overlay:nth-child(1) {
    width: 363px;
    margin-right: 4rem;
  }
  .experience__overlay:nth-child(2) {
    width: 160px;
  }
  .subscribe__bg {
    background: none;
    padding: 0;
  }
  .subscribe__container {
    background-color: var(--first-color-second);
    padding: 3.5rem 0;
  }
  .subscribe__input {
    padding: 0 .5rem;
  }
  .footer__rights {
    flex-direction: row;
    justify-content: space-between;
  }
}

/* For large devices */
@media screen and (min-width: 1024px) {
  .container {
    margin-left: auto;
    margin-right: auto;
  }
  .home__container {
    grid-template-rows: 2fr .5fr;
  }
  .home__info {
    width: 328px;
    grid-template-columns: 1fr 2fr;
    column-gap: 2rem;
  }
  .home__info-title {
    font-size: var(--normal-font-size);
  }
  .home__info-img {
    width: 240px;
  }
  .about__img-one {
    width: 230px;
  }
  .about__img-two {
    width: 290px;
  }
  .discover__card {
    width: 237px;
  }
  .discover__container {
    width: 700px;
  }
  .discover__data {
    left: 1.5rem;
    bottom: 2rem;
  }
  .discover__title {
    font-size: var(--h2-font-size);
  }
  .experience__content {
    margin: var(--mb-1) 0;
    column-gap: 3.5rem;
  }
  .experience__overlay:nth-child(1) {
    width: 463px;
    margin-right: 7rem;
  }
  .experience__overlay:nth-child(2) {
    width: 220px;
    top: 3rem;
  }
  .video__container {
    grid-template-columns: .7fr;
  }
  .video__description {
    padding: 0 8rem;
  }
  .place__container {
    gap: 3rem 2rem;
  }
  .place__card, .place__img {
    height: 263px;
  }
  .footer__content {
    justify-items: center;
  }
}

@media screen and (min-width: 1200px) {
  .container {
    max-width: 1024px;
  }
}

/* For tall screens on mobiles y desktop*/
@media screen and (min-height: 721px) {
  body {
    margin: 0;
  }
  .home__container, .home__img {
    height: 640px;
  }
}
.products .box-container {
  display: -ms-grid;
  display: grid;
  -ms-grid-columns: (minmax(18rem, 1fr))[auto-fit];
      grid-template-columns: repeat(auto-fit, minmax(18rem, 1fr));
  gap: 1rem;
}

.products .box-container .box {
  border-radius: .5rem;
  text-align: center;
  border: 0.2rem solid #333;
}

.products .box-container .box:hover .image .icons {
  -webkit-transform: translateY(0);
          transform: translateY(0);
}

.products .box-container .box .image {
  border-radius: .5rem;
  overflow: hidden;
  position: relative;
  height: 10rem;
  width: 100%;
}

.products .box-container .box .image .icons {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  border-bottom: 0.2rem solid #333;
  -webkit-transform: translateY(-7rem);
          transform: translateY(-7rem);
}

.products .box-container .box .image .icons a {
  height: 5rem;
  width: 5rem;
  line-height: 5rem;
  font-size: 2rem;
  color: #333;
}

.products .box-container .box .image .icons a:hover {
  background: #333;
  color: #fff;
}

.products .box-container .box .image img {
  height: 100%;
  width: 100%;
  -o-object-fit: cover;
     object-fit: cover;
}

.products .box-container .box .content {
  padding: 1.5rem 0;
}

.products .box-container .box .content h3 {
  font-size: 2rem;
  color: #333;
}

.products .box-container .box .content .stars {
  padding: 1rem 0;
}

.products .box-container .box .content .stars i {
  font-size: 1.4rem;
  color: #e84393;
}

.products .box-container .box .content .price {
  font-size: 2.2rem;
  color: #333;
}

.products .box-container .box .content .price span {
  font-size: 1.5rem;
  text-decoration: line-through;
  color: #666;
}
.sbtn-1{
  
  
}
.drpdwn{
  background-color:rgb(43, 219, 43);
  box-shadow: 5px 5px 5px gray;
  color: white;
  width: 150px;
  font-weight: var(--font-semi-bold);

  transition: .5s;
  position: relative;
  display: inline-block;
  
}
.content{
  display: none;
  position: absolute;
  background-color: rgb(231, 243, 231);
  width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2) ;
  z-index: 1;
}
.content a{
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.content a:hover{
  background-color: cadetblue;
}
.sbtn-1:hover .content{
display: block;
}
.logo {
  width: 350px;
  padding: 30px;
}
.student {
  padding: 30px;
}
.details {
  color: yellow;
  background-color: black;
  height: 30px;
}
.box {
  width: 300px;
  height: 30px;
}

</style>
        <title>Campus Life</title>
    </head>
    <body>
        <header class="header" id="header">
            <nav class="nav container">
               
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="./index.html" class="nav__link active-link">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="#profile" class="nav__link">Profile</a>
                        </li>
                        
                        <li class="nav__item">
                            <a href="./studentClassroom.jsp" target="_self" class="nav__link">Class Room</a>
                        </li>
                        <li class="nav__item">
                        <%
                        if(feedbackLink==null){
                        %>
                          <a href="" style="pointer-events: none" class="nav__link">Feedback</a>
                               <%
                        }else{
                               %>
                         <a href="<%=feedbackLink %>" target="_blank" class="nav__link">Feedback</a>
                            <%
                        }
                            %>   
                               
                               
                               
                      </li>
                      <li class="nav__item">
                       <%
                        if(subjectChoice==null){
                        %>
                        <a href="" style="pointer-events: none" class="nav__link">Choose Subject</a>
                               <%
                        }else{
                               %>
                        <a href="<%=subjectChoice %>" target="_blank" class="nav__link">Choose Subject</a>
                            <%
                        }
                            %>   
                               
                      

                    </li>
                    <li class="nav__item">
                      <a href="https://www.jisgroup.net/erp/Forms/frmStudentLoginGnit.aspx"target="_blank" class="nav__link">Fees Payment</a>

                  </li>
                      
                      <li class="nav__item">
                        <a href="/College_Final_Year_Project/logout?action=student" class="nav__link">Logout</a>

                    </li>

                    </ul>

                    
            </nav>
        </header>

        <main class="main">
            <!--==================== HOME ====================-->
            <section class="home" id="home">
                <img src="./images/gallery/g-5.jpg" alt="" class="home__img">

                <div class="home__container container grid">
                    <div class="home__data">
                        <span class="home__data-subtitle">Discover your Campus Life</span>
                        <h1 class="home__data-title">Explore The <br> Best <b>Beautiful <br> Campus</b></h1>
                        

                    </div>
                    
                    <div class="home__social">
                        <a href="https://www.facebook.com/" target="_blank" class="home__social-link">
                            <i class="ri-facebook-box-fill"></i>
                        </a>
                        <a href="https://www.instagram.com/" target="_blank" class="home__social-link">
                            <i class="ri-instagram-fill"></i>
                        </a>
                        <a href="https://twitter.com/" target="_blank" class="home__social-link">
                            <i class="ri-twitter-fill"></i>
                        </a>
                    </div>

                    <div class="home__info">
                        <div>
                            <span class="home__info-title">5 best places to visit</span>
                            <a href="./gallery.html" class="button button--flex button--link home__info-button">
                                More <i class="ri-arrow-right-line"></i>
                            </a>
                        </div>

                        <div class="home__info-overlay">
                            <img src="./images/BACKEND-1.jpeg" alt="" class="home__info-img">
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== ABOUT ====================-->
            <section class="about section" id="about">
                <div class="about__container container grid">
                    <div class="about__data">
                        <h2 class="section__title about__title">Academics Section</h2>
                        <p class="about__description">
                          View Semester Result,Download Admit Card and Syllabus and Routine,Exam Form Fill Up Link is Here
                        </p>
                        <div class="sbtn-1">
                          <button class="drpdwn">Academics</button>
                            <div class="content">
                              <a href="http://jisexams.in/JISEXAMS/StudentServices/frmViewStudentGradeCardResult.aspx"target="_blank">View Result</a>
                              <a href="http://jisexams.in/JISEXAMS/LoginScreens/frmStudentLoginPage.aspx"target="_blank">Form FillUp Link</a>
                              <a href="http://jisexams.in/JISEXAMS/StudentServices/frmStudAdmitCard.aspx"target="_blank">Download Admit Card</a>
                         
                         <%
                         if(syllabus==null){
                         %>
                       <a href="" style="pointer-events: none" target="_self">Download Syllabus</a>
                         
                         <%
                         }else{
                         %>
                     <a href="/College_Final_Year_Project/view?action=syllabusDownload&id=<%=syllabus %>"  target="_self">Download Syllabus</a>
                         
                         <%
                         }
                         %>
                         
                         <%
                         if(routine==null){
                         %>
                            <a href="" style="pointer-events: none" target="_self">Download Routine</a>  
                         
                         <%
                         }else{
                         %>
                            <a href="/College_Final_Year_Project/view?action=routineDownload&id=<%=routine %>" target="_self">Download Routine</a>  
                         
                         <%
                         }
                         %>
                         
                            </div>
                          
                        </div>
                    </div>

                    <div class="about__img">
                        <div class="about__img-overlay">
                            <img src="./images/BACKEND-1.jpeg" alt="" class="about__img-one">
                        </div>

                        <div class="about__img-overlay">
                            <img src="./fpdf/gnit5.jpg" alt="" class="about__img-two">
                        </div>
                    </div>
                </div>
            </section><br>
            <hr>
            
            <!--==================== DISCOVER ====================-->
            <section class="products" id="profile">
              <h2 style="text-align: center; color: mediumblue;font-weight: 900;font-size: 30px;font-family: 'Times New Roman', Times, serif;text-decoration: wavy;border-bottom: 2px solid black;">Profile</h2>
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-4">
               <img class="logo" src="data:image/jpg;base64,<%= studentImage%>" style="margin-top:10%;margin-left:20%;width:50%; height:70%"> 
                  </div>
                  <div class="col-md-3">
                    <div class="student">
                      <label class="details">Students Name :</label><br>
                      <hr>
                      <label class="details">I.D Number :</label><br>
                      <hr>
                      <label class="details">Course :</label><br>
                      <hr>
                      <label class="details">Department :</label><br>
                      <hr>
                      <label class="details">Year:</label><br>
                      <hr>
                      <label class="details">Gender :</label><br>
                      <hr>
                      <label class="details">Date Of Birth :</label>
                      
                    </div>
                   
                  </div>
                  <div class="col-md-5">
                    <div class="student">
                      <label type="label" class="box" name="student_name"><b><%= student.getStudentName() %></b></label><br> 
                      <hr>
                      <label type="text" class="box" name="student_id" ><b><%= student.getIdNumber() %></b></label><br>
                      <hr>
                      <label type="text" class="box" name="student_course" ><b><%= student.getCourseTypeName() %></b></label><br>
                      <hr>
                      <label type="text"class="box" name="student_depertment" ><b><%= student.getDepartment() %></b></label><br>
                     <hr>
                     <label type="text"class="box" name="student_Year" ><b><%= (student.getYear()==1)?( student.getYear()+"st Year"):(student.getYear()==2)?( student.getYear()+"nd Year"):(student.getYear()==3)?( student.getYear()+"rd Year"):student.getYear()+"th Year" %></b></label><br>
                     <hr>
                     <label type="text"class="box" name="student_gender" ><b><%= student.getGender() %></b></label>
                      <hr>
                      <label type="text" class="box"  name="student_dateofbirth" ><b><%= student.getDOB() %></b></label>
                    </div>
                  </div>
                </div>
              </div>
               </section>
        </main>

        <!--==================== FOOTER ====================-->
        <footer class="footer section">
            <div class="footer__container container grid">
                <div class="footer__content grid">
                    <div class="footer__data">
                        <h3 class="footer__title">GNIT Campus</h3>
                        <p class="footer__description">Most Beautiful Green Campus.
                        </p>
                   
                    </div>
    
                    <div class="footer__data">
                        <h3 class="footer__subtitle" style="text-align:center;">Contact Us</h3>
                        <ul>
                            <li class="footer__item">
                                <a href="" class="footer__link">157/F Nilgunj Road, Panihati, Kolkata-700114, West Bengal
                                  </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__link">Phone : 033 2523 3900</a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__link">Email : Info.Gnit@Jisgroup.Org</a>
                            </li>
                        </ul>
                    </div>
    
                    <div class="footer__data" >
                        <h3 class="footer__subtitle" style="text-align:center;">Quick Links</h3>
                        <ul>
                           
                            <li class="footer__item">
                                <a href="./studentClassroom.jsp" target="_self" class="footer__link">Class Room</a>
                            </li>
                            <li class="footer__item">
                             <%
                        if(feedbackLink==null){
                        %>
                                <a href="" style="pointer-events: none"  class="footer__link">Feedback</a>
                               <%
                        }else{
                               %>
                                <a href="<%=feedbackLink %>" target="_blank" class="footer__link">Feedback</a>
                            <%
                        }
                            %>   
                            
                            
                            </li>
                            <li class="footer__item">
                              <%
                        if(subjectChoice==null){
                        %>
                        <a href="" style="pointer-events: none" class="footer__link">Choose Subject</a>
                               <%
                        }else{
                               %>
                        <a href="<%=subjectChoice %>" target="_blank" class="footer__link">Choose Subject</a>
                            <%
                        }
                            %>   
                            </li>
                        </ul>
                    </div>
    
                  
                </div>

                <div class="footer__rights" style="margin-left:400px;>
                    <p class="footer__copy" ">@Developer - Sornali Hazra & Satish Singh</p>
                    
                </div>
            </div>
        </footer>

         <!--========== SCROLL UP ==========-->
        <a href="#" class="scrollup" id="scroll-up">
            <i class="ri-arrow-up-line scrollup__icon"></i>
        </a>

        <!--=============== SCROLL REVEAL===============-->
        <script src="./js/scrol.min.js"></script>
        
        <!--=============== SWIPER JS ===============-->
        <script src="./js/swiper-bundle.min.js"></script>

        <!--=============== MAIN JS ===============-->
        <script src="./js/studentmain.js">
          
        </script>
    </body>
</html>    