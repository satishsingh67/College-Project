<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

      

        <!--=============== REMIXICONS ===============-->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        
        <!--=============== SWIPER CSS ===============-->
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <script src="./lib/jquery.min.js"></script>
        <script src="./lib/sweetalert.min.js"></script>
        
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
  font-size: 1.2rem;
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
    width: 70%;
    height: 100%;
    box-shadow: -1px 0 4px rgba(14, 55, 63, 0.15);
    padding: 3rem;
    transition: .4s;
  }
}

.nav__list {
  display: flex;
  flex-direction: column;
  row-gap: 2.5rem;
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
.modal {
          display: none;
          /* Hidden by default */
          position:fixed;
          /* Stay in place */
          z-index: 1;
          /* Sit on top */
          padding-top: 100px;
          /* Location of the box */
          left: 0;
          top: 0;
          width: 100%;
          /* Full width */
          height: 100%;
          /* Full height */
          overflow: auto;
          /* Enable scroll if needed */
       /*   background-color: rgb(0, 0, 0);*/
          /* Fallback color */
        /*  background-color: rgba(0, 0, 0, 0.4);
          /* Black w/ opacity */
        }
    
        /* Modal Content */
        .modal-content {
        
          
          margin: auto;
       
          padding: 20px;
          border: 1px solid #888;
          width: 40%;
          height: 80%;
          background-color: rgb(213, 249, 250);
          box-shadow: 5 px 5px 5px solid red;
          text-align: justify;
          padding-left: 20px;

        }
    
        /* The Close Button */
        .close {
           
          color: #ffffff;
          float: right;
          margin-left: 97%;
          margin-top: -3%;
          font-size: 28px;
          font-weight: bold;
          background-color: black;
          border-radius:5px ;
          
        }
    
        .close:hover,
        .close:focus {
          color: rgb(215, 230, 17);
          text-decoration: none;
          cursor: pointer;
        }
        
        
             /* The Modal (background) */
    .modal1 {
      display: none;
      /* Hidden by default */
      position: fixed;
      /* Stay in place */
      z-index: 1;
      /* Sit on top */
      padding-top: 100px;
      /* Location of the box */
      left: 0;
      top: 0;
      width: 100%;
      /* Full width */
      height: 100%;
      /* Full height */
      overflow: auto;
      /* Enable scroll if needed */
      background-color: rgb(0, 0, 0);
      /* Fallback color */
      background-color: rgba(0, 0, 0, 0.4);
      /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content1 {
      background-color: #fffff0;
      margin: auto;
      margin-top: 10%;
      padding: 20px;
      border: 1px solid #fffff0;
      width: 35%;
      height: 35%;
    }

    /* The Close Button */
    .close {
      color: #aaaaaa;
      float: right;
      margin-left: 97%;
      margin-top: -3%;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
    }


    .loader {
      animation: rotate 1s infinite;
      height: 50px;
      width: 50px;
    }

    .loader:before,
    .loader:after {
      border-radius: 50%;
      content: '';
      display: block;
      height: 20px;
      width: 20px;
    }

    .loader:before {
      animation: ball1 1.5s infinite;
      background-color: #cb2025;
      box-shadow: 30px 0 0 #f8b334;
      margin-bottom: 10px;
    }

    .loader:after {
      animation: ball2 1.5s infinite;
      background-color: #00a096;
      box-shadow: 30px 0 0 #97bf0d;
    }

    @keyframes rotate {
      0% {
        -webkit-transform: rotate(0deg) scale(0.8);
        -moz-transform: rotate(0deg) scale(0.8);
      }

      50% {
        -webkit-transform: rotate(360deg) scale(1.2);
        -moz-transform: rotate(360deg) scale(1.2);
      }

      100% {
        -webkit-transform: rotate(720deg) scale(0.8);
        -moz-transform: rotate(720deg) scale(0.8);
      }
    }

    @keyframes ball1 {
      0% {
        box-shadow: 30px 0 0 #f8b334;
      }

      50% {
        box-shadow: 0 0 0 #f8b334;
        margin-bottom: 0;
        -webkit-transform: translate(15px, 15px);
        -moz-transform: translate(15px, 15px);
      }

      100% {
        box-shadow: 30px 0 0 #f8b334;
        margin-bottom: 10px;
      }
    }

    @keyframes ball2 {
      0% {
        box-shadow: 30px 0 0 #97bf0d;
      }

      50% {
        box-shadow: 0 0 0 #97bf0d;
        margin-top: -20px;
        -webkit-transform: translate(15px, 15px);
        -moz-transform: translate(15px, 15px);
      }

      100% {
        box-shadow: 30px 0 0 #97bf0d;
        margin-top: 0;
      }
    } 
        
        
        
</style>
        <title>Canvas</title>
    </head>
    <body>
        <header class="header" id="header">
            <nav class="nav container">
                <a href="#" class="nav__logo"><img src="./images/GNIT_Kolkata_logo.png"></a>

                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="#home" class="nav__link active-link">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="#place" class="nav__link">Images</a>
                        </li>
                        <li class="nav__item">
                            <a href="./canvasWriteUp.jsp" class="nav__link">WriteUps</a>
                        </li>
                        <li class="nav__item">
                            <a href="./canvasSocialService.jsp" class="nav__link">Social Service</a>
                        </li>
                        <li class="nav__item">
                            <a href="./canvasBeyondCurricualm.jsp" class="nav__link">Beyond Curriculum</a>
                        </li>
                    </ul>

                    

                    <i class="ri-close-line nav__close" id="nav-close"></i>
                </div>

                <div class="nav__toggle" id="nav-toggle">
                    <i class="ri-function-line"></i>
                </div>
            </nav>
        </header>

        <main class="main">
            <!--==================== HOME ====================-->
            <section class="home" id="home">
                <img src="./fpdf/gnit3.jpg" alt="" class="home__img">

                <div class="home__container container grid">
                    <div class="home__data">
                        <span class="home__data-subtitle">Discover your Campus Life</span>
                        <h1 class="home__data-title">Explore All <br> Events <b>of <br>Gnit Campus</b></h1>
                        

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
                            <span class="home__info-title"> best events to Enjoy</span>
                            <a href="" class="button button--flex button--link home__info-button">
                                More <i class="ri-arrow-right-line"></i>
                            </a>
                        </div>

                        <div class="home__info-overlay">
                            <img src="./images/clg-1/f-3.jpg" alt="" class="home__info-img">
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== ABOUT ====================-->
            <section class="about section" id="about">
                <div class="about__container container grid">
                    <div class="about__data">
                        <h2 class="section__title about__title">About Events</h2>
                        <p class="about__description" style="text-align: justify;">
                            The events Section is made to keep an update on the events held in the university. The admin will be having the access to upload the event-related content. The event sections consist of Gallery, Beyond Curriculums, Social Service, Articles and New Post. 
                              Gallery: In this section, the uploaded images and videos of various events such as freshers, fest, tech-fest and many more can be viewed by the users. 
                               Beyond Curriculums: In this section, the beyond curriculum activities such as painting, photography or art & craft made by the students are uploaded here and can be viewed by the users.
                               Social Service: In this section, the images and videos of the Social Services taken by the university can be viewed by the users.
                                   Articles: In this section, the users can view articles written and submitted by the students.
                                 New Post: In this section, the admin will be having the access to upload all the event-related credentials and new content posts in their particular sections

                        </p>
                        <a href="#" id="btnn" class="button">Upload Your Post</a>
                    </div>

                    <div class="about__img">
                        <div class="about__img-overlay">
                            <img src="./images/clg-1/f-7.jpg" alt="" class="about__img-one">
                        </div>

                        <div class="about__img-overlay">
                            <img src="./images/clg-1/f-5.jpg" alt="" class="about__img-two">
                        </div>
                    </div>
                </div>
            </section>

            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                  <span class="close" id="s" >&times;</span>
                 
                  <div id="tableDiv" >
                    
                    <form id="canvasForm">
                    
                    <label for="cars">Relation With The Institute:<strong style="color:red;">*</strong></label>&nbsp;&nbsp;

                    <select name="personType" id="type"  style="text-align:center;width: 200px;height: 25px; background-color: rgb(250, 247, 245);font-weight: bold;font-size: 15px;">
                    <option>--Select--</option>
                    <option value="Student">Student</option>
                    <option value="Alumini">Alumini</option>
                    <option value="Teacher">Teacher</option>
                    <option value="Other">Other</option>
                    </select><br><br>
                    <label for="cars">Name:<strong style="color:red;">*</strong></label>&nbsp;&nbsp;<input name="name"  style="width: 200px;height: 25px;margin-left:155px; background-color: rgb(250, 247, 245);font-weight: bold;font-size: 15px;"type="text"><br><br>
                    <label for="cars">Department:<strong style="color:red;">*</strong></label>&nbsp;&nbsp;

                    <select name="department" id="department" style="width: 200px;height: 25px;margin-left:105px; background-color: rgb(250, 247, 245);font-weight: bold;font-size: 15px;">
                     <option>--Select--</option>
               
                    </select><br><br>
                    <label for="cars">ID(Student Id/Teacher Id):<strong style="color:red;">*</strong></label>&nbsp;&nbsp;<input name="id"  style="width: 200px;height: 25px;margin-left:15px; background-color: rgb(250, 247, 245);font-weight: bold;font-size: 15px;" type="text"><br><br>
                    <label for="cars">Post Type:<strong style="color:red;">*</strong></label>&nbsp;&nbsp;

                    <select name="postType" id="postType" style="margin-left:125px;width: 200px;height: 25px; background-color: rgb(250, 247, 245);font-weight: bold;font-size: 15px;">
                   <option>--Select--</option>
                   
                    </select>
                  <br> <br>
                   <label for="cars">Write Something:</label>&nbsp;&nbsp;<input name="title" style="margin-left:85px;width: 200px;height: 25px; background-color: rgb(250, 247, 245);font-weight: bold;font-size: 15px;"type="text" placeholder="Give Title of Your Write Up"><br><br>
                  
                    <label for="cars">File Type:<strong style="color:red;">*</strong></label>&nbsp;&nbsp;

                    <select name="fileType" id="fileType" style="margin-left:134px;width: 200px;height: 25px; background-color: rgb(250, 247, 245);font-weight: bold;font-size: 15px;">
                    <option>--Select--</option>
                    </select><br><br>
                    <label for="cars">Select Your File:<strong style="color:red;">*</strong></label> &nbsp;&nbsp;<input name="file" style="margin-left:85px;" type="file"><br><br>
                    <button style=" background-color: rgb(67, 156, 129); color: white;margin-left:120px; width: 150px;height: 50px;font-weight: bold; box-shadow: 5px 5px 5px 5px gray;" id="submitCanvasForm">Submit for Review</button> &nbsp;&nbsp;&nbsp;&nbsp;<button style="background-color: #333; color: white; height: 50px;width: 150px;font-weight: bold; box-shadow: 5px 5px 5px 5px gray;" id="cancelButton">Cancel</button>
                 
                    
                    </form>
                 
                 
                  </div>
        
        
                </div>
            
              </div>
 
            <h2 class="section__title" style="background-color: #e84393; height: 50px; font-size: 40px; letter-spacing: 5px;">Images</h2>
            

                    <!--==================== PLACES ====================-->
            <section class="place section" id="place" style="border:1px solid red;">
               

                <div class="place__container container grid"  id="test12" style="margin-top:-100px;">
                   
                </div>
            </section>
            <br>
            <h2 class="section__title" style="background-color: #e84393; height: 50px; font-size: 40px; letter-spacing: 5px;">Videos</h2>
            

                    <!--==================== PLACES ====================-->
            <section class="place section" id="place">
               

                <div class="place__container container grid" style="margin-top:-100px;">
                    <!--==================== PLACES CARD 1 ====================-->
                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <h3 class="place__title">Gnit Campus</h3>
                            </span>

                            <div class="place__data">
                                
                                <span class="place__subtitle">Sornali Hazra</span>
                                <span class="place__subtitle">4th Year ECE-2</span>
                               
                            </div>
                        </div>

                        
                    </div>

                    <!--==================== PLACES CARD 2 ====================-->
                    <div class="place__card">
                        <video src="./images/video/video_2021-12-21_02-14-51.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <h3 class="place__title">Gnit Cultural Fest</h3>
                            </span>

                            <div class="place__data">
                                
                                <span class="place__price">Sornali Hazra</span>
                                <span class="place__subtitle">4th Year ECE-2</span>
                            </div>
                        </div>

                       
                               
                    </div>

                    <!--==================== PLACES CARD 3 ====================-->
                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <span class="place__rating-number">4,9</span>
                            </span>

                            <div class="place__data">
                                <h3 class="place__title">Sodepur</h3>
                                <span class="place__subtitle">Kolkata</span>
                                
                            </div>
                        </div>

                       
                    </div>

                    <!--==================== PLACES CARD 4 ====================-->
                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <span class="place__rating-number">4,8</span>
                            </span>

                            <div class="place__data">
                                <h3 class="place__title">GNIT</h3>
                                <span class="place__subtitle">Sodepur,Kolkata</span>
                               
                            </div>
                        </div>

                       
                    </div>
                      


                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <span class="place__rating-number">4,8</span>
                            </span>

                            <div class="place__data">
                                <h3 class="place__title">GNIT</h3>
                                <span class="place__subtitle">Sodepur,Kolkata</span>
                               
                            </div>
                        </div>

                        
                    </div>
                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <span class="place__rating-number">4,8</span>
                            </span>

                            <div class="place__data">
                                <h3 class="place__title">GNIT</h3>
                                <span class="place__subtitle">Sodepur,Kolkata</span>
                               
                            </div>
                        </div>

                       
                    </div>

                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <span class="place__rating-number">4,8</span>
                            </span>

                            <div class="place__data">
                                <h3 class="place__title">GNIT</h3>
                                <span class="place__subtitle">Sodepur,Kolkata</span>
                               
                            </div>
                        </div>

                       
                    </div>
                      

                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <span class="place__rating-number">4,8</span>
                            </span>

                            <div class="place__data">
                                <h3 class="place__title">GNIT</h3>
                                <span class="place__subtitle">Sodepur,Kolkata</span>
                               
                            </div>
                        </div>

                       
                    </div>
                      


                    <!--==================== PLACES CARD 5 ====================-->
                    <div class="place__card">
                        <video src="./images/video/Video - Google Photos_2.mp4" controls type="video/mp4" alt="" class="place__img">
                        
                        <div class="place__content">
                            <span class="place__rating">
                                <i class="ri-star-line place__rating-icon"></i>
                                <span class="place__rating-number">4,8</span>
                            </span>

                            <div class="place__data">
                                <h3 class="place__title">GNIT</h3>
                                <span class="place__subtitle">Sodepur</span>
                                <span class="place__price">Kolkata</span>
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
                        <div>
                            <a href="https://www.facebook.com/" target="_blank" class="footer__social">
                                <i class="ri-facebook-box-fill"></i>
                            </a>
                            <a href="https://twitter.com/" target="_blank" class="footer__social">
                                <i class="ri-twitter-fill"></i>
                            </a>
                            <a href="https://www.instagram.com/" target="_blank" class="footer__social">
                                <i class="ri-instagram-fill"></i>
                            </a>
                            <a href="https://www.youtube.com/" target="_blank" class="footer__social">
                                <i class="ri-youtube-fill"></i>
                            </a>
                        </div>
                    </div>
    
                    <div class="footer__data">
                        <h3 class="footer__subtitle">Contact Us</h3>
                        <ul>
                            <li class="footer__item">
                                <a href="" class="footer__link">157/F Nilgunj Road, Panihati, Kolkata-700114, West Bengal
                                  </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__link">Phone : 033 2523 3900</a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__link">Email : info.gnit@jisgroup.org</a>
                            </li>
                        </ul>
                    </div>
    
                    <div class="footer__data">
                        <h3 class="footer__subtitle">Quick Links</h3>
                        <ul>
                            <li class="footer__item">
                                <a href="./aboutus.html" class="footer__link">About Us</a>
                            </li>
                            <li class="footer__item">
                                <a href="./eventblog.html" class="footer__link">Events/Blog</a>
                            </li>
                            <li class="footer__item">
                                <a href="./depertment.html" class="footer__link">Departments</a>
                            </li>
                        </ul>
                    </div>
    
                    <div class="footer__data">
                        <h3 class="footer__subtitle">Exam Links</h3>
                        <ul>
                            <li class="footer__item">
                                <a href="" class="footer__link">WBJEE</a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__link">JEE Main</a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__link">CEE Ampai</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="footer__rights">
                    <p class="footer__copy" >Developer:@Sornali_Hazra & @Satish Singh</p>
                </div>
            </div>
        </footer>

         <!--========== SCROLL UP ==========-->
        <a href="#" class="scrollup" id="scroll-up">
            <i class="ri-arrow-up-line scrollup__icon"></i>
        </a>

    <!--==========Loader Model Start ==========-->
  <div id="myModal1" class="modal1">

      <!-- Modal content -->
      <div class="modal-content1">
        <span class="close" style="display: none;">&times;</span>
        <div class="loader1" style="display:none;">
          <div class="loader" style="margin: auto;margin-left:40%;margin-top:7%;">
          </div>
  
          <h5
            style="margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;font-size:18px;">
            Please wait....</h5>
        </div>
      </div>
      <!--==========Loader Model End ==========-->
  





        <!--=============== SCROLL REVEAL===============-->
        <script src="./js/scrol.min.js"></script>
        
        <!--=============== SWIPER JS ===============-->
        <script src="./js/swiper-bundle.min.js"></script>

        <!--=============== MAIN JS ===============-->
        <script src="./js/campus.js">
          
        </script>
        
               <script>
        
     $(document).ready(function(){
    	 dropDowns();
       $('#myModal').show();
       
       for(let i=0;i<10;i++){
       	
       	var card=' <div class="place__card" style="width:470px;">'
              + '<img src="./fpdf/gnit3.jpg" alt="" class="place__img">'
           +'<div class="place__content">'
               +'<span class="place__rating">'
               +'  <i class="ri-star-line place__rating-icon"></i>'
               +'  <h3 class="place__title">Gnit Campus</h3>'
               +'  </span>'

               +' <div class="place__data">'
               +'     <h3 class="place__title">GNIT Campus</h3>'
               +'   <span class="place__subtitle">Sornali Hazra</span>'
               +'   <span class="place__subtitle">4th Year ECE-2</span>'
                  
               +'  </div>'
               +'  </div>'
               +'<button class="button button--flex place__button">'
               +' <i class="ri-arrow-right-line"></i>'
               +'</button>'
               +'</div>';
               
               $('#test12').append(card);  
               
              
       }

	
      });
        
        
        
        $("#btnn").click(function (event) {
          $('#myModal').show();
               
        
        });
        $("#s").click(function (event) {
          $('#myModal').hide();
        });
        
        $("#cancelButton").click(function (event) {
        	event.preventDefault();
        	$('#myModal').hide();
          });
       
        $( "#postType" ).click(function() {
        	
        	var type=$('#postType').val();
        	console.log(type =="2" || type=="3");
        	if(type =="2" || type=="3")
        	{
        		  alert(type);
        	}
        	
        	});
        
        
        
        function dropDowns(){
        	
        	 $.ajax({
   		      type: "GET",
   		      url:"/College_Final_Year_Project/dropdown?action=canvas",
   		      success: function (data, textStatus, jqXHR) {
   		    	  var JsonData= jQuery.parseJSON(data);
   		    	  console.log(JsonData==null);
   		    	 if(JsonData==null){
   		    		 $('#postType').append(new Option("No Option is Present",""));
   		    		 $('#department').append(new Option("No Option is Present",""));
   		    		 $('#fileType').append(new Option("No Option is Present", ""));
   		    	 }
   		    	 else{
   		          $(JsonData.postType).each(function (index, item) {  
   		         $('#postType').append(new Option(item.name.trim(), item.pkId));
   		          });
   		       $(JsonData.department).each(function (index, item) {  
  		         $('#department').append(new Option(item.name.trim(), item.pkId));
  		          });
   		    $(JsonData.fileType).each(function (index, item) {  
		         $('#fileType').append(new Option(item.name.trim(), item.pkId));
		          });
   		        	  
   		    	 }
   		      },
   		      error: function (jqXHR, textStatus, errorThrown) {
   	       
   		      }
   		    });  

        }
              
        $('#submitCanvasForm').click(function (event){
  		    event.preventDefault();
  		  $('#myModal1').show();
  		//Calling Loader
  		$(".loader1").show();

  		    var form = $('#canvasForm')[0];
  		    // Create an FormData object 
  		    var data = new FormData(form);
  		    data.append("action", "canvasForm");
  		    // disabled the submit button
  		    $("#submitCanvasForm").prop("disabled", true);
  		    $.ajax({
  		      type: "POST",
  		      enctype: 'multipart/form-data',
  		      url: "/College_Final_Year_Project/canvas",
  		      data: data,
  		      processData: false,
  		      contentType: false,
  		      success: function (data, textStatus, jqXHR) {
  		    	  $(".loader1").hide();
    		        $('#myModal1').hide();
    		        if (data.trim().includes("Successfully")) {
    		          swal("Done", data, "success");
    		        $('#canvasForm')[0].reset();
    		        }
    		        else {
    		          swal("Error", data, "error");
    		        }
  		         
    		        $("#submitCanvasForm").prop("disabled", false);
  		      },
  		      error: function (jqXHR, textStatus, errorThrown) {
  		        $(".loader1").hide();
  		        $('#myModal1').hide();
  		        swal("Error", data, "error");
  		        $("#submitCanvasForm").prop("disabled", false);
  		      }
  		    });
    });
        
        
        
        </script>
        
        
        
        
    </body>
</html>