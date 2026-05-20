<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NovaMart UI Upgrade</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
*{margin:0;padding:0;box-sizing:border-box;}

body{
    font-family: 'Inter', sans-serif;
    background:#0b0f1a;
    color:#fff;
}

/* HEADER */
header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 40px;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(12px);
}

.logo{
    font-size:24px;
    font-weight:800;
    background:linear-gradient(135deg,#7c3aed,#22c55e);
    -webkit-background-clip:text;
    color:transparent;
}

/* SEARCH */
.search{
    background:#1a2235;
    padding:10px 16px;
    border-radius:30px;
    display:flex;
    gap:10px;
    align-items:center;
}

.search input{
    background:none;
    border:none;
    color:white;
    outline:none;
}

/* HERO */
.hero{
    text-align:center;
    padding:80px 20px;
}

.hero h1{
    font-size:56px;
    background:linear-gradient(135deg,#7c3aed,#22c55e);
    -webkit-background-clip:text;
    color:transparent;
}

.btn{
    margin-top:20px;
    padding:12px 28px;
    border-radius:999px;
    border:none;
    background:linear-gradient(135deg,#7c3aed,#22c55e);
    color:white;
    cursor:pointer;
}

/* CATEGORY */
.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
    gap:20px;
    padding:40px;
}

.card{
    background:#121826;
    padding:20px;
    border-radius:16px;
    text-align:center;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 10px 30px rgba(0,0,0,0.5);
}

/* PRODUCTS */
.products{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:30px;
    padding:40px;
}

.product{
    background:#121826;
    border-radius:16px;
    overflow:hidden;
    transition:0.3s;
}

.product:hover{
    transform:translateY(-10px);
}

.product img{
    width:100%;
    height:220px;
    object-fit:cover;
}

.info{
    padding:16px;
}

.price{
    color:#22c55e;
    font-weight:700;
}

.old{
    text-decoration:line-through;
    color:gray;
    font-size:12px;
}

/* FLASH SALE */
.sale{
    margin:40px;
    padding:40px;
    border-radius:20px;
    background:linear-gradient(135deg,#1a2235,#0b0f1a);
}

/* FOOTER */
footer{
    padding:40px;
    text-align:center;
    border-top:1px solid #222;
}
</style>
</head>

<body>

<header>
    <div class="logo">NovaMart</div>

    <div class="search">
        <i class="fa fa-search"></i>
        <input type="text" id="search" placeholder="Search...">
    </div>

    <div>
        🛒 <span id="cart">0</span>
    </div>
</header>

<section class="hero">
    <h1>Modern Shopping Experience</h1>
    <button class="btn" onclick="scrollToProducts()">Shop Now</button>
</section>

<section class="grid" id="categories"></section>

<section class="products" id="products"></section>

<section class="sale">
    <h2>⚡ Flash Sale</h2>
    <p>MacBook Pro M3 - Special Discount</p>
    <h1>$1299 <span class="old">$1699</span></h1>
    <button class="btn" onclick="addToCart()">Grab Deal</button>
</section>

<footer>
    © 2026 NovaMart
</footer>

<script>
const categories=[
    {name:"Audio"},
    {name:"Gaming"},
    {name:"Fashion"},
    {name:"Smart Home"}
];

const products=[
    {id:1,title:"Sony XM6",price:399,old:499,img:"https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb"},
    {id:2,title:"Apple Watch",price:749,old:799,img:"https://images.unsplash.com/photo-1546868871-7041f2a55e12"},
    {id:3,title:"Gaming Laptop",price:2799,old:3199,img:"https://images.unsplash.com/photo-1593642632823-8f785ba67e45"},
    {id:4,title:"Hoodie",price:120,old:200,img:"https://images.unsplash.com/photo-1556905055-8f358a7a47b2"}
];

let cart=0;

/* RENDER */
function renderCategories(){
    document.getElementById("categories").innerHTML=
    categories.map(c=>`<div class="card">${c.name}</div>`).join('');
}

function renderProducts(list){
    document.getElementById("products").innerHTML=
    list.map(p=>`
    <div class="product">
        <img src="${p.img}">
        <div class="info">
            <h3>${p.title}</h3>
            <div class="price">$${p.price} <span class="old">$${p.old}</span></div>
            <button class="btn" onclick="addToCart()">Add</button>
        </div>
    </div>`).join('');
}

/* CART */
function addToCart(){
    cart++;
    document.getElementById("cart").innerText=cart;
}

/* SEARCH */
document.getElementById("search").addEventListener("input",e=>{
    const q=e.target.value.toLowerCase();
    const filtered=products.filter(p=>p.title.toLowerCase().includes(q));
    renderProducts(filtered);
});

/* SCROLL */
function scrollToProducts(){
    document.getElementById("products").scrollIntoView({behavior:"smooth"});
}

/* INIT */
renderCategories();
renderProducts(products);
</script>

</body>
</html>
