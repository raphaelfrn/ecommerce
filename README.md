# Context
This project is a full-stack ecommerce application created using J2E, HTML, CSS and JavaScript.
This app is a student project made at Afpa in 2022, created by [Mauduit-0] and myself. This project goes way beyond what was asked and is in fact a complete application.
With 18 tables, and an administration menu, it's possible to Create Read Update or Delete anything on the site.
It is possible to manage products, purchase, orders, invoices, categories, subcategories, research every products on the site, customize videos and images sliders, manage customers, delivery adresses linked to customers and use a wishlist.

## Required
Java 17
<br/>
[Tomcat] 9
<br/>
Eclipse 2022-06
<br/>
Xampp (or whatever you want for mysql db)

## How to setup:

```sh
git clone git@github.com:raphaelfrn/ecommerce.git
```


Make sure to create a table "ecommerce" in Xampp and import the eCommerce.sql file, otherwise it won't load
in eclipse, select import project from files, and add the ecommerce file.
Right click on the project in eclipse, and just click "Run on Server"
If you face a 404 try adding /home to the url



[Mauduit-0]: <https://github.com/Mauduit-O>
[Tomcat]: <https://tomcat.apache.org/download-90.cgi>
